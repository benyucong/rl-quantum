OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
// Initialize all qubits to |+> state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Apply phase separation with optimal parameters for maximum bipartite matching
// Edge (0,3) with weight 8
rz(0.314) q[0];
rz(0.314) q[3];
// Edge (0,5) with weight 15
rz(0.589) q[0];
rz(0.589) q[5];
// Edge (0,4) with weight 17
rz(0.667) q[0];
rz(0.667) q[4];
// Edge (1,4) with weight 5
rz(0.196) q[1];
rz(0.196) q[4];
// Edge (1,6) with weight 11
rz(0.431) q[1];
rz(0.431) q[6];
// Edge (2,5) with weight 6
rz(0.235) q[2];
rz(0.235) q[5];
// Edge (2,3) with weight 17
rz(0.667) q[2];
rz(0.667) q[3];
// Edge (2,4) with weight 15
rz(0.589) q[2];
rz(0.589) q[4];
// Final Hadamard layer for measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];