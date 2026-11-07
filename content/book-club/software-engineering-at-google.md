---
title: "Software Engineering at Google"
date: 2025-03-17
markup: markdown
draft: true
summary: Titus Winters, Tom Manshreck, and Hyrum Wright argue that software engineering is "programming integrated over time" — a collection of practices for keeping code sustainable across time, scale, and trade-offs at a 10,000-engineer organization, from mandatory code review and monorepo dependency management to Large-Scale Changes and deliberate culture-building.
tags:
  - software engineering
  - organizational culture
  - monorepo
  - testing
  - technical governance
params:
  author: Greg Balnis
---

> Winters, T., Manshreck, T., & Wright, H. (Eds.). (2020). *Software Engineering at Google: Lessons Learned from Programming Over Time* (1st ed.). Sebastopol, CA: O'Reilly Media. ISBN 978-1-492-08279-8.

## Metadata

- **Type**: engineering practice / organization & process
- **Reading effort**: long (25 chapters)
- **Prerequisites**: professional experience on a team with a real codebase; some exposure to CI, code review, and dependency management debates
- **Free official HTML version**: https://abseil.io/resources/swe-book
- **Summary based on**: reader's notes plus general knowledge of the book

## Quick summary

Google's argument: what distinguishes *software engineering* from *programming* is time and scale — the capacity to keep a codebase healthy and changeable over its entire lifespan while human effort scales sub-linearly with code size. The book is the closest thing to a primary source on how one 10,000+-engineer organization actually governs code: strict style guides, mandatory review, a monorepo with a One-Version rule, live-at-head dependencies, and Large-Scale Changes (LCSs) as routine maintenance.

## Core thesis

"Software engineering is programming integrated over time." The central problem is not writing code but sustaining it: an organization must be able to react to change (technical or business) for the expected lifespan of its software, and everything it relies on to produce and maintain code must scale in cost and human effort. This reframes almost every practice in the book — testing, documentation, dependency management, deprecation — as an answer to the question: *does this keep change affordable at scale?* Decisions should be evidence-driven trade-offs, and the organization must be able to detect and admit its own mistakes.

## Key points to remember

1. **Software engineering = programming + time + change** — The book's founding distinction. Programming produces code; engineering keeps it alive. Every policy should be evaluated against the expected lifespan of the software and the organization's ability to absorb repeated change. The strategic question is never "how do we avoid change?" but "which changes can we absorb repeatedly, and how do we make their cost scale sub-linearly?"

2. **Hyrum's Law** — "With a sufficient number of users of an API, it does not matter what you promise in the contract: all observable behaviors of your system will be depended on by somebody." At scale you cannot version or document your way out of this; every observable behavior is a de facto API. This law quietly justifies half the book: testing behavior rather than contracts, live-at-head, and the need for LSC capability.

3. **Scale changes which policies work** — Practices must scale sub-linearly in human effort as the organization grows. What works for 50 engineers (tribal knowledge, per-team conventions, heroic upgrades) fails at 10,000. Hence Google's preference for policies over preference, automation over nagging, and explicit governance (style arbiters, exception processes) over emergent per-team invention.

4. **Code review is the load-bearing social process** — Mandatory, universal review delivers five benefits, only one of which is correctness: comprehension, consistency, cultural transmission, and knowledge sharing are the others. Small changes are the single biggest lever on review quality and speed; reviews are mandatory even for the most senior engineers. In Google's system, review is also the enforcement point for style rules, readability certification, and static analysis.

5. **The Beyoncé Rule**[^1] — "If you liked it, you should have put a test on it." If a change to infrastructure or a shared library breaks your untested behavior, that is your problem, not the changer's. This rule is what makes live-at-head and monorepo-wide changes socially viable: responsibility for behavioral stability shifts to the consumer via tests, freeing maintainers to evolve code without universal negotiation.

6. **The One-Version rule and monorepo** — For each dependency, exactly one version exists in the repository, and (nearly) all development happens on trunk with short-lived branches. This trades local freedom for global consistency: no diamond-dependency hell, no cross-team version matrices, and a single source of truth that tooling can reason about. Release branches are the sanctioned exception. This is Google's sharpest divergence from industry norms — and it only works because of the build system, testing culture, and LSCs underneath it.

