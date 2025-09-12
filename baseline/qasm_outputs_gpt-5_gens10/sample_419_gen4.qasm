OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize qubits and apply Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Apply controlled operations to encode the min-cut problem
cx q[0], q[2]; // source to intermediate
rz(0.23) q[2];
cx q[0], q[5]; // source to sink

cx q[2], q[1]; // intermediate to node 1
rz(0.15) q[1];
cx q[2], q[4]; // intermediate to node 4
rz(0.20) q[4];

cx q[3], q[2]; // node 3 to intermediate
rz(0.10) q[2];
cx q[3], q[5]; // node 3 to sink

// Layer 2: Further operations for entanglement
cx q[4], q[1]; // node 4 to node 1
rz(0.10) q[1];
cx q[4], q[3]; // node 4 to node 3
rz(0.05) q[3];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];