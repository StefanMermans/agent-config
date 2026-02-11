---
name: learn
description: Learn by updating or creating skills in ~/.opencode/skills
---

# Learn Command

Extract patterns, learnings, and reusable insights from the current session: $ARGUMENTS

## Your Task

Analyze the conversation and code changes to extract:

1. **Patterns discovered** - Recurring solutions or approaches
2. **Best practices applied** - Techniques that worked well
3. **Mistakes to avoid** - Issues encountered and solutions
4. **Reusable snippets** - Code patterns worth saving

## Output Format

Create or update a skill in `~/.opencode/skills/<skill-name>/SKILL.md`
Some good templates and ideas for skills are:
### a) coding guidline
```php
// ❌ BAD: some bad practice
some code here

// ✅ GOOD: good practice
some code here
```

### b) list of practices and things to keep in mind
- Clean coding practice
- Standard practice
   - sub practice
   - explaination
- document layout explaination

### c) example directory layout
-- folder
   | -- sub folder
   |    | -- file
   | -- file
   | -- file

### d) code examples
Always follow test pattern
```typescript
const standardCodeAppraoch = () => {
  // some code here
}

const alternativeCodeApproach = () => {
  // some code here
}
```

### Patterns Discovered

**Pattern: [Name]**
- Context: When to use this pattern
- Implementation: How to apply it
- Example: Code snippet

### Best Practices Applied

1. [Practice name]
   - Why it works
   - When to apply

### Mistakes to Avoid

1. [Mistake description]
   - What went wrong
   - How to prevent it

