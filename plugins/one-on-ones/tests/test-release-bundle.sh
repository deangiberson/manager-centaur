#!/bin/sh
set -eu

test_dir=$(mktemp -d "${TMPDIR:-/tmp}/one-on-one-release-test.XXXXXX")
bundle=

cleanup() {
  [ -z "$bundle" ] || rm -rf "$bundle"
  rm -rf "$test_dir"
}
trap cleanup EXIT HUP INT TERM

printf '# Shared\n' > "$test_dir/shared.md"
printf 'Transcript\n' > "$test_dir/transcript.txt"
printf 'Approved\n' > "$test_dir/approved.md"

script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd)
bundle=$("$script_dir/../bin/one-on-one-release-bundle" \
  "$test_dir/shared.md" \
  "$test_dir/transcript.txt" \
  "$test_dir/approved.md")

cmp "$test_dir/shared.md" "$bundle/shared-document.md"
cmp "$test_dir/transcript.txt" "$bundle/transcript.txt"
cmp "$test_dir/approved.md" "$bundle/manager-approved-note.md"

file_count=$(find "$bundle" -type f | wc -l | tr -d ' ')
test "$file_count" -eq 3

rm -rf "$bundle"
bundle=
bundle=$("$script_dir/../bin/one-on-one-release-bundle" \
  "$test_dir/shared.md" \
  "$test_dir/transcript.txt")

file_count=$(find "$bundle" -type f | wc -l | tr -d ' ')
test "$file_count" -eq 2
test ! -e "$bundle/manager-approved-note.md"

printf 'release bundle check passed\n'
