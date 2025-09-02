OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
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

cx q[0], q[6];
cx q[0], q[1];
cx q[3], q[8];
cx q[4], q[8];
cx q[5], q[10];
cx q[6], q[1];
cx q[6], q[2];
cx q[6], q[4];
cx q[6], q[9];
cx q[6], q[11];
cx q[7], q[9];
cx q[8], q[5];
cx q[9], q[6];
cx q[10], q[1];
cx q[10], q[4];
cx q[10], q[8];

// Layer 2
rz(-0.5116) q[0];
rz(-0.4095) q[1];
rz(-0.3291) q[2];
rz(-0.2102) q[3];
rz(-0.1864) q[4];
rz(-0.2941) q[5];
rz(-0.3345) q[6];
rz(-0.1710) q[7];
rz(-0.2671) q[8];
rz(-0.4951) q[9];
rz(-0.2445) q[10];
rz(-0.3087) q[11];

// Layer 3
cx q[0], q[6];
cx q[0], q[1];
cx q[3], q[8];
cx q[4], q[8];
cx q[5], q[10];
cx q[6], q[1];
cx q[6], q[2];
cx q[6], q[4];
cx q[6], q[9];
cx q[6], q[11];
cx q[7], q[9];
cx q[8], q[5];
cx q[9], q[6];
cx q[10], q[1];
cx q[10], q[4];
cx q[10], q[8];

// Layer 4
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