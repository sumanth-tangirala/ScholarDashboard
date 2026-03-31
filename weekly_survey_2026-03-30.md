# Weekly Web Survey — March 30, 2026

**22 new papers found** across all tiers (8 definitely interesting, 13 probably interesting, 1 mildly interesting). Papers sourced from arXiv preprints (Jan–Mar 2026), CoRL 2025 proceedings, and IEEE RA-L. These are net-new entries not found in the March 24 survey.

**Conference status:** ICRA 2026 acceptances notified Jan 31 (conference June 1–5, Vienna). ICLR 2026 acceptances announced — LeRobot and WholeBodyVLA among robotics highlights. CoRL 2025 proceedings available (Sept 2025, Seoul). RSS 2026 decisions pending (~April).

---

## 1. Verification & Safety (8 papers)

### Definitely Interesting

**Beyond Binary Success: Sample-Efficient and Statistically Rigorous Robot Policy Comparison** (arXiv:2603.13616, 2026)
Sequential statistical testing via safe anytime-valid inference (SAVI) enables rigorous policy comparison with far fewer rollouts. Authored by Snyder, Badithela, Matni, Pappas, Majumdar, Itkina, Nishimura. Directly relevant to testing/verification of generalist robot policies with formal statistical guarantees.
→ https://arxiv.org/abs/2603.13616

**SABER: A Stealthy Agentic Black-Box Attack Framework for VLA Models** (arXiv:2603.24935, 2026)
GRPO-trained ReAct agent finds minimal instruction edits (bounded budget) that reduce VLA task success by 20.6%, increase sequence length by 55%, and raise constraint violations by 33% on LIBERO across 6 state-of-the-art VLA models. Demonstrates that small plausible edits are sufficient to degrade robot execution. Core: black-box adversarial testing of robot policies.
→ https://arxiv.org/abs/2603.24935

**Sample-Free Safety Assessment of Neural Network Controllers via Taylor Methods** (arXiv:2602.11332, 2026)
Embeds trained neural network controller into closed-loop dynamics, then bounds the system flow via high-order Taylor polynomials with automatic domain splitting — no simulation or sampling required. Demonstrated for spaceflight applications. Directly relevant to formal verification of black-box NN controllers.
→ https://arxiv.org/abs/2602.11332

**Learning Vision-Based Neural Network Controllers with Semi-Probabilistic Safety Guarantees** (arXiv:2503.00191, 2025)
Integrates reachability analysis with conditional generative networks and distribution-free tail bounds to verify vision-based neural controllers. Validated on path-following and drone control. Directly relevant to visuomotor policy verification.
→ https://arxiv.org/abs/2503.00191

**RoboMonkey: Scaling Test-Time Sampling and Verification for VLA Models** (arXiv:2506.17811, CoRL 2025)
Stanford work: sample actions from a VLA, apply Gaussian perturbation + majority voting, then use a VLM-based verifier to select the best action. Achieves 25% absolute improvement on OOD tasks and 9% on in-distribution tasks. Inference-time scaling laws exist for VLAs. Core: test-time verification of VLA policies.
→ https://arxiv.org/abs/2506.17811

### Probably Interesting

**Before Autonomy Takes Control: Software Testing in Robotics** (arXiv:2602.02293, 2026)
Survey of software testing challenges and approaches for safety-critical autonomous robot systems. Addresses compliance with industry standards for pre-deployment validation.
→ https://arxiv.org/abs/2602.02293

**Towards Safe Learning-Based NMPC through Recurrent Neural Network Modeling** (arXiv:2603.24503, 2026)
RNN-based NMPC candidate generation with safety-augmented mechanisms — requires fewer expert rollouts and improves feasibility and safety over baseline approaches.
→ https://arxiv.org/abs/2603.24503

---

## 2. Conformal Prediction (3 papers)

### Definitely Interesting

**Formal Verification and Control With Conformal Prediction: Practical Safety Guarantees For Autonomous Systems** (IEEE Robotics and Automation Letters, 2025)
IEEE RA-L publication introducing CP for formal verification of learning-enabled components and safe control design. Tutorial-style with CBF integration — simple, assumption-free, real-time capable. Key reference for the CP+verification intersection.
→ https://ieeexplore.ieee.org/document/11274485/

**Statistically Assuring Safety of Control Systems using Ensembles of Safety Filters and Conformal Prediction** (arXiv:2511.07899, 2025)
Combines ensembles of safety filters with conformal prediction to provide statistical safety certificates for control systems. Data-driven safety guarantees without model assumptions.
→ https://arxiv.org/abs/2511.07899

**Conformal Selective Prediction with General Risk Control** (arXiv:2603.24704, 2026)
SCoRE framework: distribution-free selective prediction with user-defined bounded risk control, applicable to any trained model in safety-critical settings. General method with direct robotics relevance.
→ https://arxiv.org/abs/2603.24704

