OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1 - Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];
rx(1.5708) q[9];

// Layer 2 - Problem unitary (capacity constraints)
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(0.2618) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.2618) q[4];
cx q[2], q[4];
cx q[3], q[2];
rz(0.7854) q[2];
cx q[3], q[2];
cx q[3], q[5];
rz(0.5236) q[5];
cx q[3], q[5];

// Layer 3 - Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];
rx(1.5708) q[9];

// Layer 4 - Final problem unitary with optimized parameters
cx q[0], q[5];
rz(1.1781) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(1.1781) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(0.3927) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.3927) q[4];
cx q[2], q[4];
cx q[3], q[2];
rz(1.1781) q[2];
cx q[3], q[2];
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];

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
c[9] = measure q[9];