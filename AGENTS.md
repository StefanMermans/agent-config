# Global guidelines

This file contains global instructions. Project-specific AGENTS.md and skills extend this.

## Default Operating Procedure (always follow)

1. Gather project context
   - Read the README.md (if it exists).
   - Use the documentation skill to understand the project.
   - Important Use appropriate guidelines skills based on the current project if available. Sometimes multiple guidelines apply, in which case you should use all that apply.
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
