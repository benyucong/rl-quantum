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
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];

// Layer 2
rz(-0.5567) q[0];
rz(-0.3121) q[1];
rz(-0.7876) q[2];
rz(-0.4237) q[3];
rz(-0.2318) q[4];
rz(-0.9983) q[5];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[2], q[5];
cx q[3], q[6];

// Layer 4
rz(0.1228) q[0];
rz(0.2339) q[1];
rz(0.1446) q[2];
rz(0.0784) q[3];
rz(0.1974) q[4];
rz(0.0342) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];