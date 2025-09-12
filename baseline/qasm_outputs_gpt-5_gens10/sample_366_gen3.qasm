OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 1: Encoding Flow Paths
rx(1.2) q[0]; // Corresponds to edge (0, 1)
rx(1.0) q[1]; // Corresponds to edge (0, 3)
rx(0.8) q[2]; // Corresponds to edge (1, 2)
rx(1.1) q[3]; // Corresponds to edge (1, 3)

// Layer 2: Interactions for Flow Transfer
cx q[0], q[1];
cx q[1], q[3];
cx q[2], q[1];
rz(0.5) q[1];
cx q[0], q[1];
rz(0.2) q[2];

// Layer 3: Finalizing Flow States
cx q[2], q[3];
rz(-0.3) q[3];
cx q[1], q[3];
rz(0.3) q[1];
cx q[1], q[0];
rz(-0.1) q[0];

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
c[10] = measure q[10];
c[11] = measure q[11];