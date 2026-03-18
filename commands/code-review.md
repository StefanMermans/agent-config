---
name: code-review
description: Comprehensive security and quality review of uncommitted changes
---

# Code Review

Comprehensive security and quality review of uncommitted changes:

1. Figure out what changes you must review based on user request or by looking at the git status. if there is any doubt ask the user to clarify which files or changes they want you to review.
2. Do not review the code yourself, instead use the Code-reviewer sub agent to look at the code and do the review.
3. Start the Code-reviewer sub agent to do the review. which must give you a report of the review. Never approve code with security vulnerabilities!
4. After the sub agent finishes present the report to the user, you may omit previously addressed issues.
