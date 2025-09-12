OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initializing qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Apply controlled operations based on the edges
cx q[0], q[1]; // edge 0-1
cx q[0], q[3]; // edge 0-3
cx q[0], q[4]; // edge 0-4
cx q[1], q[4]; // edge 1-4
cx q[2], q[3]; // edge 2-3
cx q[3], q[4]; // edge 3-4

// Layer 2: Apply rotation gates
rz(0.3) q[0];
rz(0.5) q[1];
rz(0.7) q[2];
rz(0.9) q[3];
rz(1.1) q[4];
rz(1.3) q[5];

// Layer 3: Apply additional entangling and rotation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[5];
cx q[1], q[4];
cx q[2], q[3];
rz(0.4) q[5];
rz(0.6) q[4];
rz(0.8) q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];