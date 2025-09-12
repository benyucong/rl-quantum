OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];

// Layer 2: Create entanglement and apply controlled rotations based on the min_cut graph
cx q[0], q[6]; // Edge from 0 to 6
rz(-0.2500) q[6];
cx q[0], q[6];

cx q[3], q[8]; // Edge from 3 to 8
rz(-0.1250) q[8];
cx q[3], q[8];

cx q[4], q[8]; // Edge from 4 to 8
rz(-0.2500) q[8];
cx q[4], q[8];

cx q[5], q[10]; // Edge from 5 to 10
rz(-0.1250) q[10];
cx q[5], q[10];

cx q[6], q[1]; // Edge from 6 to 1
rz(-0.1250) q[1];
cx q[6], q[1];

cx q[6], q[2]; // Edge from 6 to 2
rz(-0.1250) q[2];
cx q[6], q[2];

cx q[6], q[4]; // Edge from 6 to 4
rz(-0.1250) q[4];
cx q[6], q[4];

cx q[6], q[9]; // Edge from 6 to 9
rz(-0.1250) q[9];
cx q[6], q[9];

cx q[6], q[11]; // Edge from 6 to 11
rz(-0.1250) q[11];
cx q[6], q[11];

cx q[7], q[9]; // Edge from 7 to 9
rz(-0.1250) q[9];
cx q[7], q[9];

cx q[8], q[5]; // Edge from 8 to 5
rz(-0.1250) q[5];
cx q[8], q[5];

cx q[9], q[6]; // Edge from 9 to 6
rz(-0.2500) q[6];
cx q[9], q[6];

cx q[10], q[1]; // Edge from 10 to 1
rz(-0.1250) q[1];
cx q[10], q[1];

cx q[10], q[4]; // Edge from 10 to 4
rz(-0.1250) q[4];
cx q[10], q[4];

cx q[10], q[8]; // Edge from 10 to 8
rz(-0.1250) q[8];
cx q[10], q[8];

// Layer 3: Final Hadamard and measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];