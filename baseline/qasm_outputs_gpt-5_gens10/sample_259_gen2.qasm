OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Initialize
h q[0];
h q[1];
h q[2];
h q[3];

// Apply controlled rotations based on the min-cut strategy
cx q[0], q[1]; // connect source 0 to node 1
rz(1.5708) q[1]; // rotate to maximize capacity to node 1
cx q[0], q[2]; // connect source 0 to node 2
rz(1.5708) q[2]; // rotate to maximize capacity to node 2
cx q[0], q[3]; // connect source 0 to sink 3
rz(1.5708) q[3]; // rotate to maximize capacity to sink 3

// Measure qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];