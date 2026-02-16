---
name: documentation
description: Always use this skill when you need to read, update or create documentation. This skill contains complete information about how the documentation is structured and how to use it.
---

# Documentation

This skill governs all documentation inside the docs/ directory and project specific AGENTS.md.

The goal is to document the entirety of the project in a structured, navigable, and agent-readable way. Documentation must allow:

A developer to understand and modify a part of the system confidently.

A coding agent to implement changes without scanning the entire repository.

Documentation must always be updated after modifications or additions to the project.

## Documentation Index

The AGENTS.md file contains a section called:
```markdown
## Documentation Index
```

This index lists all topic documentation files and groups them into categories.

### Categories Are Required

Documentation must be grouped into logical categories. Categories improve discoverability and reduce cognitive load for both developers and AI agents.

Examples of categories:
```markdown
### Architecture
### Domain
### Infrastructure
### Integrations
### Core Concepts
### Background Processes
```

Not all projects require all categories. Categories should reflect the structure and complexity of the project.

Laravel projects may rely more heavily on domain and infrastructure topics, while more complex systems may require architecture and domain maps.

### Index Format
```markdown
## Documentation Index

### Architecture
- [System Overview](docs/system-overview.md): High-level explanation of the system structure and boundaries.
- [Domain Map](docs/domain-map.md): Overview of major domains and how they interact.

### Domain
- [Orders](docs/orders.md): Order lifecycle, status transitions, pipelines, and related files.
- [Authentication](docs/authentication.md): Authentication mechanisms, middleware, guards, and flows.

### Infrastructure
- [Queue System](docs/queue-system.md): Background job processing and workers.
```

Each entry must include:
- Title
- Path
- Short description explaining when to read it

There is no limit to the number of topics.

## When to Create a New Topic
Create a new topic if:
- It is an important reusable part of the project consisting of multiple or large files.
- It has business logic significance.
- A concept has grown beyond 10 sentences in AGENTS.md.
- It has pitfalls that need to be avoided.
- Code was added or updated and no topic exists for that area yet.
    - Example: If order status logic is added and no Orders topic exists, create one.
- It spans multiple files or has flow/lifecycle behavior.

The goal is to document the entirety of the project. Nothing is too small to document.

However:

If something can be fully explained in 1–5 sentences, it should not become a topic file and should instead be placed inside AGENTS.md.

## When NOT to Create a New Topic

Do not create a new topic if:

- It is purely internal to another topic.
    - Update that topic instead.
- It does not introduce reusable logic, flow, or business significance.
- It can be explained clearly in a few sentences.

## Topic File Structure (Mandatory Template)

Every topic file in docs/ must follow this structure:

```markdown
# <Topic Title>

## Purpose
What this topic represents and why it exists in the system.

## High-Level Overview
Conceptual explanation of how it works.

## Architecture & Flow
Step-by-step explanation of lifecycle and behavior.
Explain how data moves through this part of the system.

## Relevant Files
- path/to/file.php — short description
- path/to/another/file.php — short description
- config/file.php — configuration if applicable

List entry points clearly (controllers, commands, jobs, services, middleware, listeners, etc.).

## Data Flow (If needed - Conceptual topics that aren't code don't necessarily have data flow)
How data enters, is transformed, and exits this part of the system.

## Configuration (If needed - not all topics have configuration)
Environment variables, config files, feature flags (if applicable).

## Common Use Cases
1.
2.
3.

## Example Usage (If Needed)
Short illustrative example when necessary.

## Edge Cases & Pitfalls
- Potential failure modes
- Common mistakes
- Implicit constraints

## Best Practices
- Recommended usage patterns
- Design constraints
- Implementation guidance

## When NOT To Use This (If needed - usefull for re-usable classes or functions)
Scenarios where this approach should be avoided.

## Related Topics
Links to other documentation files.
```

All sections must be present unless clearly not applicable.

Consistency across topic files is required.

## Depth and Completeness Standard

A topic is considered complete when:
- A new developer can modify or extend this area without scanning unrelated parts of the codebase.
- A coding agent can implement changes in this domain with high confidence.
- The lifecycle and data flow are fully explained.
- Entry points and relevant files are clearly listed.
- Dependencies and interactions are understandable.

Documentation must explain:

- What it does
- Why it exists
- How it works
- Where it lives
- How it is used
- When not to use it

## Updating Documentation

Whenever implementation changes, documentation must be reviewed and updated.

When updating documentation:
- Read the entire topic file.
- Verify consistency with the new implementation.
- Update sections affected by the change.
- Remove outdated or incorrect content.
- Restructure sections if clarity or accuracy requires it.
- Ensure no contradictions remain.
- Update the Documentation Index if:
- A new topic was created.
- A topic was renamed.
- Scope significantly changed.
- Do not append blindly.
- Refactor documentation when necessary to maintain clarity and correctness.

## Interaction Between AGENTS.md and Topics

AGENTS.md should contain:

- Project-specific operational guidance.
- Small explanations (1–5 sentences).
- The Documentation Index.

If a concept grows beyond 10 sentences inside AGENTS.md, it must be moved into a dedicated topic file.

## Core Principles
- Documentation must evolve with the project.
- Documentation must be structured and consistent.
- Documentation must support both humans and AI agents.
- Documentation must cover the entire system over time.
- Topics must explain lifecycle and data flow.
- Categories in the index are mandatory and improve navigation.
