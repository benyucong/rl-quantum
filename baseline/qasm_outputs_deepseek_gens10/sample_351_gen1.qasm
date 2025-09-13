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
// Hyperedge [10,4,6]
ccx q[10], q[4], q[6];
rz(-0.042) q[6];
ccx q[10], q[4], q[6];
// Hyperedge [2,6]
cx q[2], q[6];
rz(-0.028) q[6];
cx q[2], q[6];
// Hyperedge [8,9]
cx q[8], q[9];
rz(-0.028) q[9];
cx q[8], q[9];
// Hyperedge [3,10,2]
ccx q[3], q[10], q[2];
rz(-0.042) q[2];
ccx q[3], q[10], q[2];
// Hyperedge [11,1,3]
ccx q[11], q[1], q[3];
rz(-0.042) q[3];
ccx q[11], q[1], q[3];
// Hyperedge [8,6,7]
ccx q[8], q[6], q[7];
rz(-0.042) q[7];
ccx q[8], q[6], q[7];
// Hyperedge [9,2,11]
ccx q[9], q[2], q[11];
rz(-0.042) q[11];
ccx q[9], q[2], q[11];
// Hyperedge [8,2,11]
ccx q[8], q[2], q[11];
rz(-0.042) q[11];
ccx q[8], q[2], q[11];
// Hyperedge [3,6,7]
ccx q[3], q[6], q[7];
rz(-0.042) q[7];
ccx q[3], q[6], q[7];
// Hyperedge [5,6,7]
ccx q[5], q[6], q[7];
rz(-0.042) q[7];
ccx q[5], q[6], q[7];
// Hyperedge [1,11,4]
ccx q[1], q[11], q[4];
rz(-0.042) q[4];
ccx q[1], q[11], q[4];
// Hyperedge [1,10,7]
ccx q[1], q[10], q[7];
rz(-0.042) q[7];
ccx q[1], q[10], q[7];
// Hyperedge [0,3,11]
ccx q[0], q[3], q[11];
rz(-0.042) q[11];
ccx q[0], q[3], q[11];
// Hyperedge [9,6]
cx q[9], q[6];
rz(-0.028) q[6];
cx q[9], q[6];
// Hyperedge [0,11,5]
ccx q[0], q[11], q[5];
rz(-0.042) q[5];
ccx q[0], q[11], q[5];
// Hyperedge [3,11,5]
ccx q[3], q[11], q[5];
rz(-0.042) q[5];
ccx q[3], q[11], q[5];
// Hyperedge [8,1,3]
ccx q[8], q[1], q[3];
rz(-0.042) q[3];
ccx q[8], q[1], q[3];
// Hyperedge [10,11,5]
ccx q[10], q[11], q[5];
rz(-0.042) q[5];
ccx q[10], q[11], q[5];
// Hyperedge [2,5]
cx q[2], q[5];
rz(-0.028) q[5];
cx q[2], q[5];
// Hyperedge [0,9,10]
ccx q[0], q[9], q[10];
rz(-0.042) q[10];
ccx q[0], q[9], q[10];
// Hyperedge [11,6]
cx q[11], q[6];
rz(-0.028) q[6];
cx q[11], q[6];
// Hyperedge [0,1,9]
ccx q[0], q[1], q[9];
rz(-0.042) q[9];
ccx q[0], q[1], q[9];
// Hyperedge [9,3]
cx q[9], q[3];
rz(-0.028) q[3];
cx q[9], q[3];
// Hyperedge [1,10,6]
ccx q[1], q[10], q[6];
rz(-0.042) q[6];
ccx q[1], q[10], q[6];
// Hyperedge [8,1,6]
ccx q[8], q[1], q[6];
rz(-0.042) q[6];
ccx q[8], q[1], q[6];
// Hyperedge [1,3,7]
ccx q[1], q[3], q[7];
rz(-0.042) q[7];
ccx q[1], q[3], q[7];
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