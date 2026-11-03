#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

cat > "$tmp_dir/README.md" <<'README'
Before
<!-- BLOG-POST-LIST:START -->
- [Previous](https://example.com/old)
<!-- BLOG-POST-LIST:END -->
After
README
cat > "$tmp_dir/posts.json" <<'JSON'
[
  {"title":"First [post]", "url":"https://example.com/first"},
  {"title":"Not HTTPS", "url":"http://example.com/insecure"},
  {"title":"Second post", "url":"https://example.com/second"},
  {"title":"Third post", "url":"https://example.com/third"},
  {"title":"Fourth post", "url":"https://example.com/fourth"}
]
JSON
cat > "$tmp_dir/expected.md" <<'README'
Before
<!-- BLOG-POST-LIST:START -->
- [First \[post\]](https://example.com/first)
- [Second post](https://example.com/second)
- [Third post](https://example.com/third)
<!-- BLOG-POST-LIST:END -->
After
README

BLOG_POSTS_FILE="$tmp_dir/posts.json" bash "$repo_dir/scripts/update-blog-posts.sh" "$tmp_dir/README.md"
diff -u "$tmp_dir/expected.md" "$tmp_dir/README.md"

cp "$tmp_dir/README.md" "$tmp_dir/unchanged.md"
BLOG_POSTS_FILE="$tmp_dir/posts.json" bash "$repo_dir/scripts/update-blog-posts.sh" "$tmp_dir/README.md"
cmp "$tmp_dir/unchanged.md" "$tmp_dir/README.md"

printf 'not json\n' > "$tmp_dir/posts.json"
if BLOG_POSTS_FILE="$tmp_dir/posts.json" bash "$repo_dir/scripts/update-blog-posts.sh" "$tmp_dir/README.md" 2>/dev/null; then
  printf 'Invalid JSON was accepted\n' >&2
  exit 1
fi
cmp "$tmp_dir/unchanged.md" "$tmp_dir/README.md"

printf '[]\n' > "$tmp_dir/posts.json"
if BLOG_POSTS_FILE="$tmp_dir/posts.json" bash "$repo_dir/scripts/update-blog-posts.sh" "$tmp_dir/README.md" 2>/dev/null; then
  printf 'Empty feed was accepted\n' >&2
  exit 1
fi
cmp "$tmp_dir/unchanged.md" "$tmp_dir/README.md"

printf '[{"title":"Post", "url":"https://example.com"}]\n' > "$tmp_dir/posts.json"
printf 'Before\n<!-- BLOG-POST-LIST:START -->\n' > "$tmp_dir/missing.md"
cp "$tmp_dir/missing.md" "$tmp_dir/missing.expected"
if BLOG_POSTS_FILE="$tmp_dir/posts.json" bash "$repo_dir/scripts/update-blog-posts.sh" "$tmp_dir/missing.md" 2>/dev/null; then
  printf 'Missing closing marker was accepted\n' >&2
  exit 1
fi
cmp "$tmp_dir/missing.expected" "$tmp_dir/missing.md"

printf 'Blog updater tests passed\n'
