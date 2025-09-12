OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled operations based on the min-cut graph
cx q[0], q[1]; // Edge (0, 1)
rz(0.5) q[1];
cx q[0], q[1];

cx q[0], q[5]; // Edge (0, 5)
rz(0.5) q[5];
cx q[0], q[5];

cx q[1], q[5]; // Edge (1, 5)
rz(0.5) q[5];
cx q[1], q[5];

cx q[2], q[4]; // Edge (2, 4)
rz(0.5) q[4];
cx q[2], q[4];

cx q[3], q[4]; // Edge (3, 4)
rz(0.5) q[4];
cx q[3], q[4];

cx q[4], q[1]; // Edge (4, 1)
rz(0.5) q[1];
cx q[4], q[1];

cx q[4], q[3]; // Edge (4, 3)
rz(0.5) q[3];
cx q[4], q[3];

cx q[4], q[5]; // Edge (4, 5)
rz(0.5) q[5];
cx q[4], q[5];

// Layer 3: Finalize and measure
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];