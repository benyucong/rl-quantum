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
cx q[0], q[1];
rx(1.264) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(-0.524) q[4];
cx q[0], q[4];
cz q[0], q[2];
rz(-1.159) q[2];
cx q[1], q[5];
rz(-0.796) q[5];
cx q[2], q[3];
rz(0.309) q[3];

// Layer 2
cx q[3], q[4];
rz(-0.845) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(0.56) q[5];
cx q[4], q[5];
cx q[3], q[6];
rz(0.91) q[6];
cx q[4], q[6];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
cx q[1], q[7];
rx(-1.027) q[7];
cx q[1], q[7];
cx q[2], q[6];
rz(1.358) q[6];
cx q[2], q[6];
cx q[3], q[7];
rz(-0.156) q[7];
cx q[3], q[7];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];