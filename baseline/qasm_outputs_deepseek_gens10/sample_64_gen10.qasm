OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Edge interactions (0-2, capacity 3)
rz(0.314) q[2];
cx q[0], q[2];
rz(-0.314) q[2];
cx q[0], q[2];

// Edge interactions (0-7, capacity 5)
rz(0.523) q[7];
cx q[0], q[7];
rz(-0.523) q[7];
cx q[0], q[7];

// Edge interactions (1-2, capacity 5)
rz(0.523) q[2];
cx q[1], q[2];
rz(-0.523) q[2];
cx q[1], q[2];

// Edge interactions (1-4, capacity 1)
rz(0.105) q[4];
cx q[1], q[4];
rz(-0.105) q[4];
cx q[1], q[4];

// Edge interactions (1-7, capacity 1)
rz(0.105) q[7];
cx q[1], q[7];
rz(-0.105) q[7];
cx q[1], q[7];

// Edge interactions (2-1, capacity 3)
rz(0.314) q[1];
cx q[2], q[1];
rz(-0.314) q[1];
cx q[2], q[1];

// Edge interactions (3-5, capacity 6)
rz(0.628) q[5];
cx q[3], q[5];
rz(-0.628) q[5];
cx q[3], q[5];

// Edge interactions (3-6, capacity 2)
rz(0.209) q[6];
cx q[3], q[6];
rz(-0.209) q[6];
cx q[3], q[6];

// Edge interactions (3-8, capacity 1)
rz(0.105) q[8];
cx q[3], q[8];
rz(-0.105) q[8];
cx q[3], q[8];

// Edge interactions (4-2, capacity 7)
rz(0.733) q[2];
cx q[4], q[2];
rz(-0.733) q[2];
cx q[4], q[2];

// Edge interactions (4-6, capacity 5)
rz(0.523) q[6];
cx q[4], q[6];
rz(-0.523) q[6];
cx q[4], q[6];

// Edge interactions (6-3, capacity 1)
rz(0.105) q[3];
cx q[6], q[3];
rz(-0.105) q[3];
cx q[6], q[3];

// Edge interactions (6-5, capacity 5)
rz(0.523) q[5];
cx q[6], q[5];
rz(-0.523) q[5];
cx q[6], q[5];

// Edge interactions (7-2, capacity 1)
rz(0.105) q[2];
cx q[7], q[2];
rz(-0.105) q[2];
cx q[7], q[2];

// Edge interactions (7-4, capacity 2)
rz(0.209) q[4];
cx q[7], q[4];
rz(-0.209) q[4];
cx q[7], q[4];

// Edge interactions (7-8, capacity 7)
rz(0.733) q[8];
cx q[7], q[8];
rz(-0.733) q[8];
cx q[7], q[8];

// Layer 2: Mixing and optimization
rz(0.418) q[0];
rz(0.392) q[1];
rz(0.576) q[2];
rz(0.314) q[3];
rz(0.453) q[4];
rz(0.628) q[5];
rz(0.471) q[6];
rz(0.576) q[7];
rz(0.733) q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];