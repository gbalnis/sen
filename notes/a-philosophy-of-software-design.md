---
title: "A Philosophy of Software Design"
date: 2026-11-07
---

> I'm reading this book to rebuild a structured, reusable checklist of software-design best practices — for reviewing code and designs — and to decide which practices stay valid, and which transform, when AI agents co-author and maintain the code.

## Ideas

## Actions

## Questions

# Reading Plan

## Goal and relevance filter

Everything below is filtered through one question: *"Does this chapter give me a checklist item I can apply in a code/design review, and does that item change when the author or maintainer is an AI agent?"* Chapters that only refine the author's own philosophy with no reviewable artifact get lower priority.

## Evidence and limitations

**Sources consulted (2026-11-07):**

- Author's book page — edition differences, free 2nd-edition extract: <https://web.stanford.edu/~ouster/cgi-bin/book.php>
- Full 2nd-edition table of contents (chapter + section order verified): <https://dokumen.pub/a-philosophy-of-software-design-2nd-edition-2nbsped-173210221x-9781732102217.html> and <https://az.z-library.sk/book/qvBE057rj1/a-philosophy-of-software-design-2nd-edition.html>
- Chapter-level summary: <https://unireadinglist.com/subjects/computer-science/philosophy-of-software-design-ousterhout/>
- Ousterhout ↔ Robert Martin written debate (Sept 2024–Feb 2025): <https://github.com/johnousterhout/aposd-vs-clean-code>
- Pragmatic Engineer interview (April 2025), Ousterhout on AI tools: <https://newsletter.pragmaticengineer.com/p/the-philosophy-of-software-design>
- Reviews, positive: Piaw Na <https://blog.piaw.net/2021/09/review-philosophy-of-software-design.html>; Sijin Joseph <https://sijinjoseph.com/post/2022-02-22-book-review-a-philosophy-of-software-design/>; Axol <https://theaxolot.wordpress.com/2025/10/30/a-refreshing-philosophy-of-software-design/>
- Reviews, critical: Jimmy Koppel, *Path-Sensitive* <https://www.pathsensitive.com/2018/10/book-review-philosophy-of-software.html>; Andrey Lebedev <https://andremoniy.medium.com/not-my-philosophy-of-software-design-13d9f1e09451>; skazsi <https://skazsi.com/books/a-philosophy-of-software-design/>
- AI-era applications: Paul Simmering, "A Philosophy of AI Coding" <https://simmering.dev/blog/a-philosophy-of-ai-coding/>; Louis McCormack, "Soul Searching in Software Land" <https://louismccormack.com/soul-searching-in-software-land>; Ousterhout-based agent rules <https://github.com/mhenke/john-ousterhout-skills>

**Edition:** plan targets the 2nd edition (2021, ISBN 978-1-7321022-1-7, ~200 pp, 22 chapters). If you fall back to the 1st edition: Chapter 21 doesn't exist, Chapter 6 is shorter (material lived in other chapters), and the two "A different opinion: Clean Code" sections (§9.8, §12.6) are missing. The author's free extract covers the delta.

**Uncertainties:**

- Chapter theses and the three-idea answer keys are reconstructed from the table of contents, the author's own statements, and multiple independent reviews — not from a full verified text of each chapter. They are reliable at the level of "what the chapter argues," not at the level of exact wording or example order. Correct them against the book as you read.
- Reviewers' opinions are marked as such; they are not the author's claims.

## Reconnaissance: the book's argument, value, and criticisms

**Core argument.** The enemy is *complexity* — anything in a system's structure that makes it hard to understand and modify (Ch. 2). Complexity shows up as change amplification, cognitive load, and unknown unknowns; it is caused by dependencies and obscurity, and it accumulates incrementally, so no single change ever looks guilty. The counterweight is the *strategic* mindset (Ch. 3): invest ~10–20% more time up front in design because it pays back faster than people expect. Most of the book is then a set of module-design principles — deep modules, information hiding, general-purpose interfaces, same-layer-same-abstraction, define errors out of existence — plus a five-chapter block on comments and naming, and short takes on trends (TDD, Agile, patterns) and performance. The recurring checklist artifact is the "red flags" collected at the back of the book.

**Value for your goal.** High. The book is essentially a checklist generator: each chapter names a principle *and* its observable symptom (red flag), which is exactly the shape a review checklist needs. It's short and opinionated, so it also gives you clear positions to test against AI-era practice.

