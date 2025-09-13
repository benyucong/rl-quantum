OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;
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
h q[12];
// Hyperedge [4,7,9,10,11]
ccx q[4], q[7], q[9];
ccx q[9], q[10], q[11];
rz(-0.042) q[11];
ccx q[9], q[10], q[11];
ccx q[4], q[7], q[9];
// Hyperedge [2,5,6,10,11,12]
ccx q[2], q[5], q[6];
ccx q[6], q[10], q[11];
ccx q[11], q[12], q[6];
rz(-0.035) q[6];
ccx q[11], q[12], q[6];
ccx q[6], q[10], q[11];
ccx q[2], q[5], q[6];
// Hyperedge [0,2,3,6,10,12]
ccx q[0], q[2], q[3];
ccx q[3], q[6], q[10];
ccx q[10], q[12], q[3];
rz(-0.038) q[3];
ccx q[10], q[12], q[3];
ccx q[3], q[6], q[10];
ccx q[0], q[2], q[3];
// Hyperedge [12,7]
cx q[12], q[7];
rz(-0.025) q[7];
cx q[12], q[7];
// Hyperedge [1,2,4,5,10,12]
ccx q[1], q[2], q[4];
ccx q[4], q[5], q[10];
ccx q[10], q[12], q[4];
rz(-0.036) q[4];
ccx q[10], q[12], q[4];
ccx q[4], q[5], q[10];
ccx q[1], q[2], q[4];
// Hyperedge [8,10,4]
ccx q[8], q[10], q[4];
rz(-0.028) q[4];
ccx q[8], q[10], q[4];
// Hyperedge [1,2,7,9,10]
ccx q[1], q[2], q[7];
ccx q[7], q[9], q[10];
rz(-0.032) q[10];
ccx q[7], q[9], q[10];
ccx q[1], q[2], q[7];
// Hyperedge [2,4,5,6,11]
ccx q[2], q[4], q[5];
ccx q[5], q[6], q[11];
rz(-0.034) q[11];
ccx q[5], q[6], q[11];
ccx q[2], q[4], q[5];
// Hyperedge [0,1,3,5,8]
ccx q[0], q[1], q[3];
ccx q[3], q[5], q[8];
rz(-0.031) q[8];
ccx q[3], q[5], q[8];
ccx q[0], q[1], q[3];
// Hyperedge [0,3,4,6,7,8]
ccx q[0], q[3], q[4];
ccx q[4], q[6], q[7];
ccx q[7], q[8], q[4];
rz(-0.037) q[4];
ccx q[7], q[8], q[4];
ccx q[4], q[6], q[7];
ccx q[0], q[3], q[4];
// Hyperedge [1,2,3,5,9,10]
ccx q[1], q[2], q[3];
ccx q[3], q[5], q[9];
ccx q[9], q[10], q[3];
rz(-0.039) q[3];
ccx q[9], q[10], q[3];
ccx q[3], q[5], q[9];
ccx q[1], q[2], q[3];
// Hyperedge [1,2,5,6,7,9]
ccx q[1], q[2], q[5];
ccx q[5], q[6], q[7];
ccx q[7], q[9], q[5];
rz(-0.040) q[5];
ccx q[7], q[9], q[5];
ccx q[5], q[6], q[7];
ccx q[1], q[2], q[5];
// Hyperedge [1,2,5,6,10]
ccx q[1], q[2], q[5];
ccx q[5], q[6], q[10];
rz(-0.033) q[10];
ccx q[5], q[6], q[10];
ccx q[1], q[2], q[5];
// Hyperedge [1,3,5,6,8,11]
ccx q[1], q[3], q[5];
ccx q[5], q[6], q[8];
ccx q[8], q[11], q[5];
rz(-0.041) q[5];
ccx q[8], q[11], q[5];
ccx q[5], q[6], q[8];
ccx q[1], q[3], q[5];
// Hyperedge [3,1,11,12]
ccx q[3], q[1], q[11];
ccx q[11], q[12], q[3];
rz(-0.029) q[3];
ccx q[11], q[12], q[3];
ccx q[3], q[1], q[11];
// Hyperedge [2,5,6,9,11,12]
ccx q[2], q[5], q[6];
ccx q[6], q[9], q[11];
ccx q[11], q[12], q[6];
rz(-0.043) q[6];
ccx q[11], q[12], q[6];
ccx q[6], q[9], q[11];
ccx q[2], q[5], q[6];
// Hyperedge [9,11,1]
ccx q[9], q[11], q[1];
rz(-0.026) q[1];
ccx q[9], q[11], q[1];
// Hyperedge [8,12]
cx q[8], q[12];
rz(-0.024) q[12];
cx q[8], q[12];
// Hyperedge [0,1,2,6,7]
ccx q[0], q[1], q[2];
ccx q[2], q[6], q[7];
rz(-0.030) q[7];
ccx q[2], q[6], q[7];
ccx q[0], q[1], q[2];
// Hyperedge [3,4,5,6,9]
ccx q[3], q[4], q[5];
ccx q[5], q[6], q[9];
rz(-0.035) q[9];
ccx q[5], q[6], q[9];
ccx q[3], q[4], q[5];
// Hyperedge [8,2]
cx q[8], q[2];
rz(-0.023) q[2];
cx q[8], q[2];
// Hyperedge [10,6,7]
ccx q[10], q[6], q[7];
rz(-0.027) q[7];
ccx q[10], q[6], q[7];
// Hyperedge [0,2,4,5,6,7]
ccx q[0], q[2], q[4];
ccx q[4], q[5], q[6];
ccx q[6], q[7], q[4];
rz(-0.042) q[4];
ccx q[6], q[7], q[4];
ccx q[4], q[5], q[6];
ccx q[0], q[2], q[4];
// Hyperedge [4,5,7,9,11]
ccx q[4], q[5], q[7];
ccx q[7], q[9], q[11];
rz(-0.038) q[11];
ccx q[7], q[9], q[11];
ccx q[4], q[5], q[7];
// Hyperedge [0,1,2,4]
ccx q[0], q[1], q[2];
ccx q[2], q[4], q[0];
rz(-0.031) q[0];
ccx q[2], q[4], q[0];
ccx q[0], q[1], q[2];
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
h q[12];
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
c[12] = measure q[12];