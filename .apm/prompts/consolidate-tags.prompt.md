---
description: Suggest vocabulary consolidation for a new article’s tags without modifying files.
---

# Consolidate article tags

Review a new article’s tags against the vocabulary used by the existing article pool. Suggest improvements that avoid synonyms and consolidate vocabulary while preserving useful distinctions.

## Inputs

- Use the article path supplied by the user; otherwise use the active document.
- Use the article pool supplied by the user; otherwise use Markdown articles under `content/` in the current workspace.
- Ask for clarification if the target article or pool cannot be identified.

## Read-only workflow

Do not modify any files, apply replacements, create commits, or run commands that change workspace state. Return suggestions only.

1. Read the target article, including its YAML front matter.
2. Read the pool’s article tags and build an inventory mapping every tag to every document using it.
3. Exclude the target article when determining which terms are already established.
4. Compare each target tag with the existing vocabulary.
5. Read relevant article content when needed to establish whether tags actually express the same concept.

Use the `tags` front-matter field unless the workspace explicitly configures another tag source. Do not treat categories, authors, or incidental body text as tags.

## Decision principles

- Prefer an established term when it accurately captures the new article’s meaning.
- Consider spelling, capitalization, singular/plural forms, abbreviations, and genuine synonyms.
- Use normalized forms for comparison, but report exact tag spellings.
- Do not equate related concepts, broader/narrower concepts, or frequently co-occurring tags.
- Prefer the smallest vocabulary change that preserves meaning.
- Consider existing usage frequency and semantic fit; popularity alone is insufficient.
- Retain genuinely distinct new tags rather than forcing consolidation.
- Flag uncertainty instead of inventing equivalence.

## Allowed suggestions

### Simple replacement

Suggest replacing new tag **A** with existing term **B** when they express the same intended concept.

Explain why **B** fits. Link every document using **A** and every document using **B**, including the target article where applicable.

### Merge

Suggest merging new tag **A** and existing tag **B** into term **C** when neither current term is a suitable canonical label and **C** accurately covers both.

Explain why replacement alone is insufficient and why **C** is preferable. Identify whether **C** already exists in the pool.

Link every document using **A**, **B**, and **C**, if applicable. If **C** is unused, explicitly label it as proposed with no current documents.

## Output

Begin with the target article link and the inspected pool scope.

Group suggestions under:

1. **Simple replacements**
2. **Merges**
3. **Keep or clarify**

For each replacement or merge, provide:

- **Proposal:** `A → B` or `A + B → C`
- **Reason:** brief semantic justification
- **Confidence:** high, medium, or low
- **Tag usage:** each exact tag followed by Markdown links to every document using it

Use document titles as link labels where available and workspace-relative paths as link destinations. Do not substitute unlinked filenames or search instructions for document links.

Under **Keep or clarify**, briefly list tags that should remain distinct or require a decision, with supporting document links.

If no consolidation is justified, say so. Report inaccessible files or incomplete coverage explicitly; do not claim an exhaustive inventory unless the entire pool was inspected.

Finish with: **Suggestions only; no files changed.**