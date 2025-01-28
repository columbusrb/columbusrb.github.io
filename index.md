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

## Board of Directors
<ul>
{% for member in site.data.board %}
    <li>
        <a href="{{member.link}}" target="_blank">{{member.name}}</a>
        <span>{{member.title}}</span>
    </li>
{% endfor %}
</ul>
