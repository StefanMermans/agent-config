# /validate-markdown

Use a subagent to validate and fix Markdown files.

## Trigger

Run `/validate-markdown` at any point during a session after you have modified or created Markdown file(s).

## What to do

Start a subagent and tell it to use the skill to validate and fix Markdown files. The subagent should:

- Run this command to validate the Markdown
- Fix the Markdown
- Repeat until the Markdown is fully valid

## What to avoid

Do not validate or fix Markdown yourself. The subagent should handle this fully.
