# Extracted Paper Tables and Figure Map

These CSV files contain the table values extracted from `acm-cais26-paper217.pdf` and the reviewer-facing figure/table artifact map.

- `table1_passk_comparison.csv`: Table 1, Vista Pass@K comparison across baseline categories.
- `table2_reward_ablation.csv`: Table 2, stage-based reward ablation for Vista.
- `table3_training_settings.csv`: Table 3, training settings for tool-augmented agentic RL with the 4B SFT model.
- `figure_artifact_map.csv`: mapping from each paper figure/table to the artifact inputs, scripts, and reviewer action that reproduce or support it.

Column suffixes:

- `_pct`: percentage value without the percent sign.
- `re`: Behavior relative entropy, where lower is better.
- `scr`: Feasibility / Syntax Compilation Rate.
- `srev`: Objective / Success Rate of Expectation Verification.
- `hqcr`: Utility / High-Quality Circuit Rate.
