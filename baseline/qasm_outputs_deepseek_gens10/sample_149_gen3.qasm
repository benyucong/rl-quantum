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

// Edge interactions with optimal parameters
// Edge (0,1) weight=4
cx q[0], q[1];
rz(0.16) q[1];
cx q[0], q[1];

// Edge (0,4) weight=20
cx q[0], q[4];
rz(0.8) q[4];
cx q[0], q[4];

// Edge (0,3) weight=11
cx q[0], q[3];
rz(0.44) q[3];
cx q[0], q[3];

// Edge (1,3) weight=20
cx q[1], q[3];
rz(0.8) q[3];
cx q[1], q[3];

// Edge (1,5) weight=17
cx q[1], q[5];
rz(0.68) q[5];
cx q[1], q[5];

// Edge (2,3) weight=9
cx q[2], q[3];
rz(0.36) q[3];
cx q[2], q[3];

// Edge (3,6) weight=16
cx q[3], q[6];
rz(0.64) q[6];
cx q[3], q[6];

// Edge (4,5) weight=2
cx q[4], q[5];
rz(0.08) q[5];
cx q[4], q[5];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions with optimal parameters
// Edge (0,1) weight=4
cx q[0], q[1];
rz(0.16) q[1];
cx q[0], q[1];

// Edge (0,4) weight=20
cx q[0], q[4];
rz(0.8) q[4];
cx q[0], q[4];

// Edge (0,3) weight=11
cx q[0], q[3];
rz(0.44) q[3];
cx q[0], q[3];

// Edge (1,3) weight=20
cx q[1], q[3];
rz(0.8) q[3];
cx q[1], q[3];

// Edge (1,5) weight=17
cx q[1], q[5];
rz(0.68) q[5];
cx q[1], q[5];

// Edge (2,3) weight=9
cx q[2], q[3];
rz(0.36) q[3];
cx q[2], q[3];

// Edge (3,6) weight=16
cx q[3], q[6];
rz(0.64) q[6];
cx q[3], q[6];

// Edge (4,5) weight=2
cx q[4], q[5];
rz(0.08) q[5];
cx q[4], q[5];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions with optimal parameters
// Edge (0,1) weight=4
cx q[0], q[1];
rz(0.16) q[1];
cx q[0], q[1];

// Edge (0,4) weight=20
cx q[0], q[4];
rz(0.8) q[4];
cx q[0], q[4];

// Edge (0,3) weight=11
cx q[0], q[3];
rz(0.44) q[3];
cx q[0], q[3];

// Edge (1,3) weight=20
cx q[1], q[3];
rz(0.8) q[3];
cx q[1], q[3];

// Edge (1,5) weight=17
cx q[1], q[5];
rz(0.68) q[5];
cx q[1], q[5];

// Edge (2,3) weight=9
cx q[2], q[3];
rz(0.36) q[3];
cx q[2], q[3];

// Edge (3,6) weight=16
cx q[3], q[6];
rz(0.64) q[6];
cx q[3], q[6];

// Edge (4,5) weight=2
cx q[4], q[5];
rz(0.08) q[5];
cx q[4], q[5];

// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions with optimal parameters
// Edge (0,1) weight=4
cx q[0], q[1];
rz(0.16) q[1];
cx q[0], q[1];

// Edge (0,4) weight=20
cx q[0], q[4];
rz(0.8) q[4];
cx q[0], q[4];

// Edge (0,3) weight=11
cx q[0], q[3];
rz(0.44) q[3];
cx q[0], q[3];

// Edge (1,3) weight=20
cx q[1], q[3];
rz(0.8) q[3];
cx q[1], q[3];

// Edge (1,5) weight=17
cx q[1], q[5];
rz(0.68) q[5];
cx q[1], q[5];

// Edge (2,3) weight=9
cx q[2], q[3];
rz(0.36) q[3];
cx q[2], q[3];

// Edge (3,6) weight=16
cx q[3], q[6];
rz(0.64) q[6];
cx q[3], q[6];

// Edge (4,5) weight=2
cx q[4], q[5];
rz(0.08) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];