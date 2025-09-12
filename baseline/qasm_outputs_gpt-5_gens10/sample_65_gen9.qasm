OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Preparation phase with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Encoding the Min-Cut problem
cx q[0], q[2]; // Connect source to intermediate node
rz(0.3214) q[2]; // Rotation based on capacity
cx q[0], q[2];

cx q[1], q[3]; // Connect intermediate to target
rz(0.1542) q[3]; // Rotation based on capacity
cx q[1], q[3];

cx q[2], q[3]; // Connect more directly
rz(-0.0337) q[3]; // Adjustment based on capacity
cx q[2], q[3];

cx q[2], q[4]; // Direct connection to sink
rz(-0.1974) q[4]; // Rotation based on capacity
cx q[2], q[4];

// Layer 3: Measurement phase
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];