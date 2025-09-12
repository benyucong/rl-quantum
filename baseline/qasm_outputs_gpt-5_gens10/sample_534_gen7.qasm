OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer of entanglement (edges)
cx q[0], q[3]; // source 0 to target 3
cx q[0], q[4]; // source 0 to target 4
cx q[1], q[4]; // source 1 to target 4
cx q[2], q[4]; // source 2 to target 4
cx q[3], q[4]; // source 3 to target 4

// Second layer of rotation (params optimized)
rz(-0.785) q[0];
rz(-0.785) q[1];
rz(-0.785) q[2];
rz(-0.785) q[3];
rz(-0.785) q[4];

// Second layer of entanglement
cx q[0], q[1];
cx q[2], q[3];
cx q[1], q[4];

// Third layer of rotation (params optimized)
rz(0.785) q[0];
rz(0.785) q[1];
rz(0.785) q[2];
rz(0.785) q[3];
rz(0.785) q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];