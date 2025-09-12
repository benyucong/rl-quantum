OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialization and entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[2];
cx q[2], q[5];
cx q[3], q[4];

// Layer 2: Parameterized rotation
rz(0.6543) q[0];
rz(0.5321) q[1];
rz(0.2134) q[2];
rz(0.8675) q[3];
rz(0.5938) q[4];
rz(0.4231) q[5];

// Layer 3: Controlled operations
cx q[0], q[4];
cx q[1], q[5];
cx q[2], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];