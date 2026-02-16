---
name: documentation
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

## What should be in these topic files

The topic specific files should contain information about a specific topic. It should be comprehensive and complete. The goal of these documentation files is to provide complete context and information about a specific topic. So that a developer or AI agent can understand everything about a topic be reading that specific topic file.
A topic can be anything from a concept used in the proejct to a specific class function or group of classes and functions. use a logical seperation of topics to make it easy to navigate and find the information you need. An example of a good topic is "Authentication" which would then explain how authentication works in the project and which files are relevant to it. It would contain and explaination of the available authentication methods, examples of how to authenticate and where to look for the authentication code.
Another example would be a topic on "orders" which would explain how orders work in the project and which files are relevant to it. It would contain and explaination of the available order methods, examples of how to order and where to look for the order code. It would also contain information about the order process and how it works. the different pipelines an order could take and where to look for these pipelines.

Among other things it should contain:
- Pointers to files relevant to the topic which can be read if more specific information is needed.
- Potential pitfalls and how to avoid them.
- Common use cases and examples.
- Best practices and recommendations.
- Explaination for how and why something works the way it does.
- How to use it and when to use it.
- When not to use it.

These topic should avoid being overly verbose and instead provide a concise overview of the topic. It should be easy to read and understand. It should be easy to navigate and find the information you need.
Avoid the the following:
- Copying and pasting code.
- Copying and pasting documentation from other sources.
- Copying and pasting documentation from other files in the project.

## Documentation index explained

The documentation index section in the AGENTS.md file is a list of all the documentation files in the project by topic. Use it to quickly lookup information about a specific topic when it is relevant to the task.

The documentation index should look like this. There is no limit to how long the documentation index can be or how many files there can be.
```
- [Topic Name 1](docs/topic-name-1.md): Description of what this file covers and when to read it.
- [Topic Name 2](docs/topic-name-2.md): Description of what this file covers and when to read it.
```