---

## 3. Diffusion / Flow Matching Policies (1 paper)

### Probably Interesting

**Sample from What You See: Visuomotor Policy Learning via Diffusion Bridge** (arXiv:2512.07212, 2025)
BridgePolicy embeds visual observations directly into stochastic action dynamics via a diffusion-bridge SDE formulation, rather than initializing from random noise. Improves precision and reliability over standard diffusion policy.
→ https://arxiv.org/abs/2512.07212

---

## 4. Generalist Policies / VLA (5 papers)

### Probably Interesting

**MolmoBot: Zero-Shot Manipulation via Large Multimodal Models** (arXiv:2603.16861, 2026)
Augments a VLM backbone with a DiT-based flow-matching action head for zero-shot transfer to real-world manipulation. Bridges generalist VLMs with diffusion/flow policy methods.
→ https://arxiv.org/abs/2603.16861

**Gaze-Regularized Vision-Language-Action Models for Robotic Manipulation** (arXiv:2603.23202, 2026)
Trains VLAs with gaze regularization — aligning internal attention with human visual patterns — yielding 4–12% improvement in manipulation task performance.
→ https://arxiv.org/abs/2603.23202

**Robust Finetuning of Vision-Language-Action Robot Policies via Parameter Merging** (arXiv:2512.08333, 2025)
Addresses overfitting when adapting generalist VLA policies to limited task demonstrations via parameter merging strategy. Improves generalist policy robustness.
→ https://arxiv.org/abs/2512.08333

**A Taxonomy for Evaluating Generalist Robot Manipulation Policies** (arXiv:2503.01238, 2026)
Proposes STAR-Gen taxonomy for systematically measuring visual, semantic, and behavioral generalization in manipulation policies.
→ https://arxiv.org/abs/2503.01238

---

## 5. Imitation Learning (5 papers)

### Probably Interesting

**In-Context Imitation Learning with Visual Reasoning** (arXiv:2603.07530, ICLR 2026)
Incorporates visual reasoning into in-context IL for vision-based manipulation, enabling few-shot adaptation at inference time without retraining.
→ https://arxiv.org/abs/2603.07530

**EquiBim: Learning Symmetry-Equivariant Policy for Bimanual Manipulation** (arXiv:2603.08541, 2026)
Enforces bilateral symmetry-equivariance constraints in bimanual policy learning, validated on dual-arm robotic systems.
→ https://arxiv.org/abs/2603.08541

**Human-to-Robot Interaction: Learning from Video Demonstration for Robot Imitation** (arXiv:2602.19184, 2026)
Two-stage framework: VLMs understand video demonstrations, then TD3-based RL learns the policy. Cross-morphology imitation without motion capture.
→ https://arxiv.org/abs/2602.19184

**RoboCopilot: Human-in-the-loop Interactive Imitation Learning for Robot Manipulation** (arXiv:2503.07771, 2026)
Robot adopts assistive copilot role, enabling efficient incremental bimanual skill acquisition from human guidance.
→ https://arxiv.org/abs/2503.07771

---

## 6. Controller Composition (2 papers)

### Probably Interesting

**MetaWorld: Skill Transfer and Composition in a Hierarchical World Model** (arXiv:2601.17507, 2026)
Three-tier architecture: VLMs parse task semantics, select and parameterize primitive skills, and compose them via a hierarchical world model for cross-task transfer.
→ https://arxiv.org/abs/2601.17507

**IROSA: Interactive Robot Skill Adaptation using Natural Language** (arXiv:2603.03897, 2026)
Tool-based architecture leveraging pre-trained LLMs to select and parameterize robot skills for open-vocabulary adaptation without fine-tuning.
→ https://arxiv.org/abs/2603.03897

---

## 7. Other (1 paper)

### Mildly Interesting

**LeRobot: An Open-Source Library for End-to-End Robot Learning** (arXiv:2602.22818, ICLR 2026)
Comprehensive open-source library for robot learning — dataset streaming, data collection infrastructure, and SOTA algorithms (ACT, Diffusion Policy, etc.) in one place.
→ https://arxiv.org/abs/2602.22818

---

## Highlights for This Week

Three papers stand out as most directly relevant to your current and next research directions:

1. **Beyond Binary Success** (arXiv:2603.13616) — Proposes statistically rigorous policy comparison via SAVI. If you're working on evaluation methodology for verification, this is directly applicable.

2. **SABER** (arXiv:2603.24935) — Black-box adversarial testing of VLA models. The "black-box" framing aligns exactly with your current research focus.

3. **RoboMonkey** (arXiv:2506.17811) — Test-time verification for VLA models. The combination of sampling + VLM-based verification is a practical, scalable approach to the problem you're working toward.

---

*Database updated: 102 total papers (80 from previous surveys + 22 new). Source: papers_database.csv*
