---
name: publish-one-on-one-notes
description: Draft and publish compact, manager-reviewed one-on-one minutes from an isolated release bundle. Use after a meeting debrief when updating a report's shared one-on-one document without exposing private preparation, journal, memory, email, Slack, project, or code context.
---

# Publish one-on-one notes

Operate only inside an isolated release workspace. The privacy boundary is a
capability boundary, not a request to remember which content is private.

## Require isolation

If this conversation or process has accessed private preparation, journal,
memory, email, Slack, project, ticket, standup, or code sources, stop. Tell the
manager to start a fresh process whose filesystem access is limited to the
release bundle.

Create a bundle before the fresh process with:

    one-on-one-release-bundle <shared-document> <transcript> [approved-note]

The command prints the new bundle directory. The only permitted input files
are:

- shared-document.md
- transcript.txt
- manager-approved-note.md, when supplied

Refuse to draft if other management source material is mounted or if the
shared document and transcript cannot be identified unambiguously.

## Draft compact minutes

Use only the permitted inputs. Produce draft-minutes.md with:

1. Topics discussed
2. Decisions
3. Action items with explicit owners and dates
4. Open questions
5. Updated Next items

Do not turn uncertain transcript language into a fact. Do not add role,
ownership, intent, performance, or policy claims that the transcript does not
support.

Include personal or sensitive discussion only when it belongs in the lasting
shared record and the manager explicitly approves it.

Preserve the report's existing Next items unless the transcript clearly
resolves them. Add new Next items only when the conversation supports them.

## Review and publish

Show the manager the exact proposed change to shared-document.md. Do not write
to any shared system before explicit approval.

After approval, apply exactly the reviewed change. If this isolated process has
write access limited to the target shared document, update it. Otherwise,
update the bundled shared-document.md and return the approved diff for a
separate exact-apply step.

Never reconnect this process to the private workspace. Report the temporary
bundle location so the manager can remove it according to the transcript
retention policy.
