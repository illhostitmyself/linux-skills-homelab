#!/bin/bash
# Demo: permission bits, and the missing-execute-on-a-folder gotcha.
# Works in a throwaway directory as a normal user. It does not use sudo.
set -eu

dir=$(mktemp -d)
trap 'chmod -R u+rwx "$dir"; rm -rf "$dir"' EXIT

mkdir -p "$dir/a/b"
echo "hello" > "$dir/a/b/file.txt"

chmod 644 "$dir/a/b/file.txt"
echo "--- file with 644:"
ls -l "$dir/a/b/file.txt"

chmod 640 "$dir/a/b/file.txt"
echo "--- file with 640:"
ls -l "$dir/a/b/file.txt"

echo
echo "--- remove execute from folder 'a' (the file itself still looks fine):"
chmod 644 "$dir/a"
ls -l "$dir/a/b/file.txt" 2>&1 || true
echo "--- ...but reading it fails because 'a' cannot be entered:"
cat "$dir/a/b/file.txt" 2>&1 || true
echo "(running as root skips these checks, so run this as a normal user)"
