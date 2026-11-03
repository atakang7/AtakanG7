# Atakan Gül

I'm a cloud and platform engineer. This profile links to my infrastructure projects and recent technical posts.

```text
+----------------+  HTTP   +--------------------------+
| blog-posts.yml | ------> | atakangul.com/posts.json |
+----------------+         +--------------------------+
         |
         | writes
         v
+-----------+
| README.md |
+-----------+
```

## Quick start

Refresh the blog list manually:

```sh
gh workflow run blog-posts.yml --repo atakang7/AtakanG7
```

## Layout

| Path | What it is |
| --- | --- |
| [README.md](README.md) | Profile and latest posts |
| [.github/workflows/blog-posts.yml](.github/workflows/blog-posts.yml) | Daily post fetch and README update |
| [.github/workflows/ci.yml](.github/workflows/ci.yml) | Checks post markers on pull requests |
| [k8s-platform-lab](https://github.com/atakang7/k8s-platform-lab) | Kubernetes platform from VMs to canary releases |
| [cross-vpc-private-link](https://github.com/atakang7/cross-vpc-private-link) | AWS PrivateLink between two accounts |
| [azure-devops-ci-cd](https://github.com/atakang7/azure-devops-ci-cd) | Blue-green deployment with Azure Web App slots |
| [linux-diagnostic-agent](https://github.com/atakang7/linux-diagnostic-agent) | Linux logs and network metrics agent |
| [axon](https://github.com/atakang7/axon) | Go runtime for LLM agents |

## Docs

Recent posts from [atakangul.com](https://atakangul.com):

<!-- BLOG-POST-LIST:START -->
- [A CI identity that can only dry-run](https://atakangul.com/blogs/ci-identity-dry-run-only/)
- [Dual-booting Windows next to an encrypted Ubuntu](https://atakangul.com/blogs/dual-boot-windows-encrypted-ubuntu/)
- [PrivateLink across two AWS accounts](https://atakangul.com/blogs/aws-secure-communication-privatelink/)
<!-- BLOG-POST-LIST:END -->

## Limits

- The updater considers only the first three JSON feed entries.
- Network or JSON parsing errors fail the run before the README changes.
- Empty feeds leave the current list unchanged.
