OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2
cx q[0], q[1];
cx q[0], q[5];
cx q[0], q[6];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[4];

// Layer 3
cx q[3], q[4];
cx q[3], q[6];
cx q[4], q[5];
cx q[4], q[6];

// Layer 4
rx(1.2423) q[0];
rz(-0.0456) q[0];
rx(1.5461) q[1];
rz(0.0172) q[1];
rx(0.6541) q[2];
rz(-0.0098) q[2];
rx(0.9237) q[3];
rz(0.0041) q[3];
rx(1.3650) q[4];
rz(0.0029) q[4];
rx(1.7891) q[5];
rz(0.0013) q[5];
rx(1.6472) q[6];
rz(-0.0042) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];