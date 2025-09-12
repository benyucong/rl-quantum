OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Prepare the initial state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Encoding the edges with controlled rotations
cx q[0], q[7]; // Connection between 0 and 7
rz(2.041) q[7];
cx q[0], q[7];

cx q[0], q[10]; // Connection between 0 and 10
rz(2.571) q[10];
cx q[0], q[10];

cx q[1], q[8]; // Connection between 1 and 8
rz(1.547) q[8];
cx q[1], q[8];

cx q[2], q[9]; // Connection between 2 and 9
rz(0.856) q[9];
cx q[2], q[9];

cx q[2], q[12]; // Connection between 2 and 12
rz(1.671) q[12];
cx q[2], q[12];

cx q[3], q[10]; // Connection between 3 and 10
rz(1.981) q[10];
cx q[3], q[10];

cx q[3], q[9]; // Connection between 3 and 9
rz(2.891) q[9];
cx q[3], q[9];

cx q[3], q[12]; // Connection between 3 and 12
rz(2.364) q[12];
cx q[3], q[12];

cx q[4], q[11]; // Connection between 4 and 11
rz(0.794) q[11];
cx q[4], q[11];

cx q[5], q[12]; // Connection between 5 and 12
rz(1.732) q[12];
cx q[5], q[12];

cx q[6], q[7]; // Connection between 6 and 7
rz(1.225) q[7];
cx q[6], q[7];

// Layer 2: Final adjustments before measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

rz(-0.785) q[0];
rz(-0.785) q[1];
rz(-0.785) q[2];
rz(-0.785) q[3];
rz(-0.785) q[4];
rz(-0.785) q[5];
rz(-0.785) q[6];

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