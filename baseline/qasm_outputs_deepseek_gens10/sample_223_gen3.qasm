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
// Hyperedge [0, 10]
cx q[0], q[10];
rz(-0.0421) q[10];
cx q[0], q[10];
// Hyperedge [4, 6, 7, 9, 10]
cx q[4], q[6];
cx q[6], q[7];
cx q[7], q[9];
cx q[9], q[10];
rz(-0.0084) q[10];
cx q[9], q[10];
cx q[7], q[9];
cx q[6], q[7];
cx q[4], q[6];
// Hyperedge [9, 2]
cx q[9], q[2];
rz(-0.0421) q[2];
cx q[9], q[2];
// Hyperedge [8, 1, 4]
cx q[8], q[1];
cx q[1], q[4];
rz(-0.0281) q[4];
cx q[1], q[4];
cx q[8], q[1];
// Hyperedge [8, 9]
cx q[8], q[9];
rz(-0.0421) q[9];
cx q[8], q[9];
// Hyperedge [1, 2, 3, 4, 5]
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
rz(-0.0084) q[5];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
// Hyperedge [0, 1, 5, 6, 7]
cx q[0], q[1];
cx q[1], q[5];
cx q[5], q[6];
cx q[6], q[7];
rz(-0.0084) q[7];
cx q[6], q[7];
cx q[5], q[6];
cx q[1], q[5];
cx q[0], q[1];
// Hyperedge [10, 2, 5, 7]
cx q[10], q[2];
cx q[2], q[5];
cx q[5], q[7];
rz(-0.0210) q[7];
cx q[5], q[7];
cx q[2], q[5];
cx q[10], q[2];
// Hyperedge [0, 9, 6]
cx q[0], q[9];
cx q[9], q[6];
rz(-0.0281) q[6];
cx q[9], q[6];
cx q[0], q[9];
// Hyperedge [0, 1, 4, 5, 6]
cx q[0], q[1];
cx q[1], q[4];
cx q[4], q[5];
cx q[5], q[6];
rz(-0.0084) q[6];
cx q[5], q[6];
cx q[4], q[5];
cx q[1], q[4];
cx q[0], q[1];
// Hyperedge [1, 4, 5, 6, 9]
cx q[1], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[9];
rz(-0.0084) q[9];
cx q[6], q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[1], q[4];
// Hyperedge [1, 2, 4, 6, 7]
cx q[1], q[2];
cx q[2], q[4];
cx q[4], q[6];
cx q[6], q[7];
rz(-0.0084) q[7];
cx q[6], q[7];
cx q[4], q[6];
cx q[2], q[4];
cx q[1], q[2];
// Hyperedge [3, 2, 10, 6]
cx q[3], q[2];
cx q[2], q[10];
cx q[10], q[6];
rz(-0.0210) q[6];
cx q[10], q[6];
cx q[2], q[10];
cx q[3], q[2];
// Hyperedge [0, 9, 3]
cx q[0], q[9];
cx q[9], q[3];
rz(-0.0281) q[3];
cx q[9], q[3];
cx q[0], q[9];
// Hyperedge [1, 3, 9]
cx q[1], q[3];
cx q[3], q[9];
rz(-0.0281) q[9];
cx q[3], q[9];
cx q[1], q[3];
// Hyperedge [8, 0]
cx q[8], q[0];
rz(-0.0421) q[0];
cx q[8], q[0];
// Hyperedge [2, 3, 4, 5, 10]
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[10];
rz(-0.0084) q[10];
cx q[5], q[10];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
// Hyperedge [2, 3, 4, 7, 8]
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[7];
cx q[7], q[8];
rz(-0.0084) q[8];
cx q[7], q[8];
cx q[4], q[7];
cx q[3], q[4];
cx q[2], q[3];
// Hyperedge [9, 3, 5, 6]
cx q[9], q[3];
cx q[3], q[5];
cx q[5], q[6];
rz(-0.0210) q[6];
cx q[5], q[6];
cx q[3], q[5];
cx q[9], q[3];
// Mixer layer
h q[0];
rz(0.0842) q[0];
h q[0];
h q[1];
rz(0.0842) q[1];
h q[1];
h q[2];
rz(0.0842) q[2];
h q[2];
h q[3];
rz(0.0842) q[3];
h q[3];
h q[4];
rz(0.0842) q[4];
h q[4];
h q[5];
rz(0.0842) q[5];
h q[5];
h q[6];
rz(0.0842) q[6];
h q[6];
h q[7];
rz(0.0842) q[7];
h q[7];
h q[8];
rz(0.0842) q[8];
h q[8];
h q[9];
rz(0.0842) q[9];
h q[9];
h q[10];
rz(0.0842) q[10];
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