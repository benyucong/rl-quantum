OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// First layer: prepare the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Apply controlled rotations based on the edges of the graph
cx q[0], q[2]; // edge: 0 -> 2
rz(0.7758) q[2]; 
cx q[0], q[2];
cx q[1], q[3]; // edge: 1 -> 3
rz(0.2198) q[3];
cx q[1], q[3];
cx q[1], q[4]; // edge: 1 -> 4
rz(0.4771) q[4];
cx q[1], q[4];
cx q[2], q[4]; // edge: 2 -> 4
rz(0.3421) q[4];
cx q[2], q[4];
cx q[3], q[2]; // edge: 3 -> 2
rz(0.1289) q[2];
cx q[3], q[2];

// Second layer: apply rotation inverses to disentangle
cx q[3], q[2];
rz(-0.1289) q[2];
cx q[3], q[2];
cx q[2], q[4];
rz(-0.3421) q[4];
cx q[2], q[4];
cx q[1], q[4];
rz(-0.4771) q[4];
cx q[1], q[4];
cx q[1], q[3];
rz(-0.2198) q[3];
cx q[1], q[3];
cx q[0], q[2];
rz(-0.7758) q[2];
cx q[0], q[2];

// Measurement of qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];