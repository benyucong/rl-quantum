OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1 (Initialization)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2 (Entangling)
cx q[0], q[3];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[6];
cx q[2], q[3];
cx q[2], q[6];
cx q[3], q[5];
cx q[4], q[5];
cx q[4], q[6];
cx q[5], q[6];

// Layer 3 (Rotation)
rz(0.345) q[0];
rz(-0.897) q[1];
rz(0.134) q[2];
rz(-0.596) q[3];
rz(0.785) q[4];
rz(-0.346) q[5];
rz(0.234) q[6];

// Layer 4 (Unentangling)
cx q[5], q[6];
cx q[4], q[6];
cx q[4], q[5];
cx q[2], q[6];
cx q[2], q[3];
cx q[1], q[6];
cx q[1], q[3];
cx q[1], q[2];
cx q[0], q[5];
cx q[0], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];