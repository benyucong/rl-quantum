OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer - apply CX and RZ gates according to the min-cut optimization
cx q[0], q[2]; // edge 0 -> 2
rz(0.2) q[2];
cx q[2], q[4]; // edge 2 -> 4
rz(0.3) q[4];
cx q[0], q[7]; // edge 0 -> 7
rz(0.5) q[7];
cx q[4], q[1]; // edge 4 -> 1
rz(0.1) q[1];
cx q[4], q[3]; // edge 4 -> 3
rz(0.4) q[3];
cx q[4], q[5]; // edge 4 -> 5
rz(0.2) q[5];
cx q[4], q[6]; // edge 4 -> 6
rz(0.3) q[6];
cx q[4], q[7]; // edge 4 -> 7
rz(0.5) q[7];

// Second layer - applying the gates again to reinforce entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

cx q[2], q[4];
rz(0.3) q[4];
cx q[0], q[2];
rz(0.2) q[2];
cx q[4], q[1];
rz(0.1) q[1];
cx q[4], q[3];
rz(0.4) q[3];
cx q[4], q[5];
rz(0.2) q[5];
cx q[4], q[6];
rz(0.3) q[6];
cx q[4], q[7];
rz(0.5) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];