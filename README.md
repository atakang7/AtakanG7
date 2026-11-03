# atakan gül

**Cloud & Platform Engineer** · Istanbul · open to roles

[![Website](https://img.shields.io/badge/atakangul.com-1f6feb?style=flat-square&logo=google-chrome&logoColor=white)](https://atakangul.com)
[![About](https://img.shields.io/badge/how_I_work-555?style=flat-square)](https://atakangul.com/about/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/atakan-gul)

I build cloud infrastructure and the software around it. Running once is easy. I care what it costs, how it fails, and whether others can run it without summoning its author.

The part I enjoy most is building platforms that take operational work off other engineers' plates. Outside work I keep building labs that behave like production, and I write them up so someone else can run them.

## Measured work

| | |
|---|---|
| **20 TB** | AWS migration with zero downtime. Every object ETag-checked, not sampled. |
| **3h → 7m** | Glue ETL rebuilt on incremental watermarks. ~$6K a year saved, no bigger cluster. |
| **−40%** | Memory in Python analytics jobs after profiling. The OOM crashes stopped. |

## What I build

**[k8s-platform-lab](https://github.com/atakang7/k8s-platform-lab)** — a three-node Kubernetes platform where every layer lives in one repo: kubeadm + Ansible, MetalLB + ingress-nginx + ExternalDNS → BIND9, Vault-delivered secrets, build-once images that are Trivy-gated and Cosign-signed by digest, Helm releases with a Prometheus-gated canary, and Prometheus / Grafana / Fluent Bit / Elasticsearch for observability.

**[cross-vpc-private-link](https://github.com/atakang7/cross-vpc-private-link)** — private service access across two AWS accounts with PrivateLink and Client VPN, no peering and no public backends. OpenTofu, CI with a mocked plan and Trivy IaC checks.

**[azure-devops-ci-cd](https://github.com/atakang7/azure-devops-ci-cd)** — a staged release that refuses to promote blindly: tests against real MongoDB → versioned image → staging slot → readiness check → approval → slot swap.

**[helm charts](https://github.com/atakang7/gh-pages)** — my Helm repository, served at `helm.atakangul.com`.

**[linux-diagnostic-agent](https://github.com/atakang7/linux-diagnostic-agent)** — a Go agent that collects Linux logs and network metrics, with a [client](https://github.com/atakang7/linux-diagnostic-client) and [interface](https://github.com/atakang7/linux-diagnostic-interface).

### Agents and tooling

- **[axon](https://github.com/atakang7/axon)** — a Go runtime for LLM agents: agent loops, streaming, tool dispatch, sessions, context pruning, MCP.
- **[cortex](https://github.com/atakang7/cortex)** — a terminal coding agent built on axon.
- **[saaprep](https://github.com/atakang7/saaprep)** — an open-source AWS Solutions Architect study guide.

## How I work

Six rules, in the order I apply them: **measure, reduce, own, verify, ship, watch.** Each one is tied to real work on [my about page](https://atakangul.com/about/).

## Latest writing

<!-- BLOG-POST-LIST:START -->
- [A CI identity that can only dry-run](https://atakangul.com/blogs/ci-identity-dry-run-only/)
- [Dual-booting Windows next to an encrypted Ubuntu](https://atakangul.com/blogs/dual-boot-windows-encrypted-ubuntu/)
- [PrivateLink across two AWS accounts](https://atakangul.com/blogs/aws-secure-communication-privatelink/)
<!-- BLOG-POST-LIST:END -->

**Stack:** AWS · Azure · Kubernetes · Helm · Terraform / OpenTofu · Ansible · Vault · Jenkins · Prometheus · Grafana · Loki · Trivy · Go · Python · Bash
