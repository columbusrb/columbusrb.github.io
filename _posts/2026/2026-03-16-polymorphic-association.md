---
layout: post
title: Polymorphic Association - The Good, the Bad and the Ugly
date: 2026-03-16
link: 
speakers:
- name: Jonathan Stevens
  linkedin: jonathan-stevens-193287a
---

When Active Record works, it's great.  Polymorphic associations in Active Record promise elegant flexibility: one interface, many possible models. When they work, they feel almost magical. But when your application grows and real‑world complexity sets in, that magic can quickly turn into confusion, broken queries, and performance headaches. We’ll explore where polymorphic associations shine, where they silently introduce technical debt, and why even experienced Rails developers can end up wrestling with unscoped queries, tricky joins, and hard‑to‑optimize relationships. We’ll walk through real examples of tangled polymorphic logic—and more importantly, show practical strategies to refactor, untangle, or even avoid these pitfalls entirely. By the end, you’ll know when to reach for polymorphism, when to run away from it, and what to do when your complex query simply refuses to cooperate. -