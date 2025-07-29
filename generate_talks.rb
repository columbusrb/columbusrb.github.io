#!/usr/bin/env ruby

require 'csv'
require 'date'
require 'fileutils'

# Script to generate individual talk files from CSV data.
# This creates markdown files for each talk in the _posts folder similar to existing posts.

def slugify(text)
  return "" if text.nil? || text.empty?
  
  # Convert to lowercase and replace spaces with hyphens
  slug = text.downcase.gsub(/[^\w\s-]/, '').gsub(/[-\s]+/, '-')
  slug.strip.gsub(/^-+|-+$/, '')
end

def parse_csv_files
  meetings = {}
  talks = {}
  
  # Parse meetings CSV
  CSV.foreach('dataclips_ypsggzpkdbrrrmdkbevuiukqrynr.csv', headers: true) do |row|
    meeting_id = row['id']
    next unless row['time'] && !row['time'].empty?
    
    begin
      meeting_date = DateTime.parse(row['time'])
      meetings[meeting_id] = {
        'id' => meeting_id,
        'date' => meeting_date,
        'format' => row['format'] || 'Meeting'
      }
    rescue ArgumentError
      puts "Warning: Could not parse date for meeting #{meeting_id}: #{row['time']}"
    end
  end
  
  # Parse talks CSV
  CSV.foreach('dataclips_znaoelrgobmqmhtsrdvexhmfhonv.csv', headers: true) do |row|
    talk_id = row['id']
    meeting_id = row['meeting_id']
    
    next unless meetings[meeting_id]
    
    talks[talk_id] = {
      'id' => talk_id,
      'meeting_id' => meeting_id,
      'name' => row['name'],
      'title' => row['title'],
      'url' => row['url'],
      'twitter' => row['twitter'],
      'twitter_avatar_url' => row['twitter_avatar_url'],
      'meeting_date' => meetings[meeting_id]['date'],
      'meeting_format' => meetings[meeting_id]['format']
    }
  end
  
  [meetings, talks]
end

def generate_speaker_id(name)
  return "" if name.nil? || name.empty?
  
  # Convert to lowercase and remove special characters
  speaker_id = name.downcase.gsub(/[^\w\s]/, '').gsub(/\s+/, '')
  speaker_id
end

def create_talk_file(talk_data, output_dir)
  meeting_date = talk_data['meeting_date']
  date_str = meeting_date.strftime('%Y-%m-%d')
  
  # Create filename
  title_slug = slugify(talk_data['title'])
  title_slug = "talk-#{talk_data['id']}" if title_slug.empty?
  
  filename = "#{date_str}-#{title_slug}.md"
  filepath = File.join(output_dir, filename)
  
  # Generate speaker ID
  speaker_id = generate_speaker_id(talk_data['name'])
  
  # Create front matter - using post layout instead of talk layout
  front_matter = <<~YAML
    ---
    layout: post
    title: "#{talk_data['title']}"
    date: #{date_str}
    meeting_id: #{talk_data['meeting_id']}
    meeting_format: #{talk_data['meeting_format']}
  YAML
  
  front_matter += "link: #{talk_data['url']}\n" if talk_data['url'] && !talk_data['url'].empty?
  
  # Add speakers array similar to existing posts
  if !speaker_id.empty?
    front_matter += "speakers:\n"
    front_matter += "  - #{speaker_id}\n"
  end
  
  front_matter += "---\n\n"
  
  # Create content similar to existing posts
  content = ""
  
  if talk_data['url'] && !talk_data['url'].empty?
    content += "**Link:** [#{talk_data['url']}](#{talk_data['url']})\n\n"
  end
  
  if talk_data['twitter'] && !talk_data['twitter'].empty?
    content += "**Speaker Twitter:** #{talk_data['twitter']}\n\n"
  end
  
  content += "**Meeting Format:** #{talk_data['meeting_format']}\n\n"
  
  # Add a placeholder for talk description
  content += "<!-- Add talk description here -->\n"
  
  # Write file
  File.write(filepath, front_matter + content)
  
  filepath
end

def update_speakers_yml(talks_data, speakers_file)
  existing_speakers = {}
  
  # Read existing speakers
  if File.exist?(speakers_file)
    content = File.read(speakers_file)
    content.each_line do |line|
      if line.include?(':') && !line.start_with?(' ') && !line.start_with?('#')
        speaker_id = line.split(':').first.strip
        existing_speakers[speaker_id] = true
      end
    end
  end
  
  # Find new speakers
  new_speakers = {}
  talks_data.each_value do |talk|
    speaker_id = generate_speaker_id(talk['name'])
    next if speaker_id.empty? || existing_speakers[speaker_id] || new_speakers[speaker_id]
    
    new_speakers[speaker_id] = talk['name']
  end
  
  # Append new speakers to the file
  if new_speakers.any?
    File.open(speakers_file, 'a') do |f|
      f.write("\n")
      new_speakers.each do |speaker_id, name|
        f.write("#{speaker_id}:\n")
        f.write("  name: #{name}\n")
        f.write("  # Add additional info like twitter, linkedin, github, web as needed\n\n")
      end
    end
    
    puts "Added #{new_speakers.size} new speakers to #{speakers_file}"
    new_speakers.each do |speaker_id, name|
      puts "  - #{speaker_id}: #{name}"
    end
  end
end

def main
  puts "Parsing CSV files..."
  meetings, talks = parse_csv_files
  
  puts "Found #{meetings.size} meetings and #{talks.size} talks"
  
  # Use _posts directory instead of _talks
  output_dir = '_posts'
  
  # Generate talk files
  puts "Generating talk files in #{output_dir}..."
  generated_files = []
  
  talks.each do |talk_id, talk_data|
    next unless talk_data['title'] && !talk_data['title'].empty?
    
    filepath = create_talk_file(talk_data, output_dir)
    generated_files << filepath
  end
  
  puts "Generated #{generated_files.size} talk files"
  
  # Update speakers.yml
  speakers_file = '_data/speakers.yml'
  if File.exist?(speakers_file)
    puts "Updating speakers.yml..."
    update_speakers_yml(talks, speakers_file)
  else
    puts "Warning: _data/speakers.yml not found, skipping speaker updates"
  end
  
  puts "Done!"
end

if __FILE__ == $0
  main
end 
