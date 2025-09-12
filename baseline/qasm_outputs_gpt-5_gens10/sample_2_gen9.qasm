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

// Layer 2
rx(1.2345) q[0];
rx(1.2001) q[1];
rx(0.9876) q[2];
rx(0.8765) q[3];
rx(1.1111) q[4];
rx(1.2222) q[5];
rx(1.3333) q[6];

// Layer 3
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];

// Layer 4
rz(0.0523) q[0];
rz(0.0761) q[1];
rz(0.0555) q[2];
rz(0.0482) q[3];
rz(0.0678) q[4];
rz(0.0591) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];