**Criticisms to keep in mind (reviewers' opinions):**

1. **Scope is intra-codebase only.** No testing strategy (one page), no type systems, no services/API-contracts-between-teams, no legacy-API constraints, no business context (Koppel; Frere; irrational.engineering; Piaw). Your checklist will need to stay at module/class/function level or be extended.
2. **"Deep module" is under-formalized.** Koppel argues Ousterhout never gives a way to distinguish "abstracting something real" from "adding indirection" — the book can't see meaning beyond the code itself. Expect the deep/shallow judgment to remain partly taste.
3. **Designs appear fully formed.** Axol: examples go from bad to good with no iteration shown, which can read as post-hoc rationalization; juniors may struggle to derive the process.
4. **Anti-dogma can become its own dogma.** Lebedev (a critical outlier) reads the general-purpose/deep advice as encouraging premature generalization; skazsi finds the five-chapter comments block unbalanced and the later chapters thin.
5. **Positions are contested by peers.** The Martin debate shows smart disagreement on method length, comments, and TDD — treat the book's stances as hypotheses, and note the debate doc is itself worth reading after Ch. 9/12/19.

**AI-era framing (from Ousterhout himself, Pragmatic Engineer 2025, and the sources above):** he believes design matters *more* as AI generates more code, calling today's AI tools "tactical tornadoes" — fast code, new tech debt. The interesting question for your checklist: Ousterhout's complexity symptoms are defined around *human* cognitive limits. With agents, cognitive load partially shifts to context windows, "unknown unknowns" become retrieval problems, and comments/design docs become agent prompts. Each chapter entry below has an AI-angle prompt for exactly this re-evaluation.

## Priority map

Format: **priority** — reason (checklist value + AI-era stakes).

- **Ch. 1 Introduction** — Skim. Framing only ("it's all about complexity"); no checklist items.
- **Ch. 2 The Nature of Complexity** — **Deep.** The vocabulary (symptoms, causes, incrementality) is the header of your whole checklist. AI-era: which symptoms still bind when the reader is an agent?
- **Ch. 3 Working Code Isn't Enough** — **Deep.** Tactical vs. strategic is the book's most AI-relevant chapter ("tactical tornado" is now a machine). Checklist item: investment mindset.
- **Ch. 4 Modules Should Be Deep** — **Deep.** The signature principle + classitis red flag; the Unix vs. Java I/O example is a review classic.
- **Ch. 5 Information Hiding (and Leakage)** — **Deep.** Information leakage and temporal decomposition are high-frequency review findings; HTTP-server examples give concrete checklist phrasing.
- **Ch. 6 General-Purpose Modules are Deeper** — **Deep.** Author: over-specialization may be the single greatest cause of complexity; heavily expanded in 2nd ed. Directly opposes YAGNI habits — a decision you must make for your checklist.
- **Ch. 7 Different Layer, Different Abstraction** — **Deep.** Pass-through methods/variables are among the easiest red flags to spot mechanically — including in agent-generated scaffolding.
- **Ch. 8 Pull Complexity Downwards** — **Deep.** Interface-vs-implementation trade-off; the "who suffers?" question is a great review heuristic.
- **Ch. 9 Better Together Or Better Apart?** — **Deep.** Merge/split criteria + the 2nd-edition Clean Code rebuttal on method length. Core checklist territory.
- **Ch. 10 Define Errors Out Of Existence** — **Deep.** Exception-handling strategy is a top source of incidental complexity; gives 4-5 concrete techniques.
- **Ch. 11 Design it Twice** — Skim (short). One habit, one sentence: always consider ≥2 designs. AI-era twist: generating a second design is now nearly free.
- **Ch. 12 Why Write Comments? The Four Excuses** — **Deep.** The four excuses and their rebuttals are checklist-ready; 2nd ed. adds the "comments are failures" dispute. Highest-stakes chapter for agent-readable codebases.
- **Ch. 13 Comments Should Describe Things that Aren't Obvious** — **Deep.** The substance of comment practice: precision low, intuition high, interface docs, cross-module decisions.
- **Ch. 14 Choosing Names** — **Deep.** Names are the cheapest complexity lever and the primary interface between a codebase and an agent's retrieval.
- **Ch. 15 Write The Comments First** — **Deep.** Comments-as-design-tool; potentially the chapter that changes *most* in an AI workflow (comments as spec → agent as implementer).
- **Ch. 16 Modifying Existing Code** — **Deep.** Maintenance discipline (strategic edits, comment maintenance, diffs) — exactly what supervising agent edits looks like.
- **Ch. 17 Consistency** — Skim. One principle + enforcement ideas; fold into checklist as one line.
- **Ch. 18 Code Should be Obvious** — **Deep.** Operationalizes "obviousness" — arguably the most transferable idea to reviewing agent output, whose obscurity is easy to miss when it "works."
- **Ch. 19 Software Trends** — **Deep.** His takes on inheritance, Agile, unit tests, TDD, design patterns, getters/setters. You don't have to agree; you do have to decide your position for each trend.
- **Ch. 20 Designing for Performance** — Skim. Simple-is-fast, measure first, critical path. Low AI-differentiation; three checklist lines at most.
- **Ch. 21 Decide What Matters** — **Deep.** New in 2nd ed.; the meta-principle (separate what matters, minimize it, emphasize it) that organizes the whole checklist.
- **Ch. 22 Conclusion** — Skim. One-page wrap-up.
- **Back matter: Summary of Design Principles / Summary of Red Flags** — **Deep.** This is the raw draft of your checklist; treat it as the book's answer key.

No chapters deferred: at ~180 pages with no time pressure, the whole book is reachable; the skims exist to keep pace honest.

## Sequential chapter guide

Each entry: purpose/fit · thesis · frameworks · predicted argument (check after reading) · first principles (synthesis, not quotations) · application prompt · recall test. Answer keys are in collapsed blocks — open only after answering from memory.

### Chapter 1 — Introduction (Skim)

- **Purpose and fit:** sets the stakes (design skill is learnable; it's all about complexity) and explains the book's course origins and the text-editor running example.
- **Main thesis:** software design is a teachable skill, and the goal of design is minimizing complexity.
- **Frameworks:** the red-flag concept is introduced here.
- **Predicted argument (check after reading):** he will argue design is under-taught because courses reward working code, and preview the complexity definition.
- **Application prompt:** In your current review habits, what do you actually reward — working code, or design? What would an agent learn from your merged PRs?
- **Recall test:** (1) three main ideas? (2) what surprised me? (3) what will I do differently?

<details><summary>Answer key: open after recall</summary>

1. The book's problem is complexity; design skill can be taught; the running examples come from a Stanford course (GUI text editor). Accept equivalent wording.
2. Sample reflection: surprise that a Stanford course grades *design*, not functionality — and that agent-era teams may need the same shift.
3. Sample action options: decide to record one red flag per review you do this month.

</details>

### Chapter 2 — The Nature of Complexity (Deep)

- **Purpose and fit:** the definitional core; every later chapter's red flag maps back here. This is the header of your checklist.
- **Main thesis:** complexity is anything in the structure that makes a system hard to understand and modify; it has three symptoms (change amplification, cognitive load, unknown unknowns), two causes (dependencies, obscurity), and it accumulates incrementally.
- **Frameworks:** symptoms → causes → incremental accumulation; "complexity is more apparent to readers than writers."
- **Predicted argument (check after reading):** he'll argue unknown unknowns are the worst symptom and that incremental accumulation is why tactical habits win by default.
- **First principles (synthesis):** The key is that no single change causes the mess — everything comes down to a thousand reasonable-looking increments.
- **Application prompt:** Pick a painful module in your current project: which of the three symptoms dominates? Would an agent even *notice* unknown unknowns there, or just hallucinate past them?
- **AI-angle:** Cognitive load for agents = context-window pressure; unknown unknowns = retrieval failures. The symptoms survive, the *carrier* changes.
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Complexity = structural difficulty of understanding/modifying. Symptoms: change amplification, cognitive load, unknown unknowns. Causes: dependencies + obscurity; growth is incremental.
2. Sample reflection: the "readers notice complexity more than writers" claim cuts both ways with agents — they are tireless readers but may lack the discomfort signal that tells a human "this is too complex."
3. Sample action options: add "which symptom does this PR worsen?" as a standing review question; tag tech-debt items by symptom.

</details>

### Chapter 3 — Working Code Isn't Enough (Deep)

- **Purpose and fit:** the strategic/tactical distinction is the mindset section of your checklist — and the book's most-quoted frame in AI discussions.
- **Main thesis:** tactical programming (make it work, fast) compounds complexity; strategic programming invests ~10–20% in design because great design pays back sooner than expected; even startups benefit.
- **Frameworks:** tactical vs. strategic programming; the "tactical tornado" archetype; investment curve (design investment pays off over time).
- **Predicted argument (check after reading):** he'll concede tactical wins short-term and argue strategically-run startups ship *faster* within months.
- **First principles (synthesis):** The reason most teams fail at design is they treat it as a luxury, when it's a speed strategy with a delayed payout.
- **Application prompt:** Where in your workflow do you (or your agents) behave like a tactical tornado? What would "10–20% design investment" mean when implementation is cheap?
- **AI-angle:** Ousterhout himself (Pragmatic Engineer, 2025) calls AI tools tactical tornadoes. If implementation cost drops, does the *optimal* design investment rise or fall? Decide your position.
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Working code is insufficient — design quality matters; tactical vs. strategic programming and the tornado archetype; invest ~10–20% in design because payback is faster than assumed (including at startups).
2. Sample reflection: with agents, the tornado's output is now unlimited — the constraint moved from writing code to *absorbing* it, which strengthens rather than weakens his argument.
3. Sample action options: define what "strategic" means for an agent session (e.g., design notes before generation); budget explicit design time per feature even when codegen is fast.

</details>

### Chapter 4 — Modules Should Be Deep (Deep)

- **Purpose and fit:** the signature principle. Gives your checklist its central unit of analysis: interface cost vs. implementation benefit.
- **Main thesis:** the best modules have simple interfaces hiding powerful functionality ("deep"); shallow modules add interface without hiding much; small modules tend to be shallow; "classitis" (many tiny classes) is a disease.
- **Frameworks:** module depth (interface vs. implementation); abstraction = simplified view of an entity; Unix file I/O (deep) vs. Java layered I/O (shallow) comparison.
- **Predicted argument (check after reading):** he'll attack the "methods/classes should be small" orthodoxy head-on, setting up the Clean Code dispute in Ch. 9.
- **First principles (synthesis):** Everything comes down to the ratio: what the module lets you *ignore* versus what it forces you to *learn*.
- **Application prompt:** Find the shallowest module in a codebase you maintain. What would its deep version look like — and would an agent produce the shallow version by default?
- **AI-angle:** Agents generate shallow scaffolding fluently (wrappers, one-line delegations). Depth is a property generators don't optimize for unless asked.
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Deep = simple interface, substantial implementation; shallow modules fail the cost/benefit test; classitis = over-decomposition into tiny classes; Unix vs. Java I/O as the canonical contrast.
2. Sample reflection: Koppel's critique is fair here — the book never fully operationalizes "deep vs. merely indirect." Your checklist may need a second question: "what real concept does this abstraction hide?"
3. Sample action options: add a "depth check" to PR review (interface complexity vs. functionality hidden); watch for agent-generated pass-through wrappers.

</details>

### Chapter 5 — Information Hiding (and Leakage) (Deep)

- **Purpose and fit:** the mechanism behind depth. Leakage red flags are among the most actionable checklist items in the book.
- **Main thesis:** each module should embody a few design decisions hidden from the rest; leakage (the same knowledge in multiple places) and temporal decomposition (structure mirroring time-order of operations) are the failure modes.
- **Frameworks:** information hiding; information leakage; temporal decomposition; worked HTTP-server examples (too many classes, parameter handling, defaults in responses).
- **Predicted argument (check after reading):** he'll show that over-splitting the HTTP server *increases* the knowledge each developer needs — leakage through fragmentation.
- **First principles (synthesis):** The key is that every design decision should live in exactly one place.
- **Application prompt:** Which design decision in your system is known by more than two modules? Is that knowledge written down anywhere an agent could find it?
- **AI-angle:** Hidden information is invisible to retrieval. Agents leak knowledge by duplicating patterns across files they've seen separately. Checklist item: "does this change duplicate a decision made elsewhere?"
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Information hiding = each module encapsulates design decisions; leakage = same knowledge in multiple modules; temporal decomposition = structure driven by execution order rather than knowledge; defaults should be computed where the knowledge lives (HTTP examples).
2. Sample reflection: temporal decomposition is the sleeper concept — pipeline-shaped code feels natural but often scatters one decision across stages.
3. Sample action options: hunt one temporal-decomposition case in your codebase; when an agent adds a parameter, check whether a default could live lower.

</details>

### Chapter 6 — General-Purpose Modules are Deeper (Deep)

- **Purpose and fit:** the 2nd-edition-expanded chapter; the author's candidate for the most important cause of complexity (over-specialization). Forces a decision in your checklist vs. YAGNI.
- **Main thesis:** make modules *somewhat* general-purpose — implement general mechanisms, push specialization up or down, and eliminate special cases; generality improves information hiding and reduces interface count.
- **Frameworks:** text-editor example (special-purpose keystroke methods → general insert/delete ranges); "questions to ask yourself" (§6.5: simplest interface for current needs? how many use cases per method? is this API easy for my current needs?); push specialization up (callers) or down (device drivers); editor undo mechanism (general history vs. special-purpose actions); eliminate special cases in code.
- **Predicted argument (check after reading):** he'll argue the right generality level is "general mechanism, current needs" — deliberately neither future-proofing nor hard-coding.
- **First principles (synthesis):** The reason most people fail is they either hard-code today's feature or design tomorrow's framework — the sweet spot is a general mechanism sized to today's needs.
- **Application prompt:** Pick a special-purpose API you own: what is the general mechanism underneath it? Would an agent, prompted with today's ticket, ever find it?
- **AI-angle:** Ticket-driven agent work produces exactly the special-purpose code this chapter warns about. "Somewhat general-purpose" is a prompting/review standard, not an emergent one.
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Over-specialization as a top complexity source; general-purpose APIs are deeper and hide more; balance via the §6.5 questions (simple interface for *current* needs); push specialization up/down; eliminate special cases.
2. Sample reflection: this collides with YAGNI and with Lebedev's "premature generalization" critique — the disagreement is real; your checklist needs your own tie-breaker (e.g., "generalize the mechanism, never the feature").
3. Sample action options: add a review question — "is this method tied to one caller's scenario, or is it a mechanism?"; when delegating to an agent, ask for the general mechanism in the prompt.

</details>

### Chapter 7 — Different Layer, Different Abstraction (Deep)

- **Purpose and fit:** the layering red flags (pass-through methods, pass-through variables, decorators) are mechanically detectable — prime checklist material, and prime agent-output defects.
- **Main thesis:** adjacent layers should embody different abstractions; pass-through methods signal blurred layers (though interface duplication is sometimes OK); decorators pile thin layers; pass-through variables drag context through intermediates.
- **Frameworks:** pass-through method red flag; when interface duplication is OK (dispatcher); decorators critique; interface vs. implementation distinction; pass-through variables (alternatives: context objects).
- **Predicted argument (check after reading):** he'll concede pass-through is sometimes right (dispatchers, interface-vs-implementation splits) — the flag means "investigate," not "always wrong."
- **First principles (synthesis):** Everything comes down to: if two layers know the same things, one of them isn't a layer.
- **Application prompt:** Count pass-through methods in one of your services. How many were added to "not touch working code" — a pattern agents repeat eagerly?
- **AI-angle:** Agents insert pass-through layers to minimize blast radius of their edits. Expect more of this flag in agent-written code, not less.
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Layers must carry different abstractions; pass-through methods/variables as red flags (with legitimate exceptions like dispatchers); decorators as thin-layer accumulation; interface duplication can be acceptable when implementations differ.
2. Sample reflection: the "context object" alternative to pass-through variables trades one obscurity for another unless the context is itself well-designed.
3. Sample action options: checklist line — "new method that only forwards? justify the layer"; review agent PRs specifically for forwarding wrappers.

</details>

### Chapter 8 — Pull Complexity Downwards (Deep)

- **Purpose and fit:** a one-idea chapter that gives reviews a memorable tie-breaker: who should suffer, the implementer or every caller?
- **Main thesis:** it's better for a module's implementer to absorb complexity than to export it to all callers (e.g., editor text class handling line internals; configuration parameters should get sensible defaults computed low, not knobs exported high) — but don't pull so far that the module's complexity exceeds the benefit.
- **Frameworks:** complexity gradient between interface and implementation; configuration-parameter handling; "taking it too far."
- **Predicted argument (check after reading):** he'll use configuration knobs as the cautionary example — systems that export tuning burden to operators instead of deciding internally.
- **First principles (synthesis):** The key is: complexity suffered by one implementer beats complexity suffered by a hundred users.
- **Application prompt:** Which of your module interfaces makes every caller handle a case the module could absorb? (Agents default to the export-the-knob style.)
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Absorb complexity in the implementation rather than the interface; apply to configuration (defaults decided low, not exported); the limit — don't pull complexity down past the point where it poisons the module itself.
2. Sample reflection: this is an empathy argument wearing a design argument — Piaw and others note the book's recurring "consider the caller" stance.
3. Sample action options: review one config surface and push two decisions down; checklist line — "who absorbs this complexity?"

</details>

### Chapter 9 — Better Together Or Better Apart? (Deep)

- **Purpose and fit:** the merge/split decision rules plus the 2nd-edition "A different opinion: Clean Code" section (§9.8) — your checklist's answer to method-length dogma.
- **Main thesis:** bring code together when it shares information, simplifies the interface, or eliminates duplication; separate general-purpose from special-purpose code; judge methods by depth, not length — long methods are fine when they keep entangled logic together.
- **Frameworks:** three reasons to combine (shared information, simpler interface, duplication); general/special separation; editor examples (cursor/selection, logging, undo); splitting vs. joining methods; Clean Code dispute on short methods.
- **Predicted argument (check after reading):** he'll argue Clean Code's tiny-methods rule produces entangled shallow methods you must flip between — the "conjoined methods" problem.
- **First principles (synthesis):** The reason people fail at module size is they count lines instead of counting what a reader must hold in their head.
- **Application prompt:** Where do you stand on method length — and is your answer the same for code an agent wrote, given agents don't suffer the flipping cost but human reviewers do?
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Combine when information is shared, when it simplifies interfaces, or to remove duplication; separate general-purpose from special-purpose; depth over length — explicit disagreement with Clean Code's small-methods rule.
2. Sample reflection: the Ousterhout–Martin debate doc shows Martin conceding over-decomposition guidance was thin; the practical synthesis many reviewers land on: split on abstraction boundaries, not on line counts.
3. Sample action options: write your checklist's method-size rule in one sentence that mentions entanglement; read the debate doc's method-length section after this chapter.

</details>

### Chapter 10 — Define Errors Out Of Existence (Deep)

- **Purpose and fit:** exception/error design is a top complexity source; the chapter's techniques convert directly to checklist items.
- **Main thesis:** exceptions multiply complexity (fragmented handling, hard-to-reason paths); prefer designs where the error cannot occur (Windows file deletion semantics; Java `substring` clamping), mask errors at low levels, aggregate handlers, crash deliberately when recovery is impossible, and design special cases out of existence.
- **Frameworks:** why exceptions add complexity; define errors out of existence; masking; exception aggregation; "just crash?"; special-case elimination; taking it too far.
- **Predicted argument (check after reading):** he'll defend "no error" semantics against the objection that it hides failures — semantics should be chosen so common cases are not errors.
- **First principles (synthesis):** Everything comes down to redefining the contract so that the common case is simply correct behavior.
- **Application prompt:** Which error paths in your system exist only because the contract is badly drawn? Would an agent-flagged "error" pass Ousterhout's test, or is it a special case begging to be designed away?
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Exceptions are a major complexity source; reduce them by redefining semantics (deletion/substring examples), masking, aggregation, deliberate crashing, and eliminating special cases; don't take it so far that real failures are silently swallowed.
2. Sample reflection: "define errors out of existence" pairs oddly well with agents — they generate exhaustive-but-mechanical error handling; the design move (change the contract) is precisely what they won't do unprompted.
3. Sample action options: checklist line — "could this error not exist under a better contract?"; audit one API's exception surface.

</details>

### Chapter 11 — Design it Twice (Skim)

- **Purpose and fit:** a two-page habit; high value-per-page for your process.
- **Main thesis:** before implementing, sketch a second, genuinely different design; comparing alternatives sharpens both and usually produces a better hybrid.
- **Frameworks:** none beyond the practice itself (author's Tk toolkit redesign is his cited case in interviews).
- **Predicted argument (check after reading):** he'll claim the second design is cheap because the first design taught you the problem.
- **Application prompt:** For your next non-trivial module: have an agent produce design B after you've written design A (or vice versa). Is the comparison the real deliverable?
- **AI-angle:** The cost of a second design has collapsed. This may be the chapter whose practice changes *most* in the AI era — from rare discipline to default step.
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Always consider more than one design; alternatives reveal why the chosen one is better; the comparison itself is where the learning happens.
2. Sample reflection: "design it twice" is arguably the cheapest practice to automate — and the most likely to be skipped precisely because generation is easy.
3. Sample action options: make "show me two designs before code" a standing instruction to your coding agents.

</details>

### Chapter 12 — Why Write Comments? The Four Excuses (Deep)

- **Purpose and fit:** opens the five-chapter documentation block. The four excuses/rebuttals are checklist-ready, and §12.6 ("comments are failures" — Clean Code dispute) is where you must pick a side.
- **Main thesis:** comments are essential because code cannot capture intent, rationale, or abstraction; the four excuses (self-documenting code, no time, comments go stale, comments are worthless) all have answers; good comments repay their cost.
- **Frameworks:** the four excuses and rebuttals; benefits of well-written comments; 2nd ed.: rebuttal of "every comment is a failure to express yourself in code."
- **Predicted argument (check after reading):** his strongest claim will be that the information most worth writing down (why, cross-module decisions) has *nowhere else to live* — code can't hold it.
- **First principles (synthesis):** The key is that code shows what the system does; only comments can say what it was meant to do.
- **Application prompt:** In an agent workflow, who writes the comment — you, the agent, or the prompt? Does "comments capture intent" make them the *input* to generation rather than the output?
- **AI-angle:** Ousterhout (Pragmatic Engineer 2025): AI helps understand uncommented code but doesn't remove the need for comments. Simmering inverts Ch. 15 into a workflow: human writes comments/docstrings first as the spec; agent implements.
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Four excuses + rebuttals; comments capture what code cannot (intent, rationale, invariants); stale/worthless comments are a process failure, not an argument against commenting; explicit rejection of "comments are failures."
2. Sample reflection: in the Martin debate, both agreed the reader matters more than the writer — agents change who the reader is (a system with perfect memory but no intent inference). The "why" comments likely matter *more*, not less.
3. Sample action options: checklist line — "does this PR add the why, or only the what?"; decide your team's stance on agent-drafted comments (draft by agent, verified by human).

</details>

### Chapter 13 — Comments Should Describe Things that Aren't Obvious from the Code (Deep)

- **Purpose and fit:** the operational chapter of the comments block — what to write, at what level. Converts directly into review criteria.
- **Main thesis:** comments must add information, not restate code; low-level comments add precision (units, boundary conditions, null semantics, ownership), high-level comments add intuition; interface documentation describes usage, not implementation; cross-module design decisions must be written somewhere.
- **Frameworks:** comment conventions; don't repeat the code; precision vs. intuition levels; interface documentation structure; implementation comments = what and why, not how; cross-module decisions.
- **Predicted argument (check after reading):** his variable-comment questions (units? inclusive/exclusive? null meaning? who frees?) will be the most copy-paste-able checklist fragment in the book.
- **First principles (synthesis):** The reason most comments fail is they translate code into English instead of supplying what the code cannot say.
- **Application prompt:** Take one module an agent wrote for you: do its comments pass the "not obvious from the code" test, or are they fluent restatements? (This is a known failure mode of generated docs.)
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Comments add what's not obvious; precision at low level, intuition at high level; interface docs ≠ implementation comments; cross-module decisions need an explicit home; the §13.5 interface-doc questions for variables (units, bounds, null, ownership).
2. Sample reflection: generated comments are optimized for plausibility, not for information delta — "does this comment add information?" becomes the single most valuable review question for agent output.
3. Sample action options: adopt the four variable questions as a literal checklist; delete restatement comments on sight.

</details>

### Chapter 14 — Choosing Names (Deep)

- **Purpose and fit:** naming is the cheapest complexity lever and, in an agent context, the primary hook retrieval latches onto.
- **Main thesis:** precise, consistent names create a correct image in the reader's head; vague names cause real bugs (his six-month block/lblock filesystem bug); avoid extra words; consistency beats local cleverness (with a noted disagreement with Go's short-name style).
- **Frameworks:** names create an image; precision; consistent use (same name = same thing, three rules of consistency per the chapter); avoid extra words; Go style as counterpoint.
- **Predicted argument (check after reading):** he'll argue naming is a design activity, not a labeling afterthought — bad names are a symptom of an unclear abstraction.
- **First principles (synthesis):** Everything comes down to: a name is a tiny interface — vague names are leaky interfaces.
- **Application prompt:** Agents retrieve and pattern-match by name. Does that raise the stakes of consistent vocabulary in your codebase (one concept = one word, everywhere, including docs and prompts)?
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Names should create a precise image; imprecise names cause real bugs (block vs. lblock example); use names consistently; avoid extra words; Go's terse style noted as a different opinion.
2. Sample reflection: "same concept, same name" extends naturally to AGENTS.md/docs/prompts — an inconsistent vocabulary actively misleads retrieval, not just humans.
3. Sample action options: glossary of domain terms for your project; checklist line — "new name vs. existing concept: which wins?"

</details>

### Chapter 15 — Write The Comments First (Deep)

- **Purpose and fit:** the chapter with the largest potential workflow change in the AI era — comments as the design artifact that precedes code.
- **Main thesis:** write interface comments before implementation: delayed comments are bad comments; comments-first doubles as a design method (if the interface is awkward to describe, redesign it); early comments are cheap and even enjoyable.
- **Frameworks:** comments as a design tool; delayed-comment failure mode; cost analysis of early comments.
- **Predicted argument (check after reading):** his test — "a module is well-designed if its interface comments are simple to write" — will be the memorable heuristic.
- **First principles (synthesis):** The key is: if you can't say it simply in the comment, you haven't designed it yet.
- **Application prompt:** What happens if your *prompt* to an agent is literally the interface comment block? Is "comments first" the natural prompt-engineering discipline hiding in a 2018 book?
- **AI-angle:** Simmering's proposed loop: human writes comments/docstrings → agent drafts tests → agent implements until tests pass. Worth testing as your Action candidate for this chapter.
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Write comments before code; comments-first is a design tool (awkward comment ⇒ awkward design); delayed comments degrade; early comments are cheap.
2. Sample reflection: the practice predates and predicts spec-driven agent development; the human's comparative advantage (intent, interface) sits exactly where Ousterhout told us to start.
3. Sample action options: pilot "docstring-first prompt" on one feature; measure how much rework it saves.

</details>

### Chapter 16 — Modifying Existing Code (Deep)

- **Purpose and fit:** maintenance discipline — the chapter that most resembles supervising agent edits.
- **Main thesis:** stay strategic when modifying code (every change should improve structure, not just patch); keep comments near the code; comments belong in code, not the commit log; avoid comment duplication; check the diffs; higher-level comments survive change better.
- **Frameworks:** strategic modification; comment-maintenance rules (proximity, no duplication, review diffs); "comments in code, not commit log."
- **Predicted argument (check after reading):** he'll frame every edit as a small design decision — the maintenance version of Ch. 3's investment mindset.
- **First principles (synthesis):** The reason codebases rot is that every edit is allowed to make things slightly worse.
- **Application prompt:** Your agent-generated diffs: who checks that comments still match? "Check the diffs" is now a human job on machine output — is that your review checklist's core loop?
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Every modification should leave the design better or neutral, never worse; comment maintenance (proximity, no duplication, check diffs); design rationale lives in code comments, not commit history.
2. Sample reflection: "comments belong in the code, not the commit log" extends naturally — not in the agent's chat transcript either; the codebase is the only durable memory.
3. Sample action options: diff-review ritual that includes comment drift; forbid "patch-only" agent sessions without a structural note.

</details>

### Chapter 17 — Consistency (Skim)

- **Purpose and fit:** one principle, one page of enforcement ideas. Fold into the checklist as a single line.
- **Main thesis:** consistent conventions reduce cognitive load; document them, enforce them mechanically, and don't take consistency so far that it forbids genuine improvement.
- **Frameworks:** examples of consistency; ensuring consistency (style guides, automated enforcement); taking it too far.
- **Predicted argument (check after reading):** "the value of a convention is that it exists, not that it's optimal."
- **Application prompt:** Agents are superb consistency machines *when the convention is written down* — is your project's real convention set documented anywhere an agent reads?
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Consistency lowers cognitive load; conventions should be documented and auto-enforced; consistency shouldn't block real improvements.
2. Sample reflection: this chapter quietly became the AGENTS.md/linters/formatters era — consistency is the easiest principle to delegate to tooling and agents.
3. Sample action options: one line in checklist: "consistent with what — and is that written down?"

</details>

### Chapter 18 — Code Should be Obvious (Deep)

- **Purpose and fit:** operationalizes "obviousness" — the single most portable idea for reviewing code you didn't write (including machine-written code).
- **Main thesis:** code is obvious when a reader's first guess about it is right; obscurity hides in subtle dependencies, non-obvious types/units, event-driven control flow, and undeclared invariants; naming, consistency, white space, and comments increase obviousness.
- **Frameworks:** things that make code more obvious vs. less obvious (the chapter's two lists).
- **Predicted argument (check after reading):** he'll treat obviousness as measurable by a *reader's* effort, not the writer's — aligning with the reader/writer asymmetry from Ch. 2.
- **First principles (synthesis):** Everything comes down to: if the reader has to run the code in their head, the code has already failed.
- **Application prompt:** Agent output "works," so its obscurity passes unnoticed until a human debugs at 2 a.m. — should "obvious to a cold reader" be an explicit merge gate for generated code?
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Obviousness = the reader's first interpretation is correct; obscurity sources (subtle dependencies, unclear units/types, non-local control flow); obviousness aids (naming, consistency, layout, comments).
2. Sample reflection: obviousness is Ousterhout's proxy for the real goal — and the one least visible to generators, which optimize for plausibility-to-author, not clarity-to-stranger.
3. Sample action options: "cold-read test" for agent PRs (reviewer explains the code back before approving).

</details>

### Chapter 19 — Software Trends (Deep)

- **Purpose and fit:** the author stress-tests his principles against OO inheritance, Agile, unit tests, TDD, design patterns, getters/setters. Even critics (Koppel) note he mostly drops the principles here — read it as opinionated survey, then form your own positions.
- **Main thesis:** judged by complexity: inheritance adds complexity (prefer composition); Agile's increments are fine but each increment should be an abstraction, not a feature slice; unit tests are indispensable; TDD's tiny-steps tactical focus works against design (his exception: tests-first when fixing bugs); design patterns are useful but over-application is a red flag; getters/setters often leak implementation.
- **Frameworks:** each trend evaluated against the complexity framework; "increments should be abstractions" (a genuinely checklist-worthy line buried in a survey chapter).
- **Predicted argument (check after reading):** his TDD critique will be the sharpest (distracts from abstraction-first design); the Martin debate doc shows Martin's three-laws rebuttal — read both.
- **First principles (synthesis):** The reason trend-adoption fails is people adopt the *motion* without asking which complexity it removes.
- **Application prompt:** For each trend you currently practice: which of the Ch. 2 symptoms does it actually reduce for you? (Add "AI-assisted TDD" to the list: agents hill-climbing against tests may rehabilitate parts of TDD — cf. Simmering's workflow.)
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Inheritance → complexity (favor composition); Agile increments should be abstractions; unit tests yes / TDD mostly no (bug-fix exception); patterns and getters/setters in moderation.
2. Sample reflection: "increments are abstractions" may be the chapter's most durable sentence — and a direct criterion for slicing agent-sized tasks.
3. Sample action options: write your one-line position on each trend (agree/disagree/conditions); revisit TDD specifically with an agent test-generation experiment.

</details>

### Chapter 20 — Designing for Performance (Skim)

- **Purpose and fit:** three portable lines; low differentiation for your AI-era question, so skim and extract.
- **Main thesis:** simple designs are usually fast enough; measure before (and after) modifying; design around the critical path (RAMCloud Buffers example).
- **Frameworks:** measure-first discipline; critical-path design.
- **Predicted argument (check after reading):** performance work is the *exception* that justifies localized complexity — everything else stays simple.
- **Application prompt:** Do you let agents do performance rewrites unsupervised? (Recommended checklist line: performance changes require measurements in the PR description.)
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Prefer simple designs until measurement says otherwise; always measure; design around the critical path.
2. Sample reflection: the RAMCloud example shows even performance-critical code benefits from one clean central abstraction.
3. Sample action options: checklist line — "no perf claims without before/after numbers."

</details>

### Chapter 21 — Decide What Matters (Deep, 2nd ed. only)

- **Purpose and fit:** the newest chapter and the meta-principle: good design = separating what matters from what doesn't. This is the organizing rule for your final checklist.
- **Main thesis:** look for leverage (things that matter affect many others); minimize the set of things that matter; emphasize what matters via prominence, repetition, and centrality; the failure modes are treating too much as important and missing what is important.
- **Frameworks:** leverage; minimize-what-matters; emphasis techniques (prominence, repetition, centrality); the two mistakes; "thinking more broadly" (matters/not-matters beyond code).
- **Predicted argument (check after reading):** he'll connect this back to interfaces (an interface is a declaration of what callers need *not* care about).
- **First principles (synthesis):** Everything comes down to attention economics: design is deciding what a reader may safely ignore.
- **Application prompt:** Your final checklist can't check everything. After this chapter: which 8–12 items survive your own "decide what matters" pass?
- **AI-angle:** When generation is cheap, *attention* is the scarce resource — this chapter is the book's most direct bridge to the AI era.
- **Recall test:** same three questions.

<details><summary>Answer key: open after recall</summary>

1. Separate what matters from what doesn't; minimize what matters; emphasize the important (prominence/repetition/centrality); both over- and under-valuing things are design failures.
2. Sample reflection: this is the red-flag list's missing complement — red flags say "something here matters (it's wrong)"; Ch. 21 says the design must tell you what *doesn't* matter.
3. Sample action options: cap your review checklist and justify each item by "what does it let reviewers ignore?"

</details>

### Chapter 22 — Conclusion + Back Matter (Skim + Deep)

- **Purpose and fit:** the conclusion is brief; the **Summary of Design Principles** and **Summary of Red Flags** at the back are the book's own draft of your checklist.
- **Main thesis (conclusion):** the reward for strategic design is sustained development speed.
- **Application prompt:** Transcribe the red-flag list into your notes (Ideas section) in your own words — that's the first working version of the checklist; then diff it against what the AI era changes.
- **Recall test:** after finishing the book: (1) name five red flags from memory; (2) which principle do you most disagree with; (3) what three checklist items will you pilot on your next review?

<details><summary>Answer key: open after recall</summary>

1. Red flags to expect (verify against the book's list): shallow module, information leakage, temporal decomposition, pass-through method/variable, conjoined methods, repetition, special-general mixture, overexposure of configuration, vague name, hard-to-describe comment, nonobvious code. Accept equivalents.
2. Personal — no key.
3. Personal — but "nothing will change" is a signal to re-read Ch. 3 and Ch. 21.

</details>

## Recall keys usage

Each chapter's key sits in a closed `<details>` block. Answer the three questions aloud or in the **Ideas**/**Actions**/**Questions** sections *before* opening the key. The key checks question 1 (factual, source-supported) and offers samples for questions 2–3, which are yours, not tests. "Nothing surprised me" is an honest answer; record it and move on. Every 30–45 minutes of continuous reading, stop and do the recall for the chapters just covered.

## Session checklist (no-rush pacing, print/ebook)

1. **Foundations:** Ch. 1 (skim) → Ch. 2 → Ch. 3. Stop after Ch. 3; recall 2–3.
2. **Module core:** Ch. 4 → Ch. 5 → Ch. 6. Recall after each; Ch. 6 deserves a slow pass (2nd-edition material).
3. **Techniques:** Ch. 7 → Ch. 8 → Ch. 9 → Ch. 10 → Ch. 11 (skim). Read §9.8 alongside the Martin debate excerpt on method length.
4. **Documentation block:** Ch. 12 → 13 → 14 → 15 → 16. This is the longest block; split it at Ch. 14 if attention drops. Read §12.6 alongside the debate excerpt on comments.
5. **Trends & synthesis:** Ch. 17 (skim) → 18 → 19 → 20 (skim). Read Ch. 19 alongside the debate excerpt on TDD.
6. **Meta & wrap:** Ch. 21 → 22 → transcribe the back-matter red flags into **Ideas**, consolidated into 3–5 **Actions**.

**After the plan:** consolidate the whole book into 3–5 actions (skill target), e.g. candidates seeded above: a red-flag review checklist, a "who absorbs this complexity?" question, docstring-first agent prompts, two-designs rule, cold-read gate for generated code.

**Supplementary (optional, after Ch. 9/12/19):** the Ousterhout–Martin debate: <https://github.com/johnousterhout/aposd-vs-clean-code>. For the AI-era angle after finishing: the Pragmatic Engineer interview and Simmering's "A Philosophy of AI Coding."
