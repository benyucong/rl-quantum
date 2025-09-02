OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Entangling gates for edge coverage
cx q[0], q[1];
rz(0.5) q[1]; // rotational parameter can be fine-tuned
cx q[1], q[2];
rz(0.5) q[2]; // rotational parameter can be fine-tuned
cx q[1], q[3];
rz(0.5) q[3]; // rotational parameter can be fine-tuned

// Layer 3: Final entanglement and measurements
cx q[2], q[0];
h q[0];
h q[1];
h q[2];
h q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];