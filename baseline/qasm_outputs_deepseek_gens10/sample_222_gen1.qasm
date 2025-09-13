OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
// Initialize superposition on matching qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Apply phase oracle for perfect bipartite matching
// Edge (0,4) - weight 1
rz(0.3927) q[0];
rz(0.3927) q[4];
// Edge (0,6) - weight 19
rz(7.4613) q[0];
rz(7.4613) q[6];
// Edge (1,5) - weight 6
rz(2.3562) q[1];
rz(2.3562) q[5];
// Edge (1,6) - weight 19
rz(7.4613) q[1];
rz(7.4613) q[6];
// Edge (1,4) - weight 18
rz(7.0686) q[1];
rz(7.0686) q[4];
// Edge (2,6) - weight 1
rz(0.3927) q[2];
rz(0.3927) q[6];
// Edge (2,7) - weight 15
rz(5.8905) q[2];
rz(5.8905) q[7];
// Edge (3,7) - weight 5
rz(1.9635) q[3];
rz(1.9635) q[7];
// Edge (3,5) - weight 14
rz(5.4978) q[3];
rz(5.4978) q[5];
// Apply mixing layer
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
c[8] = measure q[8];