# Atakan Gül

**Cloud & Platform Engineer** · AWS · Kubernetes · Terraform · CI/CD · Observability

[![Website](https://img.shields.io/badge/Website-atakangul.com-blue?style=flat-square&logo=google-chrome)](https://www.atakangul.com)
[![Blog](https://img.shields.io/badge/Blog-atakangul.com/blogs-orange?style=flat-square&logo=rss)](https://atakangul.com/blogs)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-atakan--gul-0A66C2?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/atakan-gul)

I build and run cloud infrastructure that stays up: zero-downtime migrations, fast pipelines, and the observability to know when something breaks. On the side, I build AI agent tooling in Go.

## Production highlights (Siemens)

- **Zero-downtime migration of 20TB+ on AWS** with DataSync and automated ETag validation for data consistency
- **AWS Glue ETL runtime cut from 3 hours to 7 minutes** with watermark-based processing, saving ~$6K/year
- **Shift-left security:** Wiz scanning in CI/CD for container images and Infrastructure-as-Code
- **Centralized logging with Loki** for faster troubleshooting across distributed environments
- **40% lower memory usage** in Python analytics pipelines after profiling and fixing OOM failures

## Infrastructure projects

| Project | What it is | Stack |
|---|---|---|
| **KubernetesInfra** · [live](https://kubernetes-infra.atakangul.com/) | Kubernetes infrastructure provisioned with Terraform and deployed with Helm | `Kubernetes` `Terraform` `Helm` |
| [**linux-diagnostic-agent**](https://github.com/atakang7/linux-diagnostic-agent) | Agent that collects logs and network metrics from Linux hosts | `Go` `Linux` `Monitoring` |
| [**linux-diagnostic-client**](https://github.com/atakang7/linux-diagnostic-client) | Client side for the diagnostic agent's metrics | `Go` |

## Agents & developer tooling

| Project | What it is | Stack |
|---|---|---|
| [**axon**](https://github.com/atakang7/axon) · [docs](https://atakang7.github.io/axon/) | Minimal Go runtime for tool-using LLM agents: turns, tools, sessions, context pressure, MCP | `Go` `LLM` `MCP` |
| [**cortex**](https://github.com/atakang7/cortex) · [docs](https://atakang7.github.io/cortex/) | Token-efficient terminal coding agent built on axon | `Go` `CLI` |
| [**standard-ui**](https://github.com/atakang7/standard-ui) | Provider-agnostic chat UI for OpenAI-compatible APIs, Anthropic, Ollama and custom gateways | `TypeScript` |

## Stack

- **Cloud:** AWS (DataSync, Glue, Athena, Bedrock) · Azure (App Service)
- **Platform:** Kubernetes · Helm · Terraform · Docker · Jenkins
- **Observability & security:** Loki · Wiz · Trivy
- **Languages:** Go · Python · Bash
- **Certification:** AWS Certified Solutions Architect – Associate

## Latest writing

<!-- BLOG-POST-LIST:START -->
<!-- BLOG-POST-LIST:END -->

More at [atakangul.com/blogs](https://atakangul.com/blogs).
