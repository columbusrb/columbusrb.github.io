---
layout: default
title: "Home"
---

{% assign next = site.posts.first %}
{% assign talks = site.posts | where_exp: "post", "post.date == next.date" %}
<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-4">Next Meeting - {{ next.date | date: "%B %-d, %Y" }} 6:30pm</h2>
  <div class="talks space-y-4">
    {% for talk in talks %}
    <div class="talk bg-gray-50 rounded-lg p-4">
      <p class="mb-2">
        <span class="font-semibold text-gray-700">Talk:</span>
        <a href="{{talk.url}}" class="text-red-600 hover:text-red-800 font-medium">{{ talk.title }}</a>
      </p> 
      {% if talk.speakers.size > 1 %}
        <p class="font-semibold text-gray-700 mb-2">Speakers:</p>
        <ul class="list-disc list-inside space-y-2 mb-3">
        {% for speaker_id in talk.speakers %}
            {% assign speaker = site.data.speakers[speaker_id] %}
            <li class="text-gray-600">
              <span class="font-medium">{{speaker.name}}</span>
              {% if talk.content %}
                <span class="text-gray-700 text-sm leading-relaxed"> - {{ talk.content | strip_html }}</span>
              {% endif %}
            </li>
        {% endfor %}
        </ul>
      {% else %}
        <p class="font-semibold text-gray-700 mb-2">Speaker:</p>
        <ul class="list-disc list-inside space-y-1 mb-3">
        {% for speaker_id in talk.speakers %}
            {% assign speaker = site.data.speakers[speaker_id] %}
            <li class="text-gray-600">{{speaker.name}}</li>
        {% endfor %}
        </ul>
        {% if talk.content %}
        <div class="text-gray-700 text-sm leading-relaxed">
          {{ talk.content | strip_html }}
        </div>
        {% endif %}
      {% endif %}
    </div>
    {% endfor %}
  </div>
</div>

<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-6">Location & Parking</h2>
  
  <!-- Location Section -->
  <div class="mb-8">
    <h3 class="text-lg font-semibold text-gray-800 mb-4">Meeting Location</h3>
    <div class="flex flex-col md:flex-row md:items-center gap-6">
      <div class="flex-1">
        <p class="text-lg text-gray-700 mb-2">
          <span class="font-semibold">Where:</span>
          <a href="https://maps.app.goo.gl/N3ggq9WadNFX7JoD7" target="_blank" class="text-red-600 hover:text-red-800 font-medium">
            CoverMyMeds - 910 John St, Columbus, OH 43222
          </a>
        </p>
        <p class="text-gray-600">
          <span class="font-semibold">When:</span>
          Third Monday of each month at 6:00 PM (talks start at 6:30 PM)
        </p>
      </div>
      <div class="flex-shrink-0 w-full md:w-80">
        <a href="https://maps.app.goo.gl/N3ggq9WadNFX7JoD7" target="_blank" class="block">
          <img src="/assets/images/map.png" alt="Meeting location map" class="w-full rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200" />
        </a>
      </div>
    </div>
  </div>

  <!-- Parking Section -->
  <div class="border-t pt-8">
    <h3 class="text-lg font-semibold text-gray-800 mb-4">Parking & Arrival</h3>
    <div class="grid md:grid-cols-3 gap-6">
      <div class="space-y-4">
        <div class="p-3 bg-blue-50 rounded-lg border-l-4 border-blue-400">
          <p class="text-sm text-gray-700">
            <span class="font-semibold text-blue-800">Parking Information:</span> 
            Parking in the garage is no longer available. Please park in front of the main entrance or the wedge lot (see parking map). 
            Orange Barrel Media has graciously allowed us to park in their lot as well. Doors are open until 6pm. After 6pm security will need to let you in.
          </p>
        </div>
      </div>
      <div class="parking-map md:col-span-2">
        <a href="/assets/images/parking_map.png" target="_blank" class="block">
          <img src="/assets/images/parking_map.png" alt="Parking map showing available parking areas" class="w-full rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200" />
        </a>
      </div>
    </div>
  </div>
</div>

