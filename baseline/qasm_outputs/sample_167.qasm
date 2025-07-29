OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1 - Initialization and Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];

// Layer 2 - Controlled rotations based on edge weights
// Edge 0-9 (weight 8)
crz(0.7854) q[0], q[9];
// Edge 0-10 (weight 12)
crz(1.1781) q[0], q[10];
// Edge 1-10 (weight 2)
crz(0.1963) q[1], q[10];
// Edge 2-11 (weight 5)
crz(0.4909) q[2], q[11];
// Edge 2-9 (weight 12)
crz(1.1781) q[2], q[9];
// Edge 5-10 (weight 12)
crz(1.1781) q[5], q[10];
// Edge 6-11 (weight 15)
crz(1.4726) q[6], q[11];
// Edge 8-10 (weight 14)
crz(1.3744) q[8], q[10];

// Layer 3 - Final Hadamard and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];