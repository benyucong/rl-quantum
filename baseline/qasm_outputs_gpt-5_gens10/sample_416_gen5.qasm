OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialization and entangling operations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[1];
rz(-0.785) q[1]; // Control edge (0 -> 1)
cx q[1], q[5];
rz(-0.785) q[5]; // Source to sink (1 -> 5)
cx q[2], q[1];
rz(-0.785) q[1]; // Control edge (2 -> 1)
cx q[2], q[4];
rz(-0.785) q[4]; // Source to alternative (2 -> 4)
cx q[3], q[4];
rz(-0.785) q[4]; // Alternative to inter-connection (3 -> 4)
cx q[3], q[5];
rz(-0.785) q[5]; // Alternative to sink (3 -> 5)

// Layer 2: Measurement and final adjustments
h q[0];
rz(0.785) q[0];
h q[0];
h q[1];
rz(0.785) q[1];
h q[1];
h q[2];
rz(0.785) q[2];
h q[2];
h q[3];
rz(0.785) q[3];
h q[3];
h q[4];
rz(0.785) q[4];
h q[4];
h q[5];
rz(0.785) q[5];
h q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];