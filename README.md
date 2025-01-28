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
date of the talk/meetup.

The file must contain the following front matter.
```yml
---
layout: post
title: The name of the talk
speakers:
  - szechyjs
  - belongstorachel
---
A mix of HTML/Markdown content here to add any addition details about the talk.
```
The speakers slugs should match the keys in the `_data/speakers.yml` file.

## Speakers
To minimize duplication of speaker information across talks, speaker
information is consolidated to the speakers data file: `_data/speakers.yml`.

```yml
slug: # a unique name to link speaker to talks
  name: Speaker Name
  linkedin: linkedin-username
  github: gh-username
  twitter: user
```

## Deploying
GitHub actions should automatically deploy the site when changes are pushed
to the `main` branch.

