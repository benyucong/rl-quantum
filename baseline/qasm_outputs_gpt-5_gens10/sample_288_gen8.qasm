OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Preparation
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Entangling gates
cx q[0], q[1];  // Connecting nodes 0 and 1
cx q[2], q[3];  // Connecting nodes 2 and 3
cx q[3], q[4];  // Connecting nodes 3 and 4

// Layer 3: Rotation gates
rz(0.5) q[0];
rz(1.0) q[1];
rz(1.5) q[2];
rz(2.0) q[3];

// Layer 4: Final entangling and Superposition
cx q[1], q[2];
cx q[3], q[0];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];