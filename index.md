---
layout: default
title: "Home"
---

{% comment %}
Find the next meeting that should be displayed:
- If there's a future meeting, show it (upcoming meeting)
- If no future meetings, show the most recent past meeting
{% endcomment %}
{% assign future_posts = site.posts | where_exp: "post", "post.date > site.time" %}
{% assign past_posts = site.posts | where_exp: "post", "post.date <= site.time" %}

{% if future_posts.size > 0 %}
  {% assign next = future_posts.last %}
{% else %}
  {% assign next = past_posts.first %}
{% endif %}

{% if next %}
  {% assign talks = site.posts | where_exp: "post", "post.date == next.date" %}
<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-6">Next Meeting - {{ next.date | date: "%B %-d, %Y" }} 6:30pm</h2>
  <div class="space-y-8">
    {% for talk in talks %}
    <article class="bg-gray-50 rounded-lg p-6 border-2 border-gray-200 shadow-md hover:shadow-lg transition-shadow duration-200">
      <!-- Title and Content Section -->
      <h3 class="text-2xl font-bold text-gray-800 mb-4">{{ talk.title }}</h3>
      
      <!-- External Link -->
      {% if talk.link %}
        <div class="mb-6">
          <a href="{{ talk.link }}" target="_blank" class="inline-flex items-center text-blue-600 hover:text-blue-800 font-medium">
            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
            </svg>
            More Details
          </a>
        </div>
      {% endif %}
      
      {% assign clean_content = talk.content | strip %}
      {% assign content_size = clean_content | size %}
      {% if content_size > 0 %}
        <div class="mb-6">
          <div class="prose prose-lg max-w-none">
            {{ talk.content }}
          </div>
        </div>
      {% endif %}
      
      <!-- Speakers Section at Bottom -->
      {% if talk.speakers %}
        {% for speaker in talk.speakers %}
          <div class="speaker bg-white rounded-lg p-4 mb-3 border border-gray-200">
            <div class="flex items-center justify-between">
              <span class="text-base font-medium text-gray-700">{{ speaker.name }}</span>
              <div class="social flex space-x-3">
                {% if speaker.linkedin %}
                  <a href="https://www.linkedin.com/in/{{ speaker.linkedin }}/" target="_blank" class="text-gray-600 hover:text-red-600 transition-colors duration-200">
                    <img src="/assets/images/linkedin.svg" alt="LinkedIn" class="h-5 w-5" />
                  </a>
                {% endif %}
                {% if speaker.x-twitter %}
                  <a href="https://x.com/{{ speaker.x-twitter }}" target="_blank" class="text-gray-600 hover:text-red-600 transition-colors duration-200">
                    <img src="/assets/images/x-twitter.svg" alt="X" class="h-5 w-5" />
                  </a>
                {% endif %}
                {% if speaker.github %}
                  <a href="https://github.com/{{ speaker.github }}" target="_blank" class="text-gray-600 hover:text-red-600 transition-colors duration-200">
                    <img src="/assets/images/github.svg" alt="GitHub" class="h-5 w-5" />
                  </a>
                {% endif %}
                {% if speaker.web %}
                  <a href="{{ speaker.web }}" target="_blank" class="text-gray-600 hover:text-red-600 transition-colors duration-200">
                    <img src="/assets/images/link.svg" alt="link" class="h-5 w-5" />
                  </a>
                {% endif %}
              </div>
            </div>
          </div>
        {% endfor %}
      {% endif %}
    </article>
    {% endfor %}
  </div>
</div>
{% else %}
<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-6">No Upcoming Meetings</h2>
  <p class="text-gray-600">Check back soon for upcoming meeting announcements!</p>
</div>
{% endif %}

<div class="bg-white rounded-lg shadow-lg p-6 mb-8">
  <h2 class="text-2xl font-bold text-gray-800 mb-6">Location & Parking</h2>
  
  <!-- Location Section -->
  <div class="mb-8">
    <div class="flex flex-col md:flex-row md:items-center gap-6">
      <div class="flex-1">
        <h3 class="text-lg font-semibold text-gray-800 mb-2">Meeting Location</h3>
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
  <div class="pt-8">
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
