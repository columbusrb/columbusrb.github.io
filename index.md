---
layout: default
title: "Home"
---

{% assign next = site.posts.first %}
{% assign talks = site.posts | where_exp: "post", "post.date == next.date" %}
<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-4">Next Meeting</h2>
  <div class="grid md:grid-cols-2 gap-6">
    <div class="talks space-y-4">
      {% for talk in talks %}
      <div class="talk bg-gray-50 rounded-lg p-4">
        <p class="mb-2">
          <span class="font-semibold text-gray-700">Talk:</span>
          <a href="{{talk.url}}" class="text-red-600 hover:text-red-800 font-medium">{{ talk.title }}</a>
        </p>
        <p class="font-semibold text-gray-700 mb-2">Speaker(s):</p>
        <ul class="list-disc list-inside space-y-1">
        {% for speaker_id in talk.speakers %}
            {% assign speaker = site.data.speakers[speaker_id] %}
            <li class="text-gray-600">{{speaker.name}}</li>
        {% endfor %}
        </ul>
      </div>
      {% endfor %}
      <div class="space-y-2 text-gray-600">
        <p><span class="font-semibold">When:</span> {{ next.date | date: "%B %-d, %Y" }} 6:30pm</p>
        <p><span class="font-semibold">Where:</span>
          <a href="https://maps.app.goo.gl/N3ggq9WadNFX7JoD7" target="_blank" class="text-red-600 hover:text-red-800">
            CoverMyMeds - 910 John St, Columbus, OH 43222
          </a>
        </p>
      </div>
    </div>
    <div class="location">
      <a href="https://maps.app.goo.gl/N3ggq9WadNFX7JoD7" target="_blank" class="block">
        <img src="/assets/images/map.png" alt="Meeting location map" class="w-full rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200" />
      </a>
    </div>
  </div>
</div>

<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-4">About</h2>
  <p class="text-gray-700 leading-relaxed mb-4">
    We are a bunch of professionals, students, and geeks who are excited about <a href="https://www.ruby-lang.org/" class="text-red-600 hover:text-red-800 font-medium">Ruby programming language</a> and <a href="https://rubyonrails.org/" class="text-red-600 hover:text-red-800 font-medium">Rails framework</a> and the joy they have brought back to web development. Our goal is to provide a welcoming environment to speak and share knowledge to all level of programmers who are interested in Ruby, the Rails framework, and professional development.
  </p>
  <ul class="space-y-2 text-gray-700">
    <li class="flex items-center">
      <span class="text-red-600 mr-2">•</span>
      We give lectures on programming topics
    </li>
    <li class="flex items-center">
      <span class="text-red-600 mr-2">•</span>
      We develop and release Open Source software
    </li>
    <li class="flex items-center">
      <span class="text-red-600 mr-2">•</span>
      We freely provide decades worth of experience
    </li>
  </ul>
</div>

<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-4">Who's using Ruby?</h2>
  <p class="text-gray-700 mb-4">
    Have you ever wondered who's using Ruby in Columbus? Want to find Ruby developers who want to work at your company? Want to get your company on the list? Put in a <a href="https://github.com/columbusrb/columbusrb.github.io/blob/main/_data/companies.yml" class="text-red-600 hover:text-red-800 font-medium">Pull Request here</a>!
  </p>
  <div class="overflow-x-auto mb-6">
    <table class="min-w-full bg-white border border-gray-200 rounded-lg">
      <thead class="bg-gray-50">
        <tr>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider border-b">Name</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider border-b">Market</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider border-b">Location</th>
        </tr>
      </thead>
      <tbody class="bg-white divide-y divide-gray-200">
        {% for company in site.data.companies -%}
        <tr class="hover:bg-gray-50">
          <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
            <a href="{{ company.url }}" class="text-red-600 hover:text-red-800">{{ company.name }}</a>
          </td>
          <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ company.market }}</td>
          <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ company.location }}</td>
        </tr>
        {% endfor %}
      </tbody>
    </table>
  </div>
</div>

<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-4">Board of Directors</h2>
  <ul class="space-y-2">
  {% for member in site.data.board %}
      <li class="text-gray-700">
          {% if member.link %}
            <a href="{{member.link}}" target="_blank" class="text-red-600 hover:text-red-800 font-medium">{{member.name}}</a>
          {% else %}
            <span class="font-medium">{{ member.name }}</span>
          {% endif %}
          {% if member.title %}
            <span class="text-gray-500"> - {{member.title}}</span>
          {% endif %}
      </li>
  {% endfor %}
  </ul>
</div>

<div class="bg-white rounded-lg shadow-lg p-6">
  <h2 class="text-2xl font-bold text-gray-800 mb-6">Graciously Sponsored By</h2>
  <div class="sponsors flex flex-wrap justify-center items-center gap-8">
    {% for sponsor in site.data.sponsors %}
      <a href="{{ sponsor.link}}" target="_blank" title="{{ sponsor.name }}" class="block hover:scale-105 transition-transform duration-200">
        <img src="/assets/images/sponsors/{{ sponsor.logo }}" alt="{{ sponsor.name }}" class="max-w-xs max-h-24 object-contain" />
      </a>
    {% endfor %}
  </div>
</div>
