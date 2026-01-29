# Global AGENTS.md (Codex Guidance)

This file contains global instructions for Codex. Project-specific AGENTS.md overrides or extends this.
Framework-specific guidance (e.g. Laravel) is included only as conditional rules and must not be applied to other projects.

---

## 0) Default Operating Procedure (always follow)

1. Gather project context
   - Read the README.md.
   - Check the "Documentation Index" in the `AGENTS.md` and read *only* relevant files in `docs/`.
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
8. Update Docs
   - When learning persistent project knowledge:
     1. Create/Update a topic-specific file in `docs/` (one topic per file).
     2. Add/Update the entry in the "Documentation Index" in the `AGENTS.md` using the template.

---

## 1) Coding Principles (priority order)

### A) Correctness > Clarity > Consistency > Performance > Cleverness
- Do not introduce clever abstractions.
- Prefer boring, standard solutions that match the repo style.

### B) DRY (practical)
- Avoid repeating logic that might change.
- Avoid multiple large chunks of code in a single function. 
- Extract shared logic into:
  1) private method (same class)
  2) dedicated service (bounded context)
  3) helper (only if truly global and reusable)

### C) SOLID (practical)
- Classes/functions should have one reason to change.
- Prefer composition over inheritance.
- Depend on interfaces/contracts where it improves testability and flexibility.

---

## 2) Variables & Functions (readability rules)

- Prefer clear naming over fewer variables.
- Inline values only if it improves clarity and avoids noise.
- Extract a function when:
  - a block repeats,
  - a block is hard to name inline,
  - it improves testability.

---

## 3) Comments Policy

- Avoid inline comments.
- Prefer descriptive names and small functions.
- Allowed comments:
  - Non-obvious constraints
  - Workarounds for external bugs
  - “Why” something is done (not “what”)

---

## 4) Database & Migrations Safety (language/framework-agnostic)

- Prefer additive, backwards-compatible schema changes when possible.
- Avoid destructive changes unless explicitly required.
- For destructive changes:
  - Call out irreversibility and data risk.
  - Provide a safe plan (two-step deploy or backfill approach).
- For large tables:
  - Avoid long-running locks where possible.
  - Prefer online/low-lock patterns (nullable column → backfill in batches → add constraints).
- Always consider rollback behavior:
  - Implement a rollback when feasible.
  - If rollback is unsafe, explicitly document it.
- Never drop/rename in a way that breaks running code during rolling deploys unless coordinated.

---

## 5) Performance & Query Hygiene (framework-agnostic)

- Default to clarity, but avoid obvious performance pitfalls.
- When touching query/data-heavy code:
  - Avoid N+1-style behavior (load in batches, use joins/eager loading equivalents).
  - Avoid fetching full records when only checking existence/count.
  - Paginate/limit large result sets.
  - Select only needed fields for large reads.
- Add indexes for frequently filtered/sorted columns where appropriate.
- Mention any performance-related changes in Notes/Risks.

---

## 6) Git / Commits

- Do not commit changes unless otherwise instructed.
- The user handles commits.

---

## 7) Linters / Static Analysis

- Do not run linters (eslint/phpstan/etc.) unless explicitly requested.
- However, write code that would pass typical linters.

---

## 8) Global Helpers

- Only create global helpers when reuse is likely across the codebase.
- If you add global helpers, document them in the project's README or AGENTS.md.

---

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

