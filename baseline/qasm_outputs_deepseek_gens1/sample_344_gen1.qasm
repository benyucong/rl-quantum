OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
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
// Hyperedge [0, 1]
cx q[0], q[1];
rz(-0.042) q[1];
cx q[0], q[1];
// Hyperedge [0, 9, 8, 7]
cx q[0], q[9];
cx q[9], q[8];
cx q[8], q[7];
rz(-0.011) q[7];
cx q[8], q[7];
cx q[9], q[8];
cx q[0], q[9];
// Hyperedge [8, 6]
cx q[8], q[6];
rz(-0.042) q[6];
cx q[8], q[6];
// Hyperedge [1, 2, 5, 6]
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[6];
rz(-0.011) q[6];
cx q[5], q[6];
cx q[2], q[5];
cx q[1], q[2];
// Hyperedge [1, 2, 4, 7, 8, 9]
cx q[1], q[2];
cx q[2], q[4];
cx q[4], q[7];
cx q[7], q[8];
cx q[8], q[9];
rz(-0.007) q[9];
cx q[8], q[9];
cx q[7], q[8];
cx q[4], q[7];
cx q[2], q[4];
cx q[1], q[2];
// Hyperedge [0, 3, 5, 9, 10]
cx q[0], q[3];
cx q[3], q[5];
cx q[5], q[9];
cx q[9], q[10];
rz(-0.008) q[10];
cx q[9], q[10];
cx q[5], q[9];
cx q[3], q[5];
cx q[0], q[3];
// Hyperedge [1, 2, 3, 4, 5, 9]
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[9];
rz(-0.007) q[9];
cx q[5], q[9];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
// Hyperedge [8, 3, 4]
cx q[8], q[3];
cx q[3], q[4];
rz(-0.014) q[4];
cx q[3], q[4];
cx q[8], q[3];
// Hyperedge [1, 10, 4]
cx q[1], q[10];
cx q[10], q[4];
rz(-0.014) q[4];
cx q[10], q[4];
cx q[1], q[10];
// Hyperedge [3, 5, 7, 8, 9, 10]
cx q[3], q[5];
cx q[5], q[7];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[10];
rz(-0.007) q[10];
cx q[9], q[10];
cx q[8], q[9];
cx q[7], q[8];
cx q[5], q[7];
cx q[3], q[5];
// Hyperedge [2, 6, 7]
cx q[2], q[6];
cx q[6], q[7];
rz(-0.014) q[7];
cx q[6], q[7];
cx q[2], q[6];
// Hyperedge [1, 2, 5, 7, 9]
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[7];
cx q[7], q[9];
rz(-0.008) q[9];
cx q[7], q[9];
cx q[5], q[7];
cx q[2], q[5];
cx q[1], q[2];
// Hyperedge [0, 5, 6]
cx q[0], q[5];
cx q[5], q[6];
rz(-0.014) q[6];
cx q[5], q[6];
cx q[0], q[5];
// Hyperedge [9, 2, 10, 4]
cx q[9], q[2];
cx q[2], q[10];
cx q[10], q[4];
rz(-0.011) q[4];
cx q[10], q[4];
cx q[2], q[10];
cx q[9], q[2];
// Hyperedge [0, 5, 7]
cx q[0], q[5];
cx q[5], q[7];
rz(-0.014) q[7];
cx q[5], q[7];
cx q[0], q[5];
// Hyperedge [0, 3, 6, 7, 10]
cx q[0], q[3];
cx q[3], q[6];
cx q[6], q[7];
cx q[7], q[10];
rz(-0.008) q[10];
cx q[7], q[10];
cx q[6], q[7];
cx q[3], q[6];
cx q[0], q[3];
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