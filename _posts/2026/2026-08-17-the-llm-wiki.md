---
layout: post
title: "I Should Really Write That Down: An LLM Pattern for Documentation That Updates and Answers Itself"
date: 2026-08-17
speakers:
- name:  Rachel Slaby
  linkedin: belongstorachel
---
We've all been there: "This is the third time I've been asked this — I should really write it down." Then comes the sigh, because writing it down means reconstructing all the context, and for what? No one reads documentation until they need it — and by then, it's usually out of date. Even when it isn't, no one wants to wade through a long doc for one answer. They'll just ask you the question directly anyway.

Based on Andrej Karpathy's "LLM Wiki", this talk is about ending that cycle with a pattern for LLM-maintained documentation — one where the LLM keeps the wiki updated and answers questions directly from it, citing and filing each answer back in for next time. Internal docs don't go stale because no one cares; they go stale because maintenance cost outpaces the value of doing it by hand. Once an LLM can do that maintenance and answer the question itself for near-zero cost, "always up to date" stops being aspirational.
