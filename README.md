# Atakan Gül

Cloud infrastructure projects and notes from my work on deployments and Linux systems.

```text
+--------------------------+  HTTPS JSON  +----------------------+
| atakangul.com/posts.json | -----------> | update-blog-posts.sh |
+--------------------------+              +----------------------+
                                                  |
                                                writes
                                                  v
                                            +-----------+
                                            | README.md |
                                            +-----------+
```

```text
+--------------+  triggers  +--------+  runs  +----------------------------+
| pull_request | ---------> | ci.yml | -----> | tests/update-blog-posts.sh |
+--------------+            +--------+        +----------------------------+
```
## Run

Requires Bash, curl, jq and awk.

```sh
git clone https://github.com/atakang7/AtakanG7.git
cd AtakanG7
set -a; . ./.env.example; set +a
bash scripts/update-blog-posts.sh README.md
bash tests/update-blog-posts.sh
```

## Config

| Var | Default | What |
| --- | --- | --- |
| `BLOG_FEED_URL` | `https://atakangul.com/posts.json` via `.env.example` | HTTPS JSON feed |
| `BLOG_POSTS_FILE` | Unset | Local JSON file instead of an HTTP request |

## Limits

- Takes up to three valid HTTPS links from a JSON array.
- Feed or marker errors leave `README.md` unchanged.
- The scheduled update runs at 08:17 UTC; it can also be run from GitHub Actions.

## Work

- [k8s-platform-lab](https://github.com/atakang7/k8s-platform-lab): Kubernetes canary deployments.
- [cross-vpc-private-link](https://github.com/atakang7/cross-vpc-private-link): PrivateLink across two AWS accounts.
- [azure-devops-ci-cd](https://github.com/atakang7/azure-devops-ci-cd): Blue-green Azure Web App releases.
- [linux-diagnostic-agent](https://github.com/atakang7/linux-diagnostic-agent): Linux logs and network metrics.
- [axon](https://github.com/atakang7/axon): Go agent runtime with MCP sessions.

## Writing

<!-- BLOG-POST-LIST:START -->
- [A CI identity that can only dry-run](https://atakangul.com/blogs/ci-identity-dry-run-only/)
- [Dual-booting Windows next to an encrypted Ubuntu](https://atakangul.com/blogs/dual-boot-windows-encrypted-ubuntu/)
- [PrivateLink across two AWS accounts](https://atakangul.com/blogs/aws-secure-communication-privatelink/)
<!-- BLOG-POST-LIST:END -->
