#!/usr/bin/env bash
# Tilnote Blog - upload one picture file from this computer into a Tilnote note.
#
#   bash upload-photo.sh <file> <upload-url> <upload-token>
#
# <upload-url> and <upload-token> come from the Tilnote connector's
# create_image_upload_link result (directUpload). The script sends only the one
# file named, only to Tilnote's upload address, and prints Tilnote's reply
# (JSON with the picture's url, or an error). It downloads nothing and runs
# nothing else. Needs curl (built into macOS, Linux and Windows 10+ Git Bash).
set -u

file="${1:-}"
url="${2:-}"
token="${3:-}"

fail() {
  printf '{"error":"%s"}\n' "$1"
  exit 2
}

[ "$#" -eq 3 ] || fail "usage: upload-photo.sh <file> <upload-url> <upload-token>"

# Only Tilnote's own upload address, optionally with ?locale=xx.
[[ "$url" =~ ^https://server\.tilnote\.io/api/image-upload-links/images(\?locale=[a-z]+)?$ ]] \
  || fail "not a Tilnote upload address - give the user the upload link instead"

# The link's token: 56 lowercase hex characters.
[[ "$token" =~ ^[0-9a-f]{56}$ ]] || fail "not a Tilnote upload token - give the user the upload link instead"

case "$file" in
  *$'\n'* | *$'\r'*) fail "the file path has a line break - give the user the upload link for this picture" ;;
esac
[ -f "$file" ] || fail "no such file: give the user the upload link for this picture"
[ -r "$file" ] || fail "the file can't be read: give the user the upload link for this picture"

command -v curl >/dev/null 2>&1 || fail "curl is not installed - give the user the upload link instead"

# Windows Git Bash: curl there is a Windows program, and Git Bash rewrites a /c/... path
# inside an argument unreliably (a comma, semicolon or apostrophe breaks it). Hand curl
# the Windows form of the path instead.
if command -v cygpath >/dev/null 2>&1; then
  file=$(cygpath -w -- "$file") || fail "the file path can't be read: give the user the upload link for this picture"
fi

# curl -F reads a double-quoted file name, so commas and semicolons in it are fine;
# inside the quotes a backslash or double quote has to be escaped with a backslash.
escaped=${file//\\/\\\\}
escaped=${escaped//\"/\\\"}

curl -sS --max-time 120 \
  -F "image=@\"${escaped}\"" \
  -H "X-Upload-Token: ${token}" \
  "$url"
status=$?
echo
exit "$status"
