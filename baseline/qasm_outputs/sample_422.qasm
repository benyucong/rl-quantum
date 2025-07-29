OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
// First layer
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.1309) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.1309) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];
// Second layer
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.1309) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.1309) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];