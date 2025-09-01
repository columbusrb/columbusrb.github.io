# columbusrb.github.io
Columbus Ruby Brigade site built using [Jekyll](https://jekyllrb.com/)

## Requirements
- Ruby v3.4

## Install
```
bundle install
```

## Building
```
bundle exec jekyll serve
```
You can then access the site at [http://localhost:4000](http://localhost:4000)

## Talks
To add an upcoming talk create a new file in the `_posts` directory with the
following naming pattern: `YYYY-MM-DD-talk_title.md`. The date should be the
date of the talk/meetup. Posts are organized by year in subdirectories (e.g., `_posts/2025/`).

The file must contain the following front matter with speaker information embedded directly in the post:

```yml
---
layout: post
title: The name of the talk
date: 2025-02-17                    # Optional: Date of the meetup (YYYY-MM-DD)
link: https://example.com/repo      # Optional: External link for "More Details"
speakers:
- name: Speaker Name                # Required: Full name of the speaker
  linkedin: username                # Optional: LinkedIn username (not full URL)
  x-twitter: username               # Optional: X/Twitter username (not full URL) 
  github: username                  # Optional: GitHub username (not full URL)
  web: https://speaker.dev/         # Optional: Personal website (full URL)
- name: Second Speaker              # Multiple speakers supported
  github: secondspeaker
---

A mix of HTML/Markdown content here to add any additional details about the talk.
This content will be displayed on both the talks page and individual post pages.
```

### Field Descriptions:
- **`layout`**: Always use `post`
- **`title`**: The talk title (required)
- **`date`**: Meetup date in YYYY-MM-DD format (optional, defaults to filename date)
- **`link`**: External link displayed as "More Details" button (optional)
- **`speakers`**: Array of speaker objects with embedded social information (required)
  - **`name`**: Speaker's full name (required)
  - **`linkedin`**: LinkedIn username only, not full URL (optional)
  - **`x-twitter`**: X/Twitter username only, not full URL (optional)
  - **`github`**: GitHub username only, not full URL (optional)
  - **`web`**: Full URL to personal website (optional)

### Speaker Social Links:
Social media links are automatically generated from usernames:
- LinkedIn: `https://www.linkedin.com/in/{username}/`
- X/Twitter: `https://x.com/{username}`
- GitHub: `https://github.com/{username}`
- Personal websites use the full URL provided in the `web` field

## Meeting Schedule
Columbus Ruby Brigade meets on the **3rd Monday of every month** at 6:00 PM (talks start at 6:30 PM).

### 2025 Schedule
- 2025-01-20
- 2025-02-17
- 2025-03-17
- 2025-04-21
- 2025-05-19
- 2025-06-16
- 2025-07-21
- 2025-08-18
- 2025-09-15
- 2025-10-20
- 2025-11-17
- 2025-12-15

### 2026 Schedule  
- 2026-01-19
- 2026-02-16
- 2026-03-16
- 2026-04-20
- 2026-05-18
- 2026-06-15
- 2026-07-20
- 2026-08-17
- 2026-09-21
- 2026-10-19
- 2026-11-16
- 2026-12-21


## Updating Meeting Schedule
To update the meeting schedule in this README, run the schedule script:

```bash
ruby update_meeting_dates.rb
```

This script automatically:
- Calculates the 3rd Monday of every month
- Updates the meeting schedule for the current and next year
- Identifies the next upcoming meeting date
- Formats all dates in YYYY-MM-DD format for easy copy/paste into post filenames

Run this script at the beginning of each year or anytime you want to refresh the meeting dates.

## Deploying
GitHub actions will automatically deploy the site when changes are pushed
to the `main` branch.

