OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 1: Applying controlled gates based on the edges
cx q[0], q[2]; // 0 -> 2
rz(-0.5) q[2]; // Edge from 0 to 2 transforms
cx q[1], q[3]; // 1 -> 3
rz(-0.5) q[3]; // Edge from 1 to 3 transforms

// Layer 2: Applying controlled gates to add additional quantum correlations
cx q[2], q[1]; // 2 -> 1
rz(-0.5) q[1]; // Edge from 2 to 1 transforms
cx q[2], q[3]; // 2 -> 3
rz(-0.5) q[3]; // Edge from 2 to 3 transforms

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];