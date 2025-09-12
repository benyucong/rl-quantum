OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize the qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled gates based on the min_cut problem
cx q[0], q[1]; // (0, 1)
rz(-0.331) q[1];

cx q[0], q[3]; // (0, 3)
rz(-0.228) q[3];

cx q[0], q[4]; // (0, 4)
rz(-0.318) q[4];

cx q[0], q[5]; // (0, 5)
rz(-0.156) q[5];

cx q[1], q[3]; // (1, 3)
rz(-0.223) q[3];

cx q[1], q[4]; // (1, 4)
rz(-0.152) q[4];

cx q[1], q[5]; // (1, 5)
rz(-0.194) q[5];

// Layer 3: Finalize the circuit and measurements
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