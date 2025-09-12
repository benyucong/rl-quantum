OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1 - Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2 - Apply controlled rotations based on edges and capacities
cx q[0], q[1];
rz(-1.0472) q[1]; // Edge from 0 to 1 with capacity 4
cx q[0], q[3];
rz(-0.7854) q[3]; // Edge from 0 to 3 with capacity 1
cx q[0], q[4];
rz(-0.5236) q[4]; // Edge from 0 to 4 with capacity 2
cx q[1], q[4];
rz(-0.3336) q[4]; // Edge from 1 to 4 with capacity 1
cx q[1], q[5];
rz(-1.0472) q[5]; // Edge from 1 to 5 with capacity 3
cx q[2], q[3];
rz(-1.0472) q[3]; // Edge from 2 to 3 with capacity 2
cx q[2], q[5];
rz(-0.7854) q[5]; // Edge from 2 to 5 with capacity 1
cx q[2], q[6];
rz(-1.5708) q[6]; // Edge from 2 to 6 with capacity 6
cx q[3], q[1];
rz(-0.7854) q[1]; // Edge from 3 to 1 with capacity 2
cx q[3], q[7];
rz(-1.5708) q[7]; // Edge from 3 to 7 with capacity 5
cx q[4], q[2];
rz(-0.7854) q[2]; // Edge from 4 to 2 with capacity 2
cx q[4], q[7];
rz(-1.0472) q[7]; // Edge from 4 to 7 with capacity 4
cx q[5], q[2];
rz(-0.5236) q[2]; // Edge from 5 to 2 with capacity 3
cx q[5], q[4];
rz(-0.7854) q[4]; // Edge from 5 to 4 with capacity 2
cx q[6], q[2];
rz(-0.5236) q[2]; // Edge from 6 to 2 with capacity 1

// Layer 3 - Final measurements
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];