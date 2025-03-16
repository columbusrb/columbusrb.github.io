---
layout: default
title: "Home"
---

## Next Meeting
{% assign next = site.posts.first %}
<div>
    <a href="{{next.url}}">{{ next.title }}</a>
    {% for speaker_id in next.speakers %}
        {% assign speaker = site.data.speakers[speaker_id] %}
        <span>{{speaker.name}}</span>
    {% endfor %}
</div>

## About
We are a bunch of professionals, students, and geeks who are excited about [Ruby programming language](https://www.ruby-lang.org/) and [Rails framework](https://rubyonrails.org/) and the joy they have brought back to web development. Our goal is to provide a welcoming environment to speak and share knowledge to all level of programmers who are interested in Ruby, the Rails framework, and professional development.

- We give lectures on programming topics
- We develop and release Open Source software
- We freely provide decades worth of experience

## Who's using Ruby?
Have you ever wondered who's using Ruby in Columbus? Want to find Ruby developers who want to work at your company? Want to get your company on the list? Put in a [Pull Request here](https://github.com/columbusrb/columbusrb.github.io/blob/jekyll/_data/companies.yml)!

| Name | URL | Market | Location |
| ---- | --- | ------ | -------- |
{% for company in site.data.companies -%}
|{{ company.name }} | [{{ company.url }}]({{ company.url }}) |{{ company.market }} |{{ company.location }} | 
{% endfor %}

## Board of Directors
<ul>
{% for member in site.data.board %}
    <li>
        {% if member.link %}
          <a href="{{member.link}}" target="_blank">{{member.name}}</a>
        {% else %}
          <span>{{ member.name }}</span>
        {% endif %}
        {% if member.title %}
          <span> - {{member.title}}</span>
        {% endif %}
    </li>
{% endfor %}
</ul>
