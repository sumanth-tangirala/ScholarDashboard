# Weekly Web Survey — March 24, 2026

**52 new papers found** across all tiers (27 definitely interesting, 25 probably interesting). Papers sourced from arXiv, ICASSP 2026, ICLR 2026 submissions, and recent journal/workshop activity.

**Conference status:** ICRA 2026 acceptances notified Jan 31 (conference June 1–5, Vienna). ICLR 2026 acceptances announced (conference April 23–27, Rio). RSS 2026 decisions pending (~July). NeurIPS 2025 proceedings available.

---

## 1. Verification & Safety (12 papers)

### Definitely Interesting

**Conformalized Data-Driven Reachability Analysis with PAC Guarantees** (arXiv:2603.12220, 2026)
PAC coverage guarantees for reachability analysis of LTI and nonlinear systems using Learn Then Test calibration. Directly combines data-driven verification with conformal prediction.
→ https://arxiv.org/abs/2603.12220

**Scalable Data-Driven Reachability Analysis via Koopman Operators with Conformal Coverage Guarantees** (arXiv:2601.01076, 2026)
Uses Koopman theory with neural network lifting to compute closed-loop reachable sets with conformal guarantees. Core intersection of data-driven verification and conformal prediction.
→ https://arxiv.org/abs/2601.01076

**V-MORALS: Visual Morse Graph-Aided Estimation of Regions of Attraction in a Learned Latent Space** (arXiv:2602.23524, 2026)
Learns latent space representations for reachability analysis from image-based trajectories without requiring state knowledge. Relevant to visuomotor verification.
→ https://arxiv.org/abs/2602.23524

**Formal Methods in Robot Policy Learning and Verification: A Survey** (arXiv:2602.06971, 2026)
Comprehensive survey on formal methods and verification techniques for deep learning-based robot policies.
→ https://arxiv.org/abs/2602.06971

**Safe LLM-Controlled Robots with Formal Guarantees via Reachability Analysis** (arXiv:2503.03911, 2026)
Rigorous safety guarantees for robot-LLM systems using reachability analysis and historical data, without explicit analytical models.
→ https://arxiv.org/abs/2503.03911

**VLSA: Vision-Language-Action Models with Plug-and-Play Safety Constraint Layer** (arXiv:2512.11891, 2025)
Safety constraint layer for VLA models with mathematically proven strict safety guarantees. Bridges safe control and generalist policies.
→ https://arxiv.org/abs/2512.11891

**ContractionPPO: Certified Reinforcement Learning via Differentiable Contraction Layers** (arXiv:2603.19632, 2026)
Certified robust RL enabling provably stable quadruped locomotion under external perturbations.
→ https://arxiv.org/abs/2603.19632

**AutoEval: Autonomous Evaluation of Generalist Robot Manipulation Policies** (arXiv:2503.24278, 2025)
Autonomous evaluation producing consistent results closely matching human evaluations. Relevant to testing/verification of policies.
→ https://arxiv.org/abs/2503.24278

### Probably Interesting

**A Hazard-Informed Data Pipeline for Robotics Physical Safety** (arXiv:2603.06130, 2026) → https://arxiv.org/abs/2603.06130
**Safe and Stable Neural Network Dynamical Systems for Robot Motion Planning** (arXiv:2511.20593, 2025) → https://arxiv.org/abs/2511.20593
**SLowRL: Safe Low-Rank Adaptation RL for Locomotion** (arXiv:2603.17092, 2026) → https://arxiv.org/abs/2603.17092
**Evaluating Robot Policies in a World Model** (arXiv:2506.00613, 2025) → https://arxiv.org/abs/2506.00613

---

## 2. Conformal Prediction (11 papers)

### Definitely Interesting

**Statistical-Symbolic Verification of Autonomous Systems using State-Dependent Conformal Prediction** (arXiv:2512.02893, 2025)
State-dependent conformal prediction for verifying perception-based autonomous systems. Core intersection of verification + CP.
→ https://arxiv.org/abs/2512.02893

**Conformal Signal Temporal Logic for Robust Reinforcement Learning Control** (ICASSP 2026)
Safe RL integrating conformal STL monitoring with runtime shield for flight control.
→ https://arxiv.org/abs/2602.14322

**Bridging Conformal Prediction and Scenario Optimization** (arXiv:2603.19396, 2026)
Connects scenario optimization and conformal prediction for multi-output prediction and finite-horizon control.
→ https://arxiv.org/abs/2603.19396

