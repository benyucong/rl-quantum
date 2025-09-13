OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
// Hyperedge [8, 11]
cx q[8], q[11];
rz(-0.025) q[11];
cx q[8], q[11];
// Hyperedge [0, 7]
cx q[0], q[7];
rz(-0.025) q[7];
cx q[0], q[7];
// Hyperedge [1, 11]
cx q[1], q[11];
rz(-0.025) q[11];
cx q[1], q[11];
// Hyperedge [0, 2]
cx q[0], q[2];
rz(-0.025) q[2];
cx q[0], q[2];
// Hyperedge [0, 3]
cx q[0], q[3];
rz(-0.025) q[3];
cx q[0], q[3];
// Hyperedge [0, 4]
cx q[0], q[4];
rz(-0.025) q[4];
cx q[0], q[4];
// Hyperedge [3, 5]
cx q[3], q[5];
rz(-0.025) q[5];
cx q[3], q[5];
// Hyperedge [0, 6]
cx q[0], q[6];
rz(-0.025) q[6];
cx q[0], q[6];
// Hyperedge [0, 9]
cx q[0], q[9];
rz(-0.025) q[9];
cx q[0], q[9];
// Hyperedge [10, 5]
cx q[10], q[5];
rz(-0.025) q[5];
cx q[10], q[5];
// Mixer layer
h q[0];
rz(0.05) q[0];
h q[0];
h q[1];
rz(0.05) q[1];
h q[1];
h q[2];
rz(0.05) q[2];
h q[2];
h q[3];
rz(0.05) q[3];
h q[3];
h q[4];
rz(0.05) q[4];
h q[4];
h q[5];
rz(0.05) q[5];
h q[5];
h q[6];
rz(0.05) q[6];
h q[6];
h q[7];
rz(0.05) q[7];
h q[7];
h q[8];
rz(0.05) q[8];
h q[8];
h q[9];
rz(0.05) q[9];
h q[9];
h q[10];
rz(0.05) q[10];
h q[10];
h q[11];
rz(0.05) q[11];
h q[11];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];