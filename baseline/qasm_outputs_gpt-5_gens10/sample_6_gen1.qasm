OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

// Initialization
h q[0];
h q[1];
h q[2];

// Layer 1: Apply CNOT gates for entanglement
cx q[0], q[1];
cx q[0], q[2];

// Layer 2: Apply rotation gates
rz(0.1) q[0];
rz(0.2) q[1];
rz(0.3) q[2];

// Layer 3: Apply CNOT gates to create correlations
cx q[1], q[2];
cx q[0], q[1];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];