#!/usr/bin/env ruby

require 'date'

class MeetingDateGenerator
  def self.third_monday_of_month(year, month)
    # Start with the first day of the month
    first_day = Date.new(year, month, 1)
    
    # Find the first Monday of the month
    days_until_monday = (1 - first_day.wday) % 7
    first_monday = first_day + days_until_monday
    
    # The third Monday is 14 days later
    third_monday = first_monday + 14
    
    third_monday
  end

  def self.generate_yearly_schedule(year)
    dates = []
    (1..12).each do |month|
      third_monday = third_monday_of_month(year, month)
      dates << {
        month: Date::MONTHNAMES[month],
        date: third_monday,
        formatted: third_monday.strftime("%Y-%m-%d")
      }
    end
    dates
  end

  def self.update_readme
    current_year = Date.today.year
    next_year = current_year + 1
    
    current_schedule = generate_yearly_schedule(current_year)
    next_schedule = generate_yearly_schedule(next_year)
    next_meeting = next_meeting_date
    
    readme_content = File.read('README.md')
    
    # Create the meeting schedule section
    schedule_section = <<~SCHEDULE
    ## Meeting Schedule
    Columbus Ruby Brigade meets on the **3rd Monday of every month** at 6:00 PM (talks start at 6:30 PM).

    **Next Meeting:** #{next_meeting.strftime("%Y-%m-%d")}

    ### #{current_year} Schedule
    #{current_schedule.map { |m| "- #{m[:formatted]}" }.join("\n")}

    ### #{next_year} Schedule  
    #{next_schedule.map { |m| "- #{m[:formatted]}" }.join("\n")}

    SCHEDULE
    
    # Check if schedule section already exists
    if readme_content.include?('## Meeting Schedule')
      # Replace existing schedule section
      updated_content = readme_content.gsub(
        /## Meeting Schedule.*?(?=##|\z)/m,
        schedule_section
      )
    else
      # Insert after the main heading and description
      insert_point = readme_content.index("## Requirements")
      if insert_point
        updated_content = readme_content.insert(insert_point, schedule_section + "\n")
      else
        # Fallback: append to end
        updated_content = readme_content + "\n" + schedule_section
      end
    end
    
    File.write('README.md', updated_content)
    puts "✅ README.md updated with meeting dates!"
  end
end

# Run the script if called directly
if __FILE__ == $0
  MeetingDateGenerator.update_readme
end
