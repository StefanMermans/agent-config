---
description: Always use this skill when you need to read, update or create documentation. This skill contains complete information about how the documentation is structured and how to use it.
---

# Documentation

In the project specific AGENTS.md file there is a section called "Documentation Index" that lists all the documentation files in the project. Use this to find the correct file to update or create a new file if needed.

## Create Documentation

Create a new topic file in the docs/ directory with the following format:

```
# <title>

<content>
```

This file should contain information about a specific topic. It should be comprehensive and complete. The goal of these documentation files is to provide complete context and information about a specific topic. So that a developer or AI agent can understand everything about a topic be reading that specific topic file.

## Updating Documentation

Updating doucmentation is basically the same as creating documentation. When updating documentation, you should always update the documentation index in the AGENTS.md file to include the new or updated file.

## Documentation index explained

The documentation index section in the AGENTS.md file is a list of all the documentation files in the project by topic. Use it to quickly lookup information about a specific topic when it is relevant to the task.

The documentation index should look like this. There is no limit to how long the documentation index can be or how many files there can be.
```
- [Topic Name 1](docs/topic-name-1.md): Description of what this file covers and when to read it.
- [Topic Name 2](docs/topic-name-2.md): Description of what this file covers and when to read it.
```
