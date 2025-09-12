OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialization and Hadamard gates for superposition
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Entanglement
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[0], q[3];

// Layer 3: Rz and Rx rotations for optimal states preparation
rz(0.5) q[0];
rz(-0.5) q[1];
rz(0.3) q[2];
rz(-0.3) q[3];

rx(1.2) q[0];
rx(0.8) q[1];
rx(1.1) q[2];
rx(0.9) q[3];

// Layer 4: Final entangling gates for contextual correlations
cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];