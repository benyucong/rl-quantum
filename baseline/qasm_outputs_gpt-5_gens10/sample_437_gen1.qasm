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

// Layer 1: Apply RX rotations to prepare the superposition
rx(1.5708) q[0]; // pi/2
rx(1.5708) q[1]; // pi/2
rx(1.5708) q[2]; // pi/2
rx(1.5708) q[3]; // pi/2
rx(1.5708) q[4]; // pi/2
rx(1.5708) q[5]; // pi/2

// Layer 2: Apply CNOTs based on the connections in the graph
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[3], q[5];
cx q[3], q[6];

// Layer 3: Apply RZ rotations for phase inversion
rz(-0.5) q[0];
rz(-0.5) q[1];
rz(-0.5) q[2];
rz(-0.5) q[3];
rz(-0.5) q[4];
rz(-0.5) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];