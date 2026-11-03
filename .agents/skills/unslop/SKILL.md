---
name: unslop
description: Use when you must output formulated, polished, editorial, persuasive, narrative, or publication-ready prose. Remove AI tells while preserving meaning and intended tone.
license: MIT
compatibility: opencode
metadata:
  source: https://github.com/cursor/plugins/blob/main/pstack/skills/unslop/SKILL.md
---

# Unslop

Use this skill to remove AI tells from formulated or polished prose. Preserve meaning. Match the intended tone. Add a human voice when the context permits it.

Do not use this skill for terse operational communication, tool output, logs, prompts, or instructions. Use ASD-STE100 for those cases.

## Process

1. Scan for the patterns below.
2. Rewrite the text without changing the meaning.
3. Add voice, specificity, and natural rhythm when the text calls for prose.
4. Self-audit: "What makes this obviously AI generated?" Fix what remains.

## Add human voice

- Have opinions when the format allows them.
- Vary sentence length.
- Acknowledge real complexity instead of flattening it.
- Use "I" when first person fits the context.
- Allow natural structure. Do not force perfect symmetry.
- Be specific. Replace generic claims with concrete facts.

## Patterns to fix

### Content

- Puffery: pivotal moment, testament to, evolving landscape, setting the stage for, indelible mark, deeply rooted.
- Name-dropping without context.
- Empty -ing phrases: highlighting, ensuring, reflecting, showcasing, fostering.
- Promotional language: nestled, vibrant, breathtaking, groundbreaking, renowned, stunning, must-visit.
- Vague attribution: experts believe, industry reports suggest, some critics argue.
- Formulaic contrast: despite challenges, continues to thrive.

### Language

- AI vocabulary: additionally, crucial, delve, enduring, enhance, fostering, garner, interplay, intricate, landscape, pivotal, showcase, tapestry, testament, underscore, vibrant.
- Fancy forms of "is": serves as, stands as, boasts, features.
- "Not just X, but Y" structures.
- Forced groups of three.
- Synonym cycling for the same concept.
- False ranges such as "from X to Y" when the items are not on a scale.

### Style

- Em dash overuse. Prefer periods or commas.
- Colon overuse as a mid-sentence connector.
- Boldface overuse.
- Inline-header lists that repeat themselves.
- Title case headings. Use sentence case.
- Decorative emoji.
- Curly quotes. Use straight quotes.

### Chat artifacts

- "I hope this helps!"
- "Let me know if..."
- "Of course!"
- "Certainly!"
- "Great question!"
- Sycophantic agreement.
- Cutoff disclaimers that excuse missing detail.

### Filler

- "In order to" -> "To".
- "Due to the fact that" -> "Because".
- "It is important to note that" -> delete.
- Excessive hedging.
- Generic conclusions such as "The future looks bright."

### Jargon

Replace abstract metaphor nouns with concrete words when possible:

- substrate -> base
- wedge -> way in, or specific mechanism
- vector -> way or method
- primitive -> basic type, operation, or API
- surface -> API or interface
- scaffolding -> support code or setup
- paradigm -> model or approach
- endgame -> last phase
- north star -> goal
- flywheel -> feedback loop or growth loop

## Plain speech checks

- Say what the thing does, not how it feels.
- Split dense sentences.
- Prefer active voice.
- Cut adverbs, or use a stronger verb.
- Prefer the plain word.

## Output

Return the revised prose. Do not add a process note unless the user asks for one.
