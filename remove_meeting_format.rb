#!/usr/bin/env ruby

require 'fileutils'

posts_dir = '_posts'
Dir.glob("#{posts_dir}/*.md").each do |file_path|
  puts "Processing #{file_path}..."
  
  content = File.read(file_path)
  original_content = content.dup
  
  # Remove meeting_format line from YAML front matter
  content.gsub!(/^meeting_format:.*\n/, '')
  
  # Remove **Meeting Format:** line from content (with various possible formats)
  content.gsub!(/^\*\*Meeting Format:\*\*.*\n/, '')
  content.gsub!(/^\*\*Meeting Format:\*\* .*\n/, '')
  
  # Write back only if content changed
  if content != original_content
    File.write(file_path, content)
    puts "  - Updated #{file_path}"
  else
    puts "  - No changes needed for #{file_path}"
  end
end

puts "Done processing all posts!" 
