# Research Interests — Sumanth

## Application-Level Interests

### Core / Current Research
- **Data-driven verification of black-box robotic systems**
  - Systems have black-box controllers (no model access)
  - Data-driven approaches to verify behavior/safety properties
  - This is the central thread of current work

### Next Research Direction
- **Verification of visuomotor policies**
  - Extending verification methods to vision-based robot policies
  - Sits at the intersection of core verification work and learned visual policies
  - Relevant methods: conformal prediction, diffusion/flow-matching, active learning

### High Interest (Active)
- **Safe & robust robot control**
  - Natural extension of verification work
  - Ensuring controllers behave safely under uncertainty
- **Controller composition**
  - Composing multiple controllers together
  - Verifying composed systems
- **Generalist policies**
  - Broad, multi-task robot policies
  - Connection to diffusion/flow-matching methods
- **Imitation learning**
  - Learning from demonstrations
  - Uses generative methods (diffusion, flow matching)
- **Reinforcement learning**
  - Policy learning through reward signals
  - Complementary to imitation learning

### Lower Interest (Past Work)
- **Sampling-based motion planning**
  - Past research area, still slightly interested
  - RRT, PRM, and variants

## Method-Level Interests

### Generative Methods
- **Diffusion models**
  - Relevant to: verification efforts, imitation learning, generalist policies
- **Flow matching**
  - Relevant to: verification efforts, imitation learning, generalist policies

### Statistical / Learning Methods
- **Conformal prediction**
  - Distribution-free uncertainty quantification
  - Likely relevant to verification and safety guarantees
- **Active learning**
  - Efficient data collection / query strategies
  - Likely relevant to data-driven verification (reducing sample complexity)

## Paper Filtering Guidance

### Definitely Interesting
- Verification or testing of robotic/autonomous systems
- Verification, testing, or safety analysis of visuomotor policies
- Conformal prediction applied to robotics or control
- Diffusion/flow-matching policies for robots
- Safe control, robust control, controller synthesis with guarantees
- Generalist robot policies (e.g., RT-X, Octo, pi0 style)
- Active learning for robotics or control

### Probably Interesting
- Imitation learning with new architectures or theory
- Reinforcement learning for manipulation/locomotion
- Formal methods meeting learning-based control
- Reachability analysis, Hamilton-Jacobi methods for learned systems

### Mildly Interesting
- Sampling-based motion planning advances
- General diffusion model theory (not robotics-specific)
- General RL theory

### Likely Not Interesting (Unless Robotics Connection)
- Pure computer vision without robotics application
- NLP / LLM papers without embodied AI angle
- Theoretical ML without clear robotics/control relevance
