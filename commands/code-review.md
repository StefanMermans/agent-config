---
name: code-review
description: Comprehensive security and quality review of uncommitted changes
---

# Code Review

Comprehensive security and quality review of uncommitted changes:

1. Get changed files from commit $1 up to and including commit $2 
  - If no commit is provided, do not yet start a review, but ask the user where to look for changes (e.g. last commit, last 5 commits, mcp etc.)
  - If only a single commit is provided, assume that the up to and including commit is HEAD
2. For each changed file, check for:

**Guideline adherence:**

- Use applicable guidelines skills to determine the guidelines that should be followed

**Security Issues (CRITICAL):**

- Hardcoded credentials, API keys, tokens
- SQL injection vulnerabilities
- XSS vulnerabilities
- Missing input validation
- Insecure dependencies
- Path traversal risks

**Code Quality (HIGH):**

- Functions > 50 lines
- Files > 800 lines
- Nesting depth > 4 levels
- Missing error handling
- Missing tests for new code
  - We require full test coverage for all code paths and edge-cases
- TODO/FIXME comments
  - These should never be present in the code an should instead be addressed or a new ticket created

**Best Practices (MEDIUM):**

- Mutation patterns (use immutable instead)
- Accessibility issues (a11y)

1. Generate report with:
   - Severity: CRITICAL, HIGH, MEDIUM, LOW
   - File location and line numbers
   - Issue description
   - Suggested fix

Never approve code with security vulnerabilities!
