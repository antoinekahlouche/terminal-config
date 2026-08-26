---
name: asd-ste100
description: Use for user-facing communication, inter-agent instructions, prompts, tool descriptions, error messages, status reports, and other English that must be clear, literal, and hard to misread. Not for creative or marketing copy.
license: MIT
compatibility: opencode
metadata:
  source: https://github.com/danyuchn/asd-ste100-skill
  upstream-version: 0.4.0
---

# Simplified Technical English (ASD-STE100)

Use this skill to write English that is easy to parse and hard to misread. It is inspired by ASD-STE100, a controlled-language standard for aerospace maintenance text.

This skill does not include the official ASD dictionary. Do not claim certified ASD-STE100 compliance. Use the rules below to make text clear and unambiguous.

## When to use this skill

- Communicate with the user.
- Write instructions, prompts, tool descriptions, errors, warnings, or status reports.
- Rewrite dense, hedged, jargon-heavy, or ambiguous text.
- Write text for another agent, a translation system, or a non-native English reader.

Do not use this skill for creative or marketing copy where voice, nuance, or persuasion is the goal.

## Modes

Use **Strict** mode for instructions, errors, prompts, safety text, tool descriptions, and inter-agent text.

Use **STE-flavored** mode for README text, PR descriptions, changelogs, and explanations. In this mode, enforce structure but allow natural word choice when it helps understanding.

## Core rules

- Use active voice when the actor matters.
- Put one instruction or idea in each sentence.
- Keep instructions to 20 words or fewer when possible.
- Keep descriptions to 25 words or fewer when possible.
- Do not use semicolons.
- Avoid em dashes when they join separate ideas. Split the sentence instead.
- Avoid phrasal verbs such as "spin up", "reach out", "dive into", and "kick off".
- Use the same word for the same thing throughout the text.
- Do not rotate synonyms for style.
- Prefer verbs over noun phrases. Write "analyze the log", not "perform an analysis of the log".
- Avoid noun stacks longer than three words.
- Keep necessary articles, subjects, and verbs. Do not omit words in ways that create ambiguity.
- Preserve hedges and scope. Do not turn "may fail" into "fails".
- Do not add causes, frequencies, or mechanisms that the source text does not state.
- Use lists for three or more steps, conditions, or related items.
- Keep each paragraph to one topic.

## Lexical guidance

Use plain, common words. Replace weak or vague wording:

- "utilize" -> "use"
- "leverage" -> "use"
- "facilitate" -> "help"
- "in order to" -> "to"
- "due to the fact that" -> "because"
- "perform an analysis" -> "analyze"
- "provides assistance" -> "helps"
- "spin up" -> "start"
- "reach out" -> "contact"
- "dive into" -> "read" or "examine"

Delete marketing adjectives unless they add measurable information. Examples: seamless, robust, powerful, cutting-edge, effortless, blazing-fast, vibrant, groundbreaking.

## Process

1. Read the source text once for meaning.
2. Choose Strict or STE-flavored mode.
3. Find ambiguity, long sentences, passive voice, noun phrases, synonym rotation, weak verbs, and unsupported claims.
4. Rewrite the text without changing its facts, scope, or confidence.
5. Return only the rewritten text by default.

## Output

By default, output the rewritten text only. Do not add a preface, rule count, summary, or closing offer.

If the user asks for reasons, output a table:

| Rule violated | Original | Simplified |
|---|---|---|
| Passive voice | "The file is deleted by the agent." | "The agent deletes the file." |

End with one line that states the mode and violation count.

If a phrase must stay longer to preserve precision, add one line after the rewritten text:

`Kept as-is: <phrase>, because <reason>.`

## Boundaries

This skill will:

- Make English shorter, clearer, and less ambiguous.
- Preserve every fact, condition, exception, and hedge.
- Suggest a short glossary entry for necessary technical terms.

This skill will not:

- Reproduce the official ASD-STE100 dictionary.
- Certify text as aerospace-grade ASD-STE100 compliant.
- Simplify creative or marketing text.
- Make weak or empty content useful by changing its style.
