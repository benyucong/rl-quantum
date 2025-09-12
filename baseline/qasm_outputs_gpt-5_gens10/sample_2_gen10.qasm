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

// Layer 2
cx q[0], q[1];
rz(0.1842) q[1];
cx q[0], q[1];
cx q[0], q[3];
rz(0.2440) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(0.1265) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.2187) q[3];
cx q[2], q[3];

// Layer 3
cx q[4], q[5];
rz(0.1432) q[5];
cx q[4], q[5];
cx q[3], q[5];
rz(0.2321) q[5];
cx q[3], q[5];
cx q[5], q[6];
rz(0.1675) q[6];
cx q[5], q[6];
cx q[1], q[5];

// Layer 4
h q[0];
rz(0.1762) q[0];
h q[0];
h q[1];
rz(0.1825) q[1];
h q[1];
h q[2];
rz(0.1931) q[2];
h q[2];
h q[3];
rz(0.0871) q[3];
h q[3];
h q[4];
rz(0.0913) q[4];
h q[4];
h q[5];
rz(0.1034) q[5];
h q[5];
h q[6];
rz(0.0987) q[6];
h q[6];
h q[7];
rz(0.1065) q[7];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];