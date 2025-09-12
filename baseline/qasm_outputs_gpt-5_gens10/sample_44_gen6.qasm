OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2
cx q[0], q[5];
cx q[1], q[6];
cx q[1], q[7];
cx q[1], q[8];
cx q[2], q[5];
cx q[2], q[7];
cx q[3], q[8];
cx q[3], q[5];

// Layer 3
rz(0.0625) q[5];
rz(0.0375) q[6];
rz(0.0450) q[7];
rz(0.0400) q[8];

// Layer 4
cx q[4], q[5];
cx q[4], q[6];
cx q[4], q[7];
cx q[4], q[8];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];