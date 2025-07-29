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
// Hyperedge [0,1,3,4,5,6,7,8,9,11,12]
ccx q[0], q[1], q[11];
rz(0.1) q[11];
ccx q[0], q[1], q[11];
// Hyperedge [0,1,2,4,5,6,7,8,9,12]
ccx q[0], q[1], q[12];
rz(0.1) q[12];
ccx q[0], q[1], q[12];
// Hyperedge [10,5,7]
ccx q[10], q[5], q[7];
rz(0.1) q[7];
ccx q[10], q[5], q[7];
// Hyperedge [0,1,6,7,9,10]
ccx q[0], q[1], q[10];
rz(0.1) q[10];
ccx q[0], q[1], q[10];
// Hyperedge [0,1,2,3,4,5,8,9,10,11,12]
ccx q[0], q[1], q[12];
rz(0.1) q[12];
ccx q[0], q[1], q[12];
// Hyperedge [1,4,5,6,8,9,10,11,12]
ccx q[1], q[4], q[12];
rz(0.1) q[12];
ccx q[1], q[4], q[12];
// Hyperedge [0,1,2,6,10,11]
ccx q[0], q[1], q[11];
rz(0.1) q[11];
ccx q[0], q[1], q[11];
// Hyperedge [1,2,4,6,9,11]
ccx q[1], q[2], q[11];
rz(0.1) q[11];
ccx q[1], q[2], q[11];
// Hyperedge [0,1,4,5,6,9,10,11,12]
ccx q[0], q[1], q[12];
rz(0.1) q[12];
ccx q[0], q[1], q[12];
// Hyperedge [4,6,7,9,10]
ccx q[4], q[6], q[10];
rz(0.1) q[10];
ccx q[4], q[6], q[10];
// Hyperedge [9,10,2,6]
ccx q[9], q[10], q[6];
rz(0.1) q[6];
ccx q[9], q[10], q[6];
// Hyperedge [11,2,3,6]
ccx q[11], q[2], q[6];
rz(0.1) q[6];
ccx q[11], q[2], q[6];
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