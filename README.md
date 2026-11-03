# Atakan Gül

I work on cloud infrastructure and deployment tooling. This profile links to code I maintain and notes from building it.

## Selected work

- [k8s-platform-lab](https://github.com/atakang7/k8s-platform-lab): Kubernetes platform on VMs with canary deployments.
- [cross-vpc-private-link](https://github.com/atakang7/cross-vpc-private-link): PrivateLink between two AWS accounts, without peering or public IPs.
- [azure-devops-ci-cd](https://github.com/atakang7/azure-devops-ci-cd): Blue-green releases with Azure Web App slots.
- [linux-diagnostic-agent](https://github.com/atakang7/linux-diagnostic-agent): Linux log and network metrics collection.
- [axon](https://github.com/atakang7/axon): Go runtime for LLM agents with MCP sessions and context pruning.

## Recent writing

<!-- BLOG-POST-LIST:START -->
- [A CI identity that can only dry-run](https://atakangul.com/blogs/ci-identity-dry-run-only/)
- [Dual-booting Windows next to an encrypted Ubuntu](https://atakangul.com/blogs/dual-boot-windows-encrypted-ubuntu/)
- [PrivateLink across two AWS accounts](https://atakangul.com/blogs/aws-secure-communication-privatelink/)
<!-- BLOG-POST-LIST:END -->

## Maintaining this page

This is a GitHub profile repository, not an installable application. GitHub renders its `README.md` on my profile.

To update the writing links locally, use Bash, curl, jq and awk:

```sh
git clone https://github.com/atakang7/AtakanG7.git
cd AtakanG7
set -a
. ./.env.example
set +a
bash scripts/update-blog-posts.sh README.md
bash tests/update-blog-posts.sh
```

`BLOG_FEED_URL` is an HTTPS JSON feed containing posts with string `title` and `url` fields. The updater writes the first three valid links between the markers above. The default URL is in `.env.example`.

GitHub Actions runs the update at 08:17 UTC daily. It can also be started through **Actions > Update blog posts in README > Run workflow**. There is no separate deploy step.

An unreachable feed, invalid JSON, or missing markers causes the update to fail without replacing the existing links. Everything outside the markers is left unchanged.
