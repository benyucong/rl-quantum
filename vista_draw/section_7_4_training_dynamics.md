## 7.4 Training Dynamics and Stability

We analyze training stability by tracking verified performance as a function of training progress. Figure 11 plots HQCR (higher-is-better; computed from the same verifier used elsewhere in the paper) versus training steps for **VISTA** and four reward ablations: **w/o EV**, **w/o RE**, **w/o Opt**, and **w/o QMP**. We report **three random seeds** for each setting and show **mean ±1 std** as a variance band.

**VISTA** learns quickly and remains stable: HQCR increases sharply in the early phase and then plateaus with low variance across seeds. Removing semantic EV shaping (**w/o EV**) yields slower improvement and a lower final plateau. The non-hierarchical regularization ablation (**w/o RE**) shows the strongest late collapse after an early rise. Removing optimization progress reward (**w/o Opt**) also degrades late-stage quality and converges to a lower level than full VISTA. Removing qubit-mismatch regularization (**w/o QMP**) produces a noisier trajectory with visibly larger fluctuations and mild late regression.

These dynamics support the core premise of VISTA: **hierarchical verified rewards** provide a shaped, reliable learning signal that improves stability while preserving semantic progress. EV and optimization components are both important for sustained gains; RE helps avoid collapse, and QMP helps suppress instability from qubit-mismatch-induced noise.

**Figure 11: Training dynamics and stability.** HQCR (%) versus training steps comparing VISTA to reward ablations (w/o EV, w/o RE, w/o Opt, w/o QMP). Curves show mean across 3 seeds with ±1 std bands.
