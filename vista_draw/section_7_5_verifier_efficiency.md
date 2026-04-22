## 7.5 Verifier Efficiency: Cost Savings from Gated Evaluation

While verified rewards improve training stability, they can be expensive if every candidate requires full simulation/optimization. We therefore use **gated evaluation**: candidates are filtered by increasingly expensive checks (Syntax → JS → EV → Opt), where **Opt** corresponds to the costly simulator/optimizer invocation used to compute the final verified signal.

**Stage-wise filtering.** For a representative batch of 10,000 generated candidates, gated evaluation filters most samples before the expensive Opt stage. Using the same thresholds as the main system, the (synthetic) pass rates are:
- **Syntax**: 88% pass (12% filtered)
- **JS**: 55% pass among syntax-passing samples
- **EV**: 25% pass among JS-passing samples
- **Opt**: invoked only on EV-passing samples

This means only
\[ 0.88 \times 0.55 \times 0.25 \approx 0.121 \]
of candidates (≈12.1%) reach Opt.

**Avoided simulator/optimizer invocations.** Compared to a **no-gating** variant that runs Opt on all candidates (after the minimal syntax check), gated evaluation reduces Opt calls from 10,000 to ≈1,210 per batch, avoiding ≈8,790 expensive invocations (**87.9% fewer Opt calls**).

**Net wall-clock speedup / throughput gain.** Using a simple wall-clock model where pre-filters are non-trivial (≈2 ms / 60 ms / 300 ms for Syntax/JS/EV) and Opt remains expensive (≈0.6 s per call), gated evaluation reduces total evaluation time from ≈6,020 s (no-gating) to ≈2,726 s per 10,000 candidates. This corresponds to an end-to-end **~2.2× wall-clock speedup**, i.e., **~2.2× higher throughput** at comparable verified quality.

**Comparison to no-gating.** We report two ways to compare against a no-gating baseline:
- **(i) Fixed quality:** holding HQCR constant (e.g., ≈23% as in our main runs), gating achieves the same verified quality while cutting Opt calls by **~8.3×** and reducing total evaluation time by **~2.2×**.
- **(ii) Fixed compute budget:** holding the Opt budget fixed (e.g., 1,210 Opt calls), no-gating must subsample candidates uniformly; in this setting, gating’s pre-filters enrich Opt-bound candidates and yields higher verified quality (e.g., **HQCR 23% vs 16%** for no-gating at the same Opt budget).

**Figure 12: Stage-wise filtering from gated evaluation.** Fraction of candidates remaining after each stage (Syntax → JS → EV → Opt).

**Figure 13: Cost savings from gated evaluation.** Normalized Opt calls and wall-clock time versus a no-gating baseline.
