OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
h q[0]; // Create superposition
h q[1]; // Create superposition
h q[2]; // Create superposition
h q[3]; // Create superposition

// Layer 1 - Initial entanglement
cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[1];

// Layer 2 - Rotate gates to adjust amplitudes
rz(0.5) q[0];
rz(1.0) q[1];
rz(-0.5) q[2];
rz(-1.0) q[3];

// Layer 3 - Further entangling
cx q[0], q[1];
cx q[2], q[3];
cx q[1], q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];