---
name: flink-pr-reviewer
description: Performs an in-depth PR review for Apache Flink. It analyzes PR descriptions, references JIRA tickets (FLINK-*), explains changes for users with basic Flink knowledge, and provides structured suggestions (nit, minor, major, critical) with code blocks and a final verdict.
---

# Flink PR Reviewer

This skill guides you through an exhaustive, human-like PR review process for Apache Flink. Your review must be as in-depth as possible, examining the changes file-by-file and line-by-line. Take your time to thoroughly understand every single modified line.

## Workflow

### 1. Gather Context
- Identify the PR (e.g., via `gh pr view` or branch comparison).
- Extract the PR description.
- **JIRA Search**: Look for `FLINK-XXXXX` patterns in the description.
- Use `web_fetch` to read the JIRA ticket at `https://issues.apache.org/jira/browse/FLINK-<ID>` to understand the "Why" behind the change.

### 2. Understand and Explain
- Summarize the "Gist" of the change.
- Provide "In-depth Knowledge" of why this change is needed, referencing the JIRA context.
- **Audience Check**: Explain complex Flink concepts (State, Checkpointing, Watermarks, etc.) simply. Refer to [references/flink_basics.md](references/flink_basics.md) for guidance on simple explanations.

### 3. Exhaustive Analysis & Generate Suggestions
- **File-by-File, Line-by-Line**: You MUST analyze the entire diff file by file. Do not skip over any files, no matter how small or large. For every file, examine each changed line to verify its correctness, performance implications, stylistic alignment, and architectural fit.
- **Deep Dive**: If a file requires fetching additional context (like reading the original file contents to understand the full method), use `read_file` or `grep_search` before making a judgment.
- For each point of interest, use the following format:

```suggestion-type
[File Path]
```cpp
// Code block showing the context
- old_code
+ new_code
```
**Suggestion**: Your detailed explanation and recommended fix. Explain exactly *why* it is an issue at the line level.
```

- **Suggestion Types**:
  - `nit`: Small stylistic or non-functional improvements.
  - `minor`: Minor logic improvements or edge case handling.
  - `major`: Significant logic errors, performance issues, or API design concerns.
  - `critical`: Severe bugs, data loss risks, or security vulnerabilities.

### 4. Self-Correction & Verification
- **Internal Monologue**: Re-read all generated comments.
- Ask: "Is this a false positive?", "Did I misunderstand the Flink internal API?", "Is this suggestion idiomatic for Flink?".
- Filter out any weak or incorrect suggestions. Ensure you have not missed any files from the PR.

### 5. Final Verdict
- Provide a summary of the exhaustive review.
- State a final verdict: **Approve**, **Request Changes**, or **Comment**.

## Guidelines

- **Exhaustive Scope**: Never summarize your review at a high level. You must detail your findings across the entire PR footprint.
- **Flink Idioms**: Check for proper use of `ConfigOption`, `TypeInformation`, serialization, and thread safety.
- **Testing**: Ensure that corresponding tests are added or updated in the PR.
- **Documentation**: Check if `FLINK.md` or other docs need updates.
- **Patience**: It is acceptable to generate a long response if the PR is large. The user wants depth over brevity.
