# Rentable GPU Compute for Self-Hosted Open-Weight LLMs — Services & Pricing

*Compiled June 2026. GPU rental pricing moves fast; treat the figures as a snapshot
and re-check each provider's live pricing before committing. Hourly rates are
per-GPU unless stated otherwise.*

## 1. Purpose and scope

This report surveys the market for renting GPU compute on which you run your own
inference stack (e.g. vLLM or SGLang serving open-weight models). It covers the
three delivery models, the provider categories, the pricing arrangements on offer,
current rate ranges, the cluster/networking products, and the software stack that
turns rented metal into an OpenAI-compatible coding endpoint.

The defining property of this market versus a hosted model API: **you supply and
run the model weights yourself.** The provider's acceptable-use policy governs the
*infrastructure* (no illegal use of the hardware), not the text your model emits.
There is no provider-injected output filter — model behaviour is whatever the open
weights do.

## 2. Three delivery models

| Model | What you rent | You manage | Control | Ops burden |
|---|---|---|---|---|
| **Raw GPU rental (IaaS)** | A VM / container / bare-metal node with GPUs | OS, drivers, serving stack, model | Full | High |
| **Managed clusters** | A multi-node GPU cluster with interconnect pre-wired | Serving stack, model | High | Medium |
| **Serverless open-weight inference** | An OpenAI-compatible endpoint to an open model the provider hosts | Nothing | Low | None |

Raw rental and managed clusters give the most control (and the lowest per-token
cost at steady utilisation). Serverless inference is the fastest path to an
endpoint with zero ops, at a per-token price and with the provider choosing the
serving configuration.

## 3. Provider categories

### 3.1 GPU marketplaces (cheapest, most raw)
Aggregate third-party hosts; you rent whatever a host offers and run any container.
- **Vast.ai** — decentralised marketplace, typically 50–70% below hyperscalers,
  interruptible by default, SkyPilot integration for one-command vLLM deploys.
  Maximum savings; variable reliability per host.
- **Thunder Compute** — sits at the bottom of the price spread.

### 3.2 Neoclouds (developer-first GPU clouds — the sweet spot)
Purpose-built GPU clouds with good DX, per-second/per-minute billing, and cluster
products.
- **RunPod** — per-second billing; **Instant Clusters** (multi-node, InfiniBand,
  no contract); a vLLM template wraps the endpoint in an OpenAI-compatible API in
  minutes. Broad GPU range from consumer (RTX 4090) to H100/H200/B200.
- **Lambda** — **1-Click Clusters** with InfiniBand, SSH out of the box,
  pre-installed PyTorch; positioned for higher uptime and managed support.
- **GMI Cloud** — 8× H100 clusters from ~$2.00/GPU-hr.
- **CoreWeave** — large-scale, Kubernetes-native, reserved clusters; enterprise
  scale.
- **Crusoe Cloud**, **Nebius**, **Voltage Park** — neocloud reserved capacity.
- **SF Compute** — spot **H100 clusters by the hour**; very cheap, very raw — good
  for standing a large model up for a few hours.
- **Spheron** — aggregated/low-cost capacity; H100 spot from ~$1.03/hr.

### 3.3 Serverless open-weight inference (no infra)
OpenAI-compatible endpoints to hosted open models (DeepSeek, Qwen, GLM, Kimi, …),
priced per token. Useful when you want an endpoint without managing GPUs.
- **DeepInfra**, **Hyperbolic**, **Novita**, **Together AI**, **Fireworks AI**.

### 3.4 Hyperscalers (for contrast — not price-competitive)
- **AWS**, **Azure**, **GCP**, **OCI** — H100 on-demand $6.88–$12.29/hr; in 2026
  none of them is the cheapest for any GPU. Choose only for existing-contract or
  compliance reasons.

## 4. Pricing arrangements

Providers mix several arrangement types; the same GPU can carry very different
rates depending on which you pick.

