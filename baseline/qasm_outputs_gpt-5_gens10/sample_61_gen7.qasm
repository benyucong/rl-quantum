OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Entangling gates based on edges
cx q[0], q[1]; // edge 0 -> 1
cx q[0], q[2]; // edge 0 -> 2
cx q[0], q[3]; // edge 0 -> 3
cx q[0], q[5]; // edge 0 -> 5
cx q[2], q[5]; // edge 2 -> 5
cx q[2], q[7]; // edge 2 -> 7
cx q[3], q[1]; // edge 3 -> 1
cx q[3], q[7]; // edge 3 -> 7
cx q[4], q[5]; // edge 4 -> 5
cx q[4], q[6]; // edge 4 -> 6
cx q[5], q[4]; // edge 5 -> 4
cx q[5], q[6]; // edge 5 -> 6
cx q[6], q[1]; // edge 6 -> 1
cx q[6], q[3]; // edge 6 -> 3
cx q[6], q[4]; // edge 6 -> 4

// Layer 2
rx(1.231) q[0];
ry(0.890) q[1];
rz(0.455) q[2];
rx(1.676) q[3];
ry(0.340) q[4];
rz(1.238) q[5];
rx(0.627) q[6];
ry(1.902) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];