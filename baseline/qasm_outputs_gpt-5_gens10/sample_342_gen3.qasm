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
h q[5];
h q[6];
h q[7];

cx q[0], q[1];
rz(0.2306) q[1];
cx q[0], q[1];

cx q[1], q[4];
rz(0.3254) q[4];
cx q[1], q[4];

cx q[2], q[3];
rz(0.1594) q[3];
cx q[2], q[3];

cx q[2], q[6];
rz(0.1912) q[6];
cx q[2], q[6];

cx q[2], q[7];
rz(0.1471) q[7];
cx q[2], q[7];

cx q[4], q[5];
rz(0.3722) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(0.2458) q[6];
cx q[5], q[6];

cx q[6], q[7];
rz(0.0983) q[7];
cx q[6], q[7];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

cx q[1], q[0];
rz(0.2014) q[0];
cx q[1], q[0];

cx q[4], q[1];
rz(0.2372) q[1];
cx q[4], q[1];

cx q[3], q[2];
rz(0.0845) q[2];
cx q[3], q[2];

cx q[6], q[2];
rz(0.1199) q[2];
cx q[6], q[2];

cx q[5], q[4];
rz(0.2653) q[4];
cx q[5], q[4];

cx q[6], q[5];
rz(0.3180) q[5];
cx q[6], q[5];

cx q[7], q[6];
rz(0.1442) q[6];
cx q[7], q[6];

// Measuring the output
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];