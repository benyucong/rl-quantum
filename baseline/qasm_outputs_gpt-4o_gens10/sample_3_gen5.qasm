OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[6];
cx q[2], q[3];
cx q[2], q[5];
cx q[2], q[6];
cx q[3], q[5];
cx q[3], q[6];
cx q[4], q[5];
cx q[5], q[6];

// Layer 2
rz(0.1) q[0];
rz(0.2) q[1];
rz(0.3) q[2];
rz(0.4) q[3];
rz(0.5) q[4];
rz(0.6) q[5];
rz(0.7) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 3
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[6];
cx q[2], q[3];
cx q[2], q[5];
cx q[2], q[6];
cx q[3], q[5];
cx q[3], q[6];
cx q[4], q[5];
cx q[5], q[6];

// Layer 4
rz(0.8) q[0];
rz(0.9) q[1];
rz(1.0) q[2];
rz(1.1) q[3];
rz(1.2) q[4];
rz(1.3) q[5];
rz(1.4) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];