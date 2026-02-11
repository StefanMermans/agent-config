# Global AGENTS.md (Codex Guidance)

This file contains global instructions for Codex. Project-specific AGENTS.md overrides or extends this.
Framework-specific guidance (e.g. Laravel) is included only as conditional rules and must not be applied to other projects.

---

## 0) Default Operating Procedure (always follow)

1. Gather project context
   - Read the README.md (if it exists).
   - Use the documentation skill to understand the project.
   - Important Use appropriate guidelines skill based on the current project if available.
2. Confirm intent
   - Identify: scope, expected behavior, constraints, and definition of done.
   - If unclear: Feel free to ask questions before continuing
3. Inspect codebase patterns
   - Match existing architecture, naming, conventions, and libraries.
4. Plan before changes
   - Brief plan (in chat) for non-trivial tasks.
5. Implement minimal diff
   - Only touch code required for the task.
   - Avoid refactors unless needed to implement or to prevent obvious issues.
6. Run relevant checks/tests
   - Use the project’s documented commands (see README / project AGENTS.md).
7. Summarize
   - Provide: what changed, files touched, how to test, and any risks.
8. Update documentation using the update-documentation skill


## 9) Framework-specific guidance (apply ONLY if the project uses Laravel)

### Laravel Conventions
- Prefer framework-native patterns:
  - Use Form Requests for complex validation
  - Use Policies for authorization
  - Use Transactions for multi-step writes
  - Avoid N+1 queries by eager loading (`with`, `load`)
  - Use API Resources (`JsonResource`) for response shaping
  - Prefer config/env over hardcoding
- Prefer dependency injection where it improves testability/clarity.
- Use php's stict typing
- Use phpdoc for type templating when neccesary (for example with relations)

### Laravel Testing Guidelines
- Prefer Laravel’s default test runner and conventions.
- Prefer factories/builders for test setup.
- Always use `fake()` for values isntead of harcoding unless a fixed value is absolutely required.
- Keep tests deterministic (freeze time when needed).

### Laravel Tooling
- If the project documents artisan usage, prefer the project’s generators and commands.
