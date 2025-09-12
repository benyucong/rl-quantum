OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Apply CX gates based on graph edges
cx q[0], q[1]; // Edge 0 -> 1
cx q[0], q[3]; // Edge 0 -> 3
cx q[1], q[3]; // Edge 1 -> 3
cx q[1], q[4]; // Edge 1 -> 4
cx q[2], q[1]; // Edge 2 -> 1
cx q[3], q[1]; // Edge 3 -> 1

// Layer 3: Apply RZ rotations
rz(1.57) q[1];
rz(1.04) q[3];
rz(0.78) q[4];

// Measuring the qubit states
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];