OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1 - Apply controlled NOTs based on graph structure
cx q[0], q[1]; // Source to Node 1
cx q[0], q[4]; // Source to Node 4
cx q[1], q[2]; // Node 1 to Node 2
cx q[3], q[2]; // Node 3 to Node 2
cx q[3], q[5]; // Node 3 to Sink
cx q[4], q[5]; // Node 4 to Sink

// Layer 2 - Apply rotation gates
rz(0.5) q[0];
rz(1.2) q[1];
rz(0.7) q[2];
rz(0.9) q[3];
rz(0.3) q[4];
rz(1.0) q[5];

// Layer 3 - Additional entangling gates
cx q[0], q[3];
cx q[2], q[4];
cx q[1], q[5];

// Layer 4 - Final rotations to optimize measurement probabilities
rz(1.5) q[0];
rz(0.2) q[1];
rz(0.8) q[2];
rz(0.6) q[3];
rz(1.1) q[4];
rz(0.4) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];