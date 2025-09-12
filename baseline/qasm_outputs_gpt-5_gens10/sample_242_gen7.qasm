OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1
cx q[0], q[1];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[5];
cx q[3], q[4];

// Layer 2
rx(1.576) q[0];
rz(-0.078) q[1];
rx(0.876) q[2];
rz(-0.045) q[3];
rx(2.241) q[4];
rz(0.001) q[5];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Final Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];