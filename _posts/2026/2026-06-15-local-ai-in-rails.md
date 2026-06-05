---
layout: post
title: "Local AI in Rails: Fast, Cheap, and Predictable"
date: 2026-06-15
link:
speakers:
- name: Ryan Carroll
  linkedin: carrollmedia
---

Rails apps usually reach for external AI services when they need “intelligence,” but that approach can bring latency, cost, and unpredictability along for the ride. This talk shows a different path: running a Japanese sentiment model directly inside a Rails app, using ONNX Runtime, background jobs, and real-time updates to keep the user experience fast and responsive.

Using a small app called Sentiment Omikuji as the case study, the talk walks through how the model was trained in Python, exported to ONNX, and loaded into Ruby for local inference. It also covers how Japanese text is tokenized, how the sentiment output drives a fortune generator, and why the app uses Solid Queue to keep model work off the request path. Along the way, the talk explores the tradeoffs of local inference versus API-based LLMs, and why classic machine learning can still be the right tool for focused problems.

Attendees will leave with a practical architecture they can adapt in their own Rails applications, plus a clearer picture of when local AI makes sense, how to keep it predictable, and what it takes to make it feel good in a real app.