**Learnable Conformal Prediction with Context-Aware Nonconformity Functions for Robotic Planning** (arXiv:2509.21955, 2025)
LCP framework learning context-aware nonconformity while preserving CP guarantees; 91.5% navigation success.
→ https://arxiv.org/abs/2509.21955

**Sample-Efficient Expert Query Control in Active IL via Conformal Prediction** (arXiv:2512.00453, 2025)
CRSAIL uses conformal prediction for expert querying thresholds in active imitation learning. Combines CP + active learning + IL.
→ https://arxiv.org/abs/2512.00453

**Interaction-aware Conformal Prediction for Crowd Navigation** (arXiv:2502.06221, 2025)
Interaction-aware motion planning with CP for human uncertainty in crowd navigation.
→ https://arxiv.org/abs/2502.06221

**Formation-Aware Adaptive Conformalized Perception for Safe Multi-Robot Systems** (arXiv:2603.08958, 2026)
Risk-Aware Mondrian conformal prediction for formation-conditioned uncertainty in multi-robot systems.
→ https://arxiv.org/abs/2603.08958

**When Environments Shift: Safe Planning with Generative Priors and Robust Conformal Prediction** (arXiv:2602.12616, 2026)
Combines generative models and robust CP for safe planning under distribution shift.
→ https://arxiv.org/abs/2602.12616

**Safe Planning in Unknown Environments using Conformalized Semantic Maps** (arXiv:2509.25124, 2025)
CP generating map sets containing ground-truth with user-defined probability.
→ https://arxiv.org/abs/2509.25124

**Learning Robot Safety from Sparse Human Feedback using Conformal Prediction** (arXiv:2501.04823, 2025)
Uses CP to learn safety constraints from sparse human feedback.
→ https://arxiv.org/abs/2501.04823

### Probably Interesting

**Anytime-Valid Conformal Risk Control** (arXiv:2602.04364, 2026) → https://arxiv.org/abs/2602.04364

---

## 3. Diffusion / Flow Matching Policies (11 papers)

### Definitely Interesting

**Flow Policy Gradients for Robot Control** (arXiv:2602.02481, 2026)
Flow matching policy gradients demonstrated on legged locomotion, humanoid tracking, manipulation, and sim-to-real.
→ https://arxiv.org/abs/2602.02481

**SeedPolicy: Horizon Scaling via Self-Evolving Diffusion Policy** (arXiv:2603.05117, 2026)
Self-Evolving Gated Attention for scalable horizon extension; 36.8% improvement over standard Diffusion Policy.
→ https://arxiv.org/abs/2603.05117

**Learning Diffusion Policy from Primitive Skills** (arXiv:2601.01948, 2026)
Skill-conditioned Diffusion Policy integrating interpretable skill learning with conditional action planning.
→ https://arxiv.org/abs/2601.01948

**Generative Predictive Control: Flow Matching for Dynamic Tasks** (arXiv:2502.13406, 2026)
Supervised learning framework for fast-dynamics tasks using flow-matching policies with warm-start.
→ https://arxiv.org/abs/2502.13406

**Abstracting Robot Manipulation Skills via MoE Diffusion Policies** (arXiv:2601.21251, 2026)
Compact orthogonal skill basis with higher success rates and lower inference cost.
→ https://arxiv.org/abs/2601.21251

**Compose Your Policies! Distribution-level Composition for Diffusion/Flow Policies** (arXiv:2510.01068, 2025)
Distribution-level composition paradigm enhancing policy performance without additional training. Also relevant to controller composition.
→ https://arxiv.org/abs/2510.01068

**Towards Safe Imitation Learning via Potential Field-Guided Flow Matching** (arXiv:2508.08707, 2025)
PF2MP learns task policies while extracting obstacle information as potential fields. Safe flow matching.
→ https://arxiv.org/abs/2508.08707

### Probably Interesting

**You've Got a Golden Ticket: Improving Generative Robot Policies With A Single Noise Vector** (arXiv:2603.15757, 2026) → https://arxiv.org/abs/2603.15757
**When to Act, Ask, or Learn: Uncertainty-Aware Policy Steering** (arXiv:2602.22474, 2026) → https://arxiv.org/abs/2602.22474
**One-Step Flow Policy: Self-Distillation for Fast Visuomotor Policies** (arXiv:2603.12480, 2026) → https://arxiv.org/abs/2603.12480
**A Review of Online Diffusion Policy RL Algorithms** (arXiv:2601.06133, 2026) → https://arxiv.org/abs/2601.06133

---

## 4. Generalist Policies (5 papers)

### Definitely Interesting

