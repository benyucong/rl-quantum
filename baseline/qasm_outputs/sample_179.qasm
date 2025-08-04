OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1 - Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1 - Problem unitary (weighted edges)
// Edge 0-4 (weight 3)
cx q[0], q[4];
rz(0.3) q[4];
cx q[0], q[4];
// Edge 0-7 (weight 12)
cx q[0], q[7];
rz(1.2) q[7];
cx q[0], q[7];
// Edge 0-5 (weight 12)
cx q[0], q[5];
rz(1.2) q[5];
cx q[0], q[5];
// Edge 1-5 (weight 6)
cx q[1], q[5];
rz(0.6) q[5];
cx q[1], q[5];
// Edge 1-6 (weight 11)
cx q[1], q[6];
rz(1.1) q[6];
cx q[1], q[6];
// Edge 1-10 (weight 14) - mapped to q[8]
cx q[1], q[8];
rz(1.4) q[8];
cx q[1], q[8];
// Edge 2-6 (weight 7)
cx q[2], q[6];
rz(0.7) q[6];
cx q[2], q[6];
// Edge 3-7 (weight 8)
cx q[3], q[7];
rz(0.8) q[7];
cx q[3], q[7];
// Edge 3-9 (weight 16) - mapped to q[8]
cx q[3], q[8];
rz(1.6) q[8];
cx q[3], q[8];

// Layer 2 - Mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2 - Problem unitary (optimized parameters)
// Edge 0-4
cx q[0], q[4];
rz(0.45) q[4];
cx q[0], q[4];
// Edge 0-7
cx q[0], q[7];
rz(1.8) q[7];
cx q[0], q[7];
// Edge 0-5
cx q[0], q[5];
rz(1.8) q[5];
cx q[0], q[5];
// Edge 1-5
cx q[1], q[5];
rz(0.9) q[5];
cx q[1], q[5];
// Edge 1-6
cx q[1], q[6];
rz(1.65) q[6];
cx q[1], q[6];
// Edge 1-10
cx q[1], q[8];
rz(2.1) q[8];
cx q[1], q[8];
// Edge 2-6
cx q[2], q[6];
rz(1.05) q[6];
cx q[2], q[6];
// Edge 3-7
cx q[3], q[7];
rz(1.2) q[7];
cx q[3], q[7];
// Edge 3-9
cx q[3], q[8];
rz(2.4) q[8];
cx q[3], q[8];

// Layer 3 - Final mixing and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];