| Arrangement | What it is | Typical discount vs on-demand | Caveat |
|---|---|---|---|
| **On-demand** | Pay by the second/minute/hour, no commitment | baseline | Highest unit price |
| **Spot / interruptible** | Bid on idle capacity; can be reclaimed | 40–80% off | Job can be killed; checkpoint |
| **Reserved / committed** | 1-month to multi-year commitment | 30–60% off | Lock-in |
| **Per-second billing** | Charged for exact runtime | — | Best for bursty/agentic loads |
| **Cluster / block** | A whole multi-GPU node or cluster, by the hour | varies | Pay for the whole block |
| **Serverless per-token** | Pay per input/output token | — | No idle cost; per-call price |

For bursty, interactive agentic coding (start an endpoint, drive it, tear it down),
**per-second on-demand** on a neocloud or **interruptible** on a marketplace are the
cost-effective fits. For sustained serving, **reserved** wins.

## 5. Current rate ranges (June 2026 snapshot)

Per-GPU-hour, on-demand unless noted. Marketplace/neocloud lows vs hyperscaler highs.

| GPU | Low (spot / marketplace) | On-demand median | Hyperscaler high | Notes |
|---|---|---|---|---|
| **H100 80GB** | ~$1.03/hr (spot) | ~$2.95/hr | $6.88–$12.29/hr | Cohort median ~$2.95 on-demand |
| **H200 141GB** | ~$2.29/hr | ~$3.39/hr | ~$13.78/hr (Azure) | +76% memory vs H100; often the better serving buy |
| **B200** | — | ~$4.99–$5.29/hr (Lambda) | higher | Newest tier |
| **A100 80GB** | — | ~$1.79/hr (Lambda) | higher | Older, abundant, cheap |
| **RTX 4090 (consumer)** | $0.09–$0.59/hr (Vast) | ~$0.34–$0.69/hr (RunPod) | n/a | Good for ≤24B at 4-bit |
| **8× H100 cluster** | — | from ~$2.00/GPU-hr (GMI) ≈ ~$16/hr | — | InfiniBand block |

Indicative provider positioning:
- **Vast.ai** — cheapest interruptible (consumer $0.09–$0.59/hr; deep H100/H200
  discounts on the low end).
- **RunPod** — best price/reliability balance; per-second; RTX 4090 $0.34–$0.69/hr.
- **Lambda** — A100 ~$1.79/hr, H100 ~$2.99/hr, B200 ~$4.99–$5.29/hr; higher uptime.
- For non-interruptible workloads, Spheron / Lambda / RunPod / Nebius on-demand sit
  within ~20% of each other.

## 6. Cluster & networking products

For models that need multiple GPUs (large MoEs), single-pod rental is insufficient;
you need a cluster with high-bandwidth interconnect (InfiniBand / NVLink) so
tensor/pipeline parallelism is not bottlenecked.

- **RunPod Instant Clusters** — multi-node, InfiniBand, no contract, minutes to
  provision; vLLM/Axolotl/PyTorch templates.
- **Lambda 1-Click Clusters** — InfiniBand, pre-installed stack, SSH access.
- **SF Compute** — spot H100 clusters by the hour.
- **CoreWeave / Crusoe / Nebius / Voltage Park** — larger reserved clusters.

## 7. Software stack on top of rented GPUs

1. **Inference server** — **vLLM** or **SGLang**, exposing an OpenAI-compatible
   HTTP endpoint. (TensorRT-LLM for maximum NVIDIA throughput.) On RunPod, vLLM is
   a one-click template; on Vast.ai, deploy via SkyPilot.
2. **Agent / coding harness** pointed at that endpoint:
   - **OpenHands** (ex-OpenDevin) — full agent: edits files, runs build/test loops.
   - **Aider** — terminal, git-aware pair programmer.
   - **Cline / Roo Code** (VS Code), **Continue.dev**, **Goose** (MCP-native).

## 8. Open-weight models worth hosting (coding / agentic, mid-2026)