7. **Live at head beats version pinning at scale** — SemVer overconstrains (false version conflicts) and overpromises (compatibility is unverifiable — Hyrum's Law again). Google's alternative: everyone tracks the latest version of internal dependencies, and the breakage is fixed continuously by CI and LSCs rather than in periodic upgrade crunches. You pay for dependency freshness either continuously or in a lump later; at scale, continuous is cheaper. This is the book's most contested claim, and the authors admit it does not transfer piecemeal.

8. **Large-Scale Changes are routine maintenance, not heroics** — Changes touching thousands of files (migrating an API, upgrading a compiler) are a normal, tool-supported process: authorization, change creation, sharding and submitting, cleanup. The capability rests on infrastructure (codebase insight, change management, testing, language support) plus culture. Without it, codebases develop "haunted graveyards" — code nobody dares touch, which then cannot evolve at all.

9. **"No haunted graveyards"** — An explicit policy goal: every part of the codebase must remain changeable. Code that is too fragile, too untested, or too poorly understood to modify is an organizational liability that compounds over time. This principle links testing, documentation, deprecation, and LSCs into a single argument: the ability to change code is an asset you either maintain or lose.

10. **Testing culture is built deliberately, not mandated** — Google went from little testing to pervasive testing over years via orientation classes, the Test Certified program, and Testing on the Toilet (one-page testing tips posted in restrooms — persistent, low-cost nudges). The lesson generalizes to any norm change in a large org: sustained, slightly gimmicky, well-funded culture programs beat mandates. Suites are designed by test size (small/medium/large), and maintainability dominates: test public APIs, states, and behaviors; prefer DAMP (Descriptive And Meaningful Phrases) over DRY in test code.

11. **Deprecation is a managed process, not an announcement** — Old systems tax the whole org indefinitely, so deprecation is necessary — and it fails when removing the old thing is nobody's job. Google distinguishes advisory (social) from compulsory (enforced) deprecation, and successful deprecation requires owners, milestones, and tooling. Systems should be designed for eventual removal at birth.

12. **Rules exist to manage complexity, and enforcement belongs in tooling** — Style guides are strict, mandatory laws with arbiters and an exception process — but their value is consistency for readers and toolability, not stylistic preference. Enforcement shifts from human nagging to automated formatters and error checkers, which ends most style debate and frees review for substance. Static analysis follows the same survival rule: a check nobody acts on is worse than no check, so integrate into the core workflow and let users contribute checks (the Tricorder model).

13. **Leadership must scale: deciding, leaving, scaling** — The "three always" for leading at scale: always be deciding (identify blinders, name trade-offs, decide and iterate rather than await perfect answers); always be leaving (your mission is a self-driving team — subdivide and delegate the problem space); always be scaling (distinguish important from urgent, protect your attention, and learn to drop balls deliberately).

14. **Measure productivity with Goals → Signals → Metrics (GSM)** — Measurement is expensive, so triage whether a question is worth measuring at all. Never start from what is easy to count (lines of code, commit counts distort behavior); derive metrics from signals, signals from goals, and validate with data before acting. Google funds a dedicated engineering-productivity research function for this — the steering mechanism a fragmented org lacks.

15. **Documentation is like code** — Docs are owned, reviewed, versioned, and deprecated like code; written for known audiences in known types (reference, design doc, tutorial, conceptual, landing page). Stale docs are actively harmful — deprecate them deliberately. Design docs are a first-class decision-making tool, and this discipline is a large part of how cross-team coherence survives at scale.

## Mental models and frameworks

- **Hyrum's Law** — All observable behavior becomes de facto API at sufficient user scale. Applies whenever you version, deprecate, or change a shared system; breaks (as an excuse) only when user counts are genuinely small. It is the theoretical root of the Beyoncé Rule, test-the-behavior norms, and skepticism of SemVer.
- **Time / Scale / Trade-offs** — The book's three organizing axes: can you react to change for the software's lifespan (time)? Does effort scale sub-linearly (scale)? Are decisions evidence-driven, with the ability to admit mistakes (trade-offs)? Use as a checklist for evaluating any engineering policy.
- **The system, not the menu** — Monorepo + One-Version + artifact-based build system (Bazel-style, with the 1:1:1 fine-grained-module rule) + hermetic CI + LSCs + Beyoncé Rule form an interdependent capability chain. Adopting one piece (e.g., live-at-head) without the substrate (build, test, LSC tooling) fails. Applies when cherry-picking Google practices; breaks as an argument only if you invest in the whole chain.
- **Beyoncé Rule** — Consumers of behavior own its stability via tests. Applies to shared infrastructure and libraries; breaks where tests are weak — then change becomes negotiated gridlock.
- **GSM (Goals / Signals / Metrics)** — Derive what you measure from what you want, never from what is countable. Applies to any productivity or quality initiative; breaks when leadership demands a number first.
- **Test sizes and the preference ladder for doubles** — Small/medium/large tests classified by resources, not just scope; for doubles: real implementation > fake > stub > interaction testing. Applies to suite design; breaks when suites invert into mock-heavy change detectors.
- **Advisory vs. compulsory deprecation** — Social pressure vs. enforced removal, graduated. Applies to killing systems, APIs, and docs; breaks when no one holds enforcement power.
- **The three always** — Deciding / leaving / scaling for leaders at scale. Applies from roughly multi-team leadership upward.

## When to return to this book

| Situation you face | Return for |
| --- | --- |
| Your org's processes clearly don't scale with headcount, but nobody can articulate why | Chapter 1 (What Is Software Engineering?) — the time/scale/trade-offs framing and Hyrum's Law give you the vocabulary |
| Every product team invents its own conventions and cross-product work is painful | Chapters 3 (Knowledge Sharing), 8 (Style Guides and Rules), 10 (Documentation) — the readability process, arbiters, and docs-as-code as coherence mechanisms |
| Arguing about whether to adopt a monorepo or merge repos | Chapters 16 (Version Control), 18 (Build Systems), 21 (Dependency Management), 22 (Large-Scale Changes) — read them as one interdependent system, not a menu |
| SemVer debates: teams pinning ancient dependency versions, upgrade crunches, diamond-dependency conflicts | Chapter 21 — the most controversial chapter; SemVer's limits, live-at-head, and the honest admission of what infrastructure it requires |
| A widely-used API or library needs to change across the whole org and nobody knows how | Chapter 22 — the four-phase LSC process (authorization, creation, sharding/submitting, cleanup) and the "no haunted graveyards" principle |
| Deprecated-but-alive systems pile up; killing anything is politically impossible | Chapter 15 — advisory vs. compulsory deprecation, owners, milestones, tooling; deprecation designed in at birth |
| Code review has degraded into rubber-stamping or style nagging | Chapters 8, 9, 19 — automate enforcement into formatters and presubmits; small changes as the quality lever; the five benefits of review beyond correctness |
| Trying to change an engineering norm org-wide (e.g., testing) and mandates aren't working | Chapter 11 — the Testing on the Toilet / Test Certified playbook: years of deliberate, funded, slightly gimmicky culture work |
| Test suites are brittle and break on every refactor | Chapter 12 — test public APIs, states, and behaviors; DAMP over DRY; "strive for unchanging tests" |
| Being asked for productivity metrics, or tempted to measure developers | Chapter 7 — GSM and the triage question "is it even worth measuring?"; the case for a dedicated productivity-research function |
| Engineers route around CI, flaky tests are a shared joke | Chapter 23 — hermetic testing as the foundation of trust in the signal; "you can't afford CI" reframed as not seeing the costs of late detection |
| Deployed and released are the same terrifying event | Chapter 24 — flag guarding, release trains, "no binary is perfect" |
| You're leading multiple teams and drowning in urgent work | Chapter 6 — the three always; learning to drop balls deliberately as a scaling skill |
| Someone proposes copying "the Google way" wholesale | The Limitations section below, plus Chapter 21–22's own admissions — the practices form a system resting on infrastructure your org may not have |

## Limitations and context

- Written in 2020 by Google engineers about Google. The book is self-announced as Google-only and rarely compares with the rest of the industry — the "industry norm" column of any comparison is yours to supply. Reviewers' recurring warning: "your company most probably does NOT have Google problems."
- The practices form an interdependent system resting on expensive substrate: a world-class build system, massive CI capacity, dedicated tooling teams, and a productivity-research function. Live-at-head, monorepo, and LSCs do not transfer piecemeal — the book is fairly honest about this, but it is easy to miss.
- The culture/process first half reads to many as a series of blog posts; the technical second half (testing, CI/CD, dependency management, code review) is broadly rated strongest.
- A 2020 snapshot: specific tools (Critique, Tricorder, Borg-era details) and some practices have evolved since; treat specifics as dated, principles as durable.
- Says little about product discovery, commercial pressure, or how these practices fare outside an advertising-funded margin structure that can afford enormous engineering-infrastructure investment.

## Companion reading

- *Accelerate* by Forsgren, Humble, and Kim — the evidence-based counterpart: where Google argues from one organization's experience, DORA research tests which practices predict performance across the industry.
- *How Big Tech Runs Tech Projects and the Curious Absence of Scrum* by Gergely Orosz — blog article that supplies the industry-norm comparison the book deliberately omits (retrieved on 10 March 2025).
- *Working Effectively with Legacy Code* by Michael Feathers — the tactical companion for the "haunted graveyard" problem at code level, where this book addresses it at organizational level.
- *The Mythical Man-Month* by Fred Brooks — the classic ancestor: communication overhead and adding people to late projects are the 1975 version of the scale problem this book updates.

[^1]: Named after [Single Ladies (Put a Ring on It)](https://open.spotify.com/track/0LFg2GXI6Qu48JAVYrwYUE?si=18d2768a09894ba8) by Beyoncé.