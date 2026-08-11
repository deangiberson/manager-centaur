# Manager Centaur

A Claude Code marketplace for skills that have computers do the computer work
so managers can do the human work.

Manager Centaur automates preparation, synthesis, record keeping, and other
software-mediated tasks. Managers remain responsible for judgment,
communication, and consequential people decisions.

## Plugins

### One-on-ones

The one-on-ones plugin provides a text-first process with four passes:

1. Set up a workspace, report mappings, source permissions, and transcript
   policy.
2. Prepare evidence-backed agendas that start with each report's Next items.
3. Debrief transcripts into the private journal and propose reviewed changes
   to durable per-report memory.
4. Publish compact, manager-reviewed minutes from an isolated release
   workspace.

The preparation pass can use shared and private documents, project documents,
standups, tickets, Slack, email, and code changes when the manager explicitly
permits those sources. Unverified connections are presented as questions, not
facts.

## Install

    /plugin marketplace add deangiberson/manager-centaur
    /plugin install one-on-ones@manager-centaur

Run the skills through their plugin namespace:

    /one-on-ones:setup-one-on-ones
    /one-on-ones:prepare-one-on-ones
    /one-on-ones:debrief-one-on-one
    /one-on-ones:publish-one-on-one-notes

## Workspace

The setup skill creates:

    settings.md
    people/<id>.md
    shared/<id>.md
    private/people/<id>.md
    private/proposals/
    journal/
    transcripts/

Employee data directories are ignored by Git by default. A manager can replace
that default only with controls appropriate for an approved private
repository.

The process is connector-neutral. Files may be local text documents, exports,
or local mirrors of remote systems. Add remote access only for sources the
manager authorizes.

## Privacy boundary

Private preparation and debriefing happen in the management workspace. Shared
minutes are generated in a fresh process that cannot access that workspace.

Create the allowlisted release bundle with:

    one-on-one-release-bundle <shared-document> <transcript> [approved-note]

The bundle contains only:

- The current shared document
- The meeting transcript
- An optional note the manager explicitly approved for sharing

Start a fresh Claude Code process whose workspace or sandbox exposes only the
bundle, then run the publication skill. Review the exact proposed change before
allowing any shared-document write.

## Development

Validate the marketplace and plugin:

    claude plugin validate --strict .
    claude plugin validate --strict plugins/one-on-ones

Run the release-boundary check:

    sh plugins/one-on-ones/tests/test-release-bundle.sh

## License

MIT