| Model | Class | Licence | Rough footprint | Fit |
|---|---|---|---|---|
| **Kimi K2.6 (Thinking)** | ~1T MoE | modified MIT | 8× H100/H200 cluster | Strongest open agentic coder |
| **GLM-5.1** | MoE, 200K ctx | MIT | 2× H200 → small cluster | Best all-round self-host; long-horizon agent runs |
| **DeepSeek V4 (Flash/Pro)** | MoE | open weights | Flash ~170GB (2× H200); Pro ~860GB | Top coding; Pro is big |
| **Qwen3-Coder-Next / Qwen 3.6** | MoE | Apache 2.0 | cluster | ~70% SWE-bench Verified, agentic |
| **Devstral Small 2 (24B)** | dense | Apache 2.0 | 1× H100/H200 | ~68% SWE-bench Verified; single-GPU agentic |
| **Qwen2.5/3-Coder 32B** | dense | Apache 2.0 | 1× 80GB (or 4-bit/24GB) | Best dense coder at size |

## 9. Sizing and cost considerations

- **VRAM = weights + KV cache.** The KV cache grows with context length and batch;
  a model that fits at 4K context can fail at 128–200K. Size for the context you
  actually use.
- **Quantisation** (AWQ / GPTQ / GGUF / FP8) shrinks the footprint — a 32B dense
  model runs 4-bit on a single 24GB card; large MoEs run FP8 on far fewer GPUs than
  BF16.
- **Tensor-parallel size** must divide the GPU count and suit the model; set
  `--tensor-parallel-size`, `--max-model-len`, and KV-cache dtype in `vllm serve`.
- **Utilisation drives economics.** Per-second on-demand or interruptible suits
  bursty agentic use; reserved suits sustained serving. At steady load, self-hosting
  on a neocloud undercuts per-token APIs and keeps data on rented infrastructure.

## 10. Quick selection guide

- **One GPU, cheapest, interactive coding:** Vast.ai or RunPod, 1× H100/H200,
  Devstral 24B or Qwen-Coder 32B, vLLM, drive with Aider/OpenHands. ~$2–3/hr.
- **Strong all-round agent, modest cluster:** RunPod Instant Cluster or Lambda
  1-Click, 2× H200, GLM-5.1.
- **Maximum capability:** 8× H100/H200 (RunPod Instant Cluster or SF Compute spot),
  Kimi K2.6 or DeepSeek V4-Pro. ~$16/hr and up.
- **No ops at all:** serverless open-weight endpoint (DeepInfra / Hyperbolic /
  Together / Fireworks), per token.

## Sources

- GPU Cloud Pricing 2026 — Spheron — https://www.spheron.network/blog/gpu-cloud-pricing-comparison-2026/
- RunPod vs Vast.ai vs Lambda 2026 — PromptQuorum — https://www.promptquorum.com/local-llms/cloud-gpu-rental-comparison-2026
- H100 rental prices across 15+ providers — IntuitionLabs — https://intuitionlabs.ai/articles/h100-rental-prices-cloud-comparison
- RunPod pricing — https://www.runpod.io/pricing
- Vast.ai + SkyPilot — https://vast.ai/article/vast-ai-gpus-can-now-be-rentend-through-skypilot
- AI GPU rental market trends, May 2026 — Thunder Compute — https://www.thundercompute.com/blog/ai-gpu-rental-market-trends
- Best Open-Source LLMs for Agentic Coding 2026 — MindStudio — https://www.mindstudio.ai/blog/best-open-source-llms-agentic-coding-2026
- Best LLM for Coding 2026 (SWE-bench/LCB) — BenchLM — https://benchlm.ai/blog/posts/best-llm-coding
- GLM-5.1 self-hosting (vLLM & SGLang) — Lushbinary — https://lushbinary.com/blog/glm-5-1-self-hosting-guide-vllm-sglang-deployment/
- Self-hosting DeepSeek V4 (vLLM, hardware) — Lushbinary — https://lushbinary.com/blog/deepseek-v4-self-hosting-guide-vllm-hardware-deployment/
- SWE-bench leaderboards — https://www.swebench.com/