<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-6">Stay Connected</h2>
  <div class="text-center mb-6">
    <p class="text-gray-600 max-w-2xl mx-auto">
      Never miss a meeting! Subscribe to our calendar or join our Meetup community to stay up to date with all Columbus Ruby Brigade events.
    </p>
  </div>
  
  <div class="grid md:grid-cols-3 gap-4">
      <!-- iCal Subscription -->
      <div class="group">
        <a href="https://calendar.google.com/calendar/ical/columbusrb.com_u3g7hnfb4o8dnuisckhgbrn9ro%40group.calendar.google.com/public/basic.ics" 
           class="block p-6 text-white rounded-xl shadow-lg hover:shadow-xl transform hover:-translate-y-1 transition-all duration-200"
           style="background: linear-gradient(to bottom right, #2b2c30, #3a3b41);"
           onmouseover="this.style.background='linear-gradient(to bottom right, #1a1b1e, #2b2c30)'"
           onmouseout="this.style.background='linear-gradient(to bottom right, #2b2c30, #3a3b41)'">
          <div class="text-center">
            <div class="inline-flex items-center justify-center w-12 h-12 bg-white/20 rounded-lg mb-4">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
              </svg>
            </div>
            <h4 class="font-semibold text-lg mb-2 text-gray-100">Subscribe to iCal</h4>
            <p class="text-gray-100 text-sm">Works with Apple Calendar, Outlook, and more</p>
          </div>
        </a>
      </div>

      <!-- Google Calendar -->
      <div class="group">
        <a href="https://calendar.google.com/calendar/u/0?cid=Y29sdW1idXNyYi5jb21fdTNnN2huZmI0bzhkbnVpc2NraGdicm45cm9AZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ" 
           target="_blank"
           class="block p-6 text-white rounded-xl shadow-lg hover:shadow-xl transform hover:-translate-y-1 transition-all duration-200"
           style="background: linear-gradient(to bottom right, #2b2c30, #3a3b41);"
           onmouseover="this.style.background='linear-gradient(to bottom right, #1a1b1e, #2b2c30)'"
           onmouseout="this.style.background='linear-gradient(to bottom right, #2b2c30, #3a3b41)'">
          <div class="text-center">
            <div class="inline-flex items-center justify-center w-12 h-12 bg-white/20 rounded-lg mb-4">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
              </svg>
            </div>
            <h4 class="font-semibold text-lg mb-2 text-gray-100">Add to Google Calendar</h4>
            <p class="text-gray-100 text-sm">Sync directly with your Google account</p>
          </div>
        </a>
      </div>

      <!-- Meetup -->
      <div class="group">
        <a href="https://www.meetup.com/columbusrb/" 
           target="_blank"
           class="block p-6 text-white rounded-xl shadow-lg hover:shadow-xl transform hover:-translate-y-1 transition-all duration-200"
           style="background: linear-gradient(to bottom right, #3a3b41, #494a50);"
           onmouseover="this.style.background='linear-gradient(to bottom right, #2b2c30, #3a3b41)'"
           onmouseout="this.style.background='linear-gradient(to bottom right, #3a3b41, #494a50)'">
          <div class="text-center">
            <div class="inline-flex items-center justify-center w-12 h-12 bg-white/20 rounded-lg mb-4">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
              </svg>
            </div>
            <h4 class="font-semibold text-lg mb-2 text-gray-100">Join our Meetup</h4>
            <p class="text-gray-100 text-sm">RSVP and connect with the community</p>
          </div>
        </a>
      </div>
    </div>
</div>

<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-4">About Us</h2>
  <p class="text-gray-700 leading-relaxed mb-4">
    We are a bunch of professionals, students, and geeks who are excited about <a href="https://www.ruby-lang.org/" class="text-red-600 hover:text-red-800 font-medium">Ruby programming language</a> and <a href="https://rubyonrails.org/" class="text-red-600 hover:text-red-800 font-medium">Rails framework</a> and the joy they have brought back to web development. Our goal is to provide a welcoming environment to speak and share knowledge to all level of programmers who are interested in Ruby, the Rails framework, and professional development.
  </p>
  <ul class="space-y-2 text-gray-700 mb-6">
    <li class="flex items-center">
      <span class="text-red-600 mr-2">•</span>
      We give lectures on programming topics
    </li>
    <li class="flex items-center">
      <span class="text-red-600 mr-2">•</span>
      We freely provide decades worth of experience
    </li>
    <li class="flex items-center">
      <span class="text-red-600 mr-2">•</span>
      We provide networking opportunities
    </li>
  </ul>
  
  <div class="pt-6">
    <p class="text-gray-700 leading-relaxed mb-4">
      We are a non-profit organization guided by a passionate board of volunteers who work together to organize our community and events.
    </p>
    <h3 class="text-xl font-semibold text-gray-800 mb-4">Board of Directors</h3>
    <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
    {% for member in site.data.board %}
        <div class="bg-gray-50 rounded-lg p-4 hover:bg-gray-100 transition-colors duration-200">
            {% if member.link %}
              <a href="{{member.link}}" target="_blank" class="text-red-600 hover:text-red-800 font-medium text-lg block mb-1">{{member.name}}</a>
            {% else %}
              <span class="font-medium text-lg text-gray-800 block mb-1">{{ member.name }}</span>
            {% endif %}
            {% if member.title %}
              <span class="text-gray-600 text-sm">{{member.title}}</span>
            {% endif %}
        </div>
    {% endfor %}
    </div>
  </div>
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
