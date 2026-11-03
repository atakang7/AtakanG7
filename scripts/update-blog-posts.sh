#!/usr/bin/env bash
set -euo pipefail

readme=${1:-README.md}
if [[ ! -f "$readme" ]]; then
  printf 'README not found: %s\n' "$readme" >&2
  exit 1
fi

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

if [[ -n ${BLOG_POSTS_FILE:-} ]]; then
  cp -- "$BLOG_POSTS_FILE" "$tmp_dir/posts.json"
else
  : "${BLOG_FEED_URL:?set BLOG_FEED_URL to an HTTPS JSON feed}"
  if [[ $BLOG_FEED_URL != https://* ]]; then
    printf 'BLOG_FEED_URL must use HTTPS\n' >&2
    exit 1
  fi
  curl --fail --silent --show-error --location \
    --proto '=https' --proto-redir '=https' \
    --connect-timeout 5 --max-time 20 --retry 2 \
    "$BLOG_FEED_URL" -o "$tmp_dir/posts.json"
fi

jq -e 'type == "array"' "$tmp_dir/posts.json" >/dev/null
jq -r '
  [
    .[]
    | select(type == "object")
    | select((.title | type) == "string" and (.url | type) == "string")
    | select((.title | length) > 0 and (.url | test("^https://[^[:space:]<>]+$")))
  ][:3][]
  | "- [\(.title | gsub("[\\r\\n]"; " ") | gsub("\\\\"; "\\\\\\\\") | gsub("\\["; "\\[") | gsub("\\]"; "\\]"))](\(.url | gsub("\\("; "%28") | gsub("\\)"; "%29")))"
' "$tmp_dir/posts.json" > "$tmp_dir/posts.md"

if [[ ! -s "$tmp_dir/posts.md" ]]; then
  printf 'No valid posts in feed\n' >&2
  exit 1
fi

awk -v posts="$tmp_dir/posts.md" '
  $0 == "<!-- BLOG-POST-LIST:START -->" {
    if (start++) exit 1
    print
    while ((getline line < posts) > 0) print line
    close(posts)
    in_posts=1
    next
  }
  $0 == "<!-- BLOG-POST-LIST:END -->" {
    if (!in_posts || end++) exit 1
    in_posts=0
    print
    next
  }
  !in_posts { print }
  END {
    if (start != 1 || end != 1 || in_posts) {
      print "Expected one ordered pair of blog post markers" > "/dev/stderr"
      exit 1
    }
  }
' "$readme" > "$tmp_dir/README.md"

if ! cmp -s "$tmp_dir/README.md" "$readme"; then
  mv -- "$tmp_dir/README.md" "$readme"
fi
