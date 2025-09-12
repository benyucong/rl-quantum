OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
cx q[0], q[1]; // Edge 0 -> 1
cx q[0], q[2]; // Edge 0 -> 2
cx q[0], q[4]; // Edge 0 -> 4
cx q[2], q[1]; // Edge 2 -> 1
cx q[2], q[4]; // Edge 2 -> 4
cx q[3], q[5]; // Edge 3 -> 5

// Layer 2
rz(1.2) q[1];
rz(0.8) q[2];
rz(1.5) q[4];
rz(1.0) q[3];
cx q[1], q[6]; // Edge 1 -> 6
cx q[4], q[6]; // Edge 4 -> 6
cx q[4], q[2]; // Edge 4 -> 2
cx q[5], q[1]; // Edge 5 -> 1
cx q[5], q[3]; // Edge 5 -> 3

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(-0.65) q[0];
rz(-0.45) q[1];
rz(-0.55) q[2];
rz(-0.85) q[3];
rz(-1.0) q[4];
rz(-0.75) q[5];
rz(-0.9) q[6];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[0]; // for auxiliary purposes
c[8] = measure q[1]; // for auxiliary purposes
c[9] = measure q[2]; // for auxiliary purposes
c[10] = measure q[3]; // for auxiliary purposes
c[11] = measure q[4]; // for auxiliary purposes
c[12] = measure q[5]; // for auxiliary purposes
c[13] = measure q[6]; // for auxiliary purposes