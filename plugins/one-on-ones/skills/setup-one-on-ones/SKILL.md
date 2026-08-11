---
name: setup-one-on-ones
description: Set up a portable, text-first one-on-one workspace for a manager and their reports. Use when starting the one-on-one process in a blank workspace, adding a report, or configuring source permissions and privacy boundaries.
---

# Set up one-on-ones

Create the smallest workspace that supports preparation, private debriefs,
durable memory, transcripts, and shared notes.

## Gather the required context

Ask only for information that is not already available:

- Workspace location
- Manager name and timezone
- Each report's name, stable ID, calendar aliases, and shared document
- Transcript consent and retention requirements
- Preparation sources explicitly permitted for each report

Never guess an identity, document mapping, company policy, or permission.
Resolve duplicate or ambiguous calendar aliases before continuing.

## Create the workspace

Use the files in assets/ as templates. Preserve existing files and ask before
overwriting anything.

Create:

    settings.md
    people/<id>.md
    shared/<id>.md
    private/people/<id>.md
    private/proposals/
    journal/
    transcripts/
    .gitignore

Treat shared/<id>.md as a local document or a local mirror of the configured
shared document. Do not create it when the person mapping already points to an
existing shared source.

Use assets/gitignore by default so employee information is not accidentally
committed. The manager may replace this with controls appropriate to an
approved private repository.

## Record permissions

List permitted sources in people/<id>.md. An omitted source is denied. Record
the narrowest useful channel, project, repository, mailbox, or path rather than
granting a whole-system scope.

Keep private and shared artifacts in their named areas. Do not put private
memory, journal content, source evidence, or transcripts into shared/.

## Verify

Confirm that:

- Every calendar alias maps to exactly one report.
- Every report has a shared-document mapping and private-memory file.
- Every preparation source is explicitly authorized.
- Transcript consent and retention fields are completed.
- Sensitive directories are ignored by default.

Report missing fields without inventing values.
