OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1 - Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2 - Problem-specific unitaries with optimal parameters
// Edge 0-3 (weight 5)
cx q[0], q[3];
rz(0.0982) q[3];
cx q[0], q[3];
// Edge 0-4 (weight 15)
cx q[0], q[4];
rz(0.2946) q[4];
cx q[0], q[4];
// Edge 0-5 (weight 13)
cx q[0], q[5];
rz(0.2553) q[5];
cx q[0], q[5];
// Edge 1-4 (weight 10)
cx q[1], q[4];
rz(0.1963) q[4];
cx q[1], q[4];
// Edge 2-5 (weight 6)
cx q[2], q[5];
rz(0.1178) q[5];
cx q[2], q[5];
// Edge 2-4 (weight 13)
cx q[2], q[4];
rz(0.2553) q[4];
cx q[2], q[4];
// Edge 2-3 (weight 15)
cx q[2], q[3];
rz(0.2946) q[3];
cx q[2], q[3];
// Edge 2-7 (weight 18)
cx q[2], q[7];
rz(0.3534) q[7];
cx q[2], q[7];

// Layer 3 - Final mixing and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];