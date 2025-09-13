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
// Hyperedge [0,2,3]
cx q[0], q[2];
cx q[2], q[3];
rz(-0.042) q[3];
cx q[2], q[3];
cx q[0], q[2];
// Hyperedge [0,4]
cx q[0], q[4];
rz(-0.063) q[4];
cx q[0], q[4];
// Hyperedge [1,2,4]
cx q[1], q[2];
cx q[2], q[4];
rz(-0.042) q[4];
cx q[2], q[4];
cx q[1], q[2];
// Hyperedge [1,5]
cx q[1], q[5];
rz(-0.063) q[5];
cx q[1], q[5];
// Hyperedge [4,5]
cx q[4], q[5];
rz(-0.063) q[5];
cx q[4], q[5];
// Hyperedge [2,3,4]
cx q[2], q[3];
cx q[3], q[4];
rz(-0.042) q[4];
cx q[3], q[4];
cx q[2], q[3];
// Mixer layer
h q[0];
rz(0.126) q[0];
h q[0];
h q[1];
rz(0.126) q[1];
h q[1];
h q[2];
rz(0.168) q[2];
h q[2];
h q[3];
rz(0.084) q[3];
h q[3];
h q[4];
rz(0.252) q[4];
h q[4];
h q[5];
rz(0.126) q[5];
h q[5];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];