**What Matters in Building Vision-Language-Action Models for Generalist Robots** (arXiv:2412.14058, 2025)
Key factors influencing VLA performance: backbone selection, architecture, cross-embodiment data integration.
→ https://arxiv.org/abs/2412.14058

### Probably Interesting

**Xiaomi-Robotics-0: Open-Sourced VLA Model with Real-Time Execution** (arXiv:2602.12684, 2026) → https://arxiv.org/abs/2602.12684
**OmniGuide: Universal Guidance Fields for Enhancing Generalist Policies** (arXiv:2603.10052, 2026) → https://arxiv.org/abs/2603.10052
**Cosmos Policy: Fine-Tuning Video Models for Visuomotor Control** (arXiv:2601.16163, 2026) → https://arxiv.org/abs/2601.16163
**Strengthening Generative Robot Policies through Predictive World Modeling** (arXiv:2502.00622, 2026) → https://arxiv.org/abs/2502.00622

---

## 5. Imitation Learning (4 papers)

### Probably Interesting

**ConceptACT: Episode-Level Concepts for Sample-Efficient Robotic IL** (arXiv:2601.17135, 2026) → https://arxiv.org/abs/2601.17135
**ManiLong-Shot: One-Shot IL for Long-Horizon Manipulation** (arXiv:2512.16302, 2025) → https://arxiv.org/abs/2512.16302
**Learning Diverse Skills for Behavior Models with Mixture of Experts** (arXiv:2601.12397, 2026) → https://arxiv.org/abs/2601.12397
**Beyond Behavior Cloning: Robustness through Interactive Imitation** (arXiv:2502.07645, 2026) → https://arxiv.org/abs/2502.07645

---

## 6. Reinforcement Learning (4 papers)

### Probably Interesting

**TransCurriculum: Multi-Dimensional Curriculum for Quadrupedal Locomotion** (arXiv:2603.14156, 2026) → https://arxiv.org/abs/2603.14156
**APEX: Adaptive High-Platform Traversal for Humanoid Robots** (arXiv:2602.11143, 2026) → https://arxiv.org/abs/2602.11143
**SteadyTray: Humanoid Tray Transport via Residual RL** (arXiv:2603.10306, 2026) → https://arxiv.org/abs/2603.10306
**VLA-RL: Scalable RL for Robotic Manipulation** (arXiv:2505.18719, 2025) → https://arxiv.org/abs/2505.18719

---

## 7. Visuomotor Policies (2 papers)

### Probably Interesting

**VPWEM: Non-Markovian Visuomotor Policy with Working and Episodic Memory** (arXiv:2603.04910, 2026) → https://arxiv.org/abs/2603.04910
**Learning Adaptive Cross-Embodiment Visuomotor Policy** (arXiv:2602.01040, 2026) → https://arxiv.org/abs/2602.01040

---

## 8. Controller Composition (2 papers)

### Definitely Interesting

**GSC: A Graph-based Skill Composition Framework for Robot Learning** (Robotics and Autonomous Systems, 2024)
GNN-based skill graphs with transformer architecture for skill composition.
→ https://www.sciencedirect.com/science/article/abs/pii/S0921889024001714

### Probably Interesting

**Residual Skill Policies: Adaptable Skill-based Action Space for RL** (ICLR 2026 submission) → https://openreview.net/forum?id=0nb97NQypbK

---

## 9. Active Learning (1 paper)

### Probably Interesting

**Data-Efficient Learning from Human Interventions for Mobile Robots** (arXiv:2503.04969, 2025) → https://arxiv.org/abs/2503.04969

---

## Top Picks (papers most aligned with core research)

1. **Conformalized Data-Driven Reachability Analysis with PAC Guarantees** — directly combines data-driven verification + conformal prediction
2. **Scalable Data-Driven Reachability via Koopman Operators with Conformal Guarantees** — same core intersection
3. **V-MORALS** — reachability from images, relevant to visuomotor verification
4. **Statistical-Symbolic Verification using State-Dependent CP** — verification + conformal prediction for perception
5. **VLSA: Safety Constraint Layer for VLA Models** — safe generalist policies with formal guarantees
6. **ContractionPPO: Certified RL via Contraction** — certified/verified RL
7. **Sample-Efficient Expert Query via CP** — combines CP + active learning + IL
8. **Compose Your Policies!** — test-time composition of diffusion/flow policies
9. **Flow Policy Gradients** — flow matching policy gradients across multiple robot domains
10. **Conformal Signal Temporal Logic for Robust RL** — CP + formal specs + safe RL
