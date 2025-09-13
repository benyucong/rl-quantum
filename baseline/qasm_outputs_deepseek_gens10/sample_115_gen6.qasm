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
// Hyperedge [0,4,6,7,8,10]
ccx q[0], q[4], q[6];
ccx q[6], q[7], q[8];
ccx q[8], q[10], q[11];
rz(-0.0421) q[11];
ccx q[8], q[10], q[11];
ccx q[6], q[7], q[8];
ccx q[0], q[4], q[6];
// Hyperedge [1,4,5,6,7]
ccx q[1], q[4], q[5];
ccx q[5], q[6], q[7];
rz(-0.0387) q[7];
ccx q[5], q[6], q[7];
ccx q[1], q[4], q[5];
// Hyperedge [1,2,4,5,6,9]
ccx q[1], q[2], q[4];
ccx q[4], q[5], q[6];
ccx q[6], q[9], q[10];
rz(-0.0352) q[10];
ccx q[6], q[9], q[10];
ccx q[4], q[5], q[6];
ccx q[1], q[2], q[4];
// Hyperedge [0,2,5,6,7,11]
ccx q[0], q[2], q[5];
ccx q[5], q[6], q[7];
ccx q[7], q[11], q[0];
rz(-0.0339) q[0];
ccx q[7], q[11], q[0];
ccx q[5], q[6], q[7];
ccx q[0], q[2], q[5];
// Hyperedge [2,3,4,7,8,9,11]
ccx q[2], q[3], q[4];
ccx q[4], q[7], q[8];
ccx q[8], q[9], q[11];
rz(-0.0298) q[11];
ccx q[8], q[9], q[11];
ccx q[4], q[7], q[8];
ccx q[2], q[3], q[4];
// Hyperedge [3,5,6,7,9,11]
ccx q[3], q[5], q[6];
ccx q[6], q[7], q[9];
ccx q[9], q[11], q[1];
rz(-0.0315) q[1];
ccx q[9], q[11], q[1];
ccx q[6], q[7], q[9];
ccx q[3], q[5], q[6];
// Hyperedge [1,2,3,5,6,7,8,9]
ccx q[1], q[2], q[3];
ccx q[3], q[5], q[6];
ccx q[6], q[7], q[8];
ccx q[8], q[9], q[10];
rz(-0.0264) q[10];
ccx q[8], q[9], q[10];
ccx q[6], q[7], q[8];
ccx q[3], q[5], q[6];
ccx q[1], q[2], q[3];
// Hyperedge [1,11,4]
ccx q[1], q[11], q[4];
rz(-0.0456) q[4];
ccx q[1], q[11], q[4];
// Hyperedge [0,4,7,8,11]
ccx q[0], q[4], q[7];
ccx q[7], q[8], q[11];
rz(-0.0372) q[11];
ccx q[7], q[8], q[11];
ccx q[0], q[4], q[7];
// Hyperedge [9,10,5,7]
ccx q[9], q[10], q[5];
ccx q[5], q[7], q[8];
rz(-0.0398) q[8];
ccx q[5], q[7], q[8];
ccx q[9], q[10], q[5];
// Hyperedge [0,2,5,7,8,10]
ccx q[0], q[2], q[5];
ccx q[5], q[7], q[8];
ccx q[8], q[10], q[11];
rz(-0.0327) q[11];
ccx q[8], q[10], q[11];
ccx q[5], q[7], q[8];
ccx q[0], q[2], q[5];
// Hyperedge [0,3,6,7,8,9,10]
ccx q[0], q[3], q[6];
ccx q[6], q[7], q[8];
ccx q[8], q[9], q[10];
rz(-0.0279) q[10];
ccx q[8], q[9], q[10];
ccx q[6], q[7], q[8];
ccx q[0], q[3], q[6];
// Hyperedge [1,10,11,9]
ccx q[1], q[10], q[11];
ccx q[11], q[9], q[0];
rz(-0.0413) q[0];
ccx q[11], q[9], q[0];
ccx q[1], q[10], q[11];
// Hyperedge [0,3,5]
ccx q[0], q[3], q[5];
rz(-0.0489) q[5];
ccx q[0], q[3], q[5];
// Hyperedge [0,2,3,4,6,8,9,10]
ccx q[0], q[2], q[3];
ccx q[3], q[4], q[6];
ccx q[6], q[8], q[9];
ccx q[9], q[10], q[11];
rz(-0.0246) q[11];
ccx q[9], q[10], q[11];
ccx q[6], q[8], q[9];
ccx q[3], q[4], q[6];
ccx q[0], q[2], q[3];
// Hyperedge [2,3,5,6,8,10]
ccx q[2], q[3], q[5];
ccx q[5], q[6], q[8];
ccx q[8], q[10], q[11];
rz(-0.0304) q[11];
ccx q[8], q[10], q[11];
ccx q[5], q[6], q[8];
ccx q[2], q[3], q[5];
// Hyperedge [0,4,5,6,7,9,11]
ccx q[0], q[4], q[5];
ccx q[5], q[6], q[7];
ccx q[7], q[9], q[11];
rz(-0.0283) q[11];
ccx q[7], q[9], q[11];
ccx q[5], q[6], q[7];
ccx q[0], q[4], q[5];
// Hyperedge [0,3,4,7,9,11]
ccx q[0], q[3], q[4];
ccx q[4], q[7], q[9];
ccx q[9], q[11], q[1];
rz(-0.0341) q[1];
ccx q[9], q[11], q[1];
ccx q[4], q[7], q[9];
ccx q[0], q[3], q[4];
// Hyperedge [1,2,4,5,8]
ccx q[1], q[2], q[4];
ccx q[4], q[5], q[8];
rz(-0.0407) q[8];
ccx q[4], q[5], q[8];
ccx q[1], q[2], q[4];
// Hyperedge [1,3,6,7,10,11]
ccx q[1], q[3], q[6];
ccx q[6], q[7], q[10];
ccx q[10], q[11], q[2];
rz(-0.0318) q[2];
ccx q[10], q[11], q[2];
ccx q[6], q[7], q[10];
ccx q[1], q[3], q[6];
// Hyperedge [2,5,6,8,9,10,11]
ccx q[2], q[5], q[6];
ccx q[6], q[8], q[9];
ccx q[9], q[10], q[11];
rz(-0.0257) q[11];
ccx q[9], q[10], q[11];
ccx q[6], q[8], q[9];
ccx q[2], q[5], q[6];
// Hyperedge [3,4,6,7,9]
ccx q[3], q[4], q[6];
ccx q[6], q[7], q[9];
rz(-0.0365) q[9];
ccx q[6], q[7], q[9];
ccx q[3], q[4], q[6];
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