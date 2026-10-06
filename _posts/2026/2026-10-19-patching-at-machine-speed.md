---
layout: post
title: "Patching at Machine Speed: Can We Actually Keep Up with the Landside of CVEs?"
date: 2026-10-19
speakers:
- name: Jonathan Stevens
  linkedin: jonathan75
---

CVEs are dropping constantly, and exploitation windows have shrunk to hours, and manual triage can't keep pace anymore.
The bottleneck actually is rarely detection anymore, since tools like Dependabot catch things fast. Prioritizing security patches over feature work is not what your product owner wants to hear. Once you decide to patch, you have to get your paperwork and testing done faster than the hackers who don’t have any product owners, paperwork or testing but do have a working exploit and an army of bots scanning the internet. Who finishes first will decide if you will need to talk to public relations about a press release.
Here’s an idea! Let’s leverage the computers to work for us. Automate the pipeline. Put the Continuous back in Continuous Integration and Continuous Delivery. But what if it breaks production? Production testing needs automated as well.

None of this will be easy. We'll talk about challenges that organizations need to overcome with automated deployments at scale, including regulatory compliance, audit requirements and operational risk, and the significant investment required to build trustworthy automation.

And the clock is ticking. Security exploits are going up like a hockey stick. If we don’t start moving at “machine speed” it’s only a matter of time before you have a security breach.
