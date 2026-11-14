#!/usr/bin/env bash
# Tilnote Blog - upload one picture file from this computer into a Tilnote note.
#
#   bash upload-photo.sh <file> <upload-url> <upload-code>
#
# <upload-url> and <upload-code> come from the Tilnote connector's
# create_image_upload_link result (directUpload: its url and its X-Upload-Token
# header). The code works for that one link for an hour. The script sends only the
# one file named, only to Tilnote's own upload address below, and prints Tilnote's
# reply (JSON with the picture's url, or an error). It downloads nothing and runs
# nothing else. Needs curl (built into macOS, Linux and Windows 10+ Git Bash).
set -u

TILNOTE_UPLOAD_URL="https://server.tilnote.io/api/image-upload-links/images"

file="${1:-}"
url="${2:-}"
code="${3:-}"

fail() {
  printf '{"error":"%s"}\n' "$1"
  exit 2
}

[ "$#" -eq 3 ] || fail "usage: upload-photo.sh <file> <upload-url> <upload-code>"

# Only Tilnote's own upload address, optionally followed by ?locale= and lowercase letters.
target="$TILNOTE_UPLOAD_URL"
if [ "$url" != "$TILNOTE_UPLOAD_URL" ]; then
  locale="${url#"$TILNOTE_UPLOAD_URL?locale="}"
  if [ "$locale" = "$url" ] || [ -z "$locale" ]; then
    fail "not a Tilnote upload address - give the user the upload link instead"
  fi
  case "$locale" in
    *[!a-z]*) fail "not a Tilnote upload address - give the user the upload link instead" ;;
  esac
  target="$TILNOTE_UPLOAD_URL?locale=$locale"
fi

# The link's code: 56 characters of 0-9 and a-f.
case "$code" in
  *[!0-9a-f]*) fail "not a Tilnote upload code - give the user the upload link instead" ;;
esac
[ "${#code}" -eq 56 ] || fail "not a Tilnote upload code - give the user the upload link instead"

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
quoted=${file//\\/\\\\}
quoted=${quoted//\"/\\\"}

curl -sS --max-time 120 -F "image=@\"${quoted}\"" -H "X-Upload-Token: ${code}" "$target"
status=$?
echo
exit "$status"
