OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[4];

// Layer 2
rz(1.2709) q[0];
rz(0.8542) q[1];
rz(0.6731) q[2];
rz(0.9990) q[3];
rz(1.0477) q[4];
rz(1.4503) q[5];
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[5];

// Layer 3
rz(-0.1124) q[0];
rz(-0.8478) q[1];
rz(0.3001) q[2];
rz(-0.4401) q[3];
rz(1.1387) q[4];
rz(0.5646) q[5];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];