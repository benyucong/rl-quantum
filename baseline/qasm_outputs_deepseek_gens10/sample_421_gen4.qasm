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
// Hyperedge [9,5,7]
ccx q[9], q[5], q[7];
rz(-0.0421) q[7];
ccx q[9], q[5], q[7];
// Hyperedge [0,9,10,6]
ccx q[0], q[9], q[10];
ccx q[10], q[6], q[0];
rz(-0.0316) q[0];
ccx q[10], q[6], q[0];
ccx q[0], q[9], q[10];
// Hyperedge [0,1,3,4,7,9,10]
ccx q[0], q[1], q[3];
ccx q[3], q[4], q[7];
ccx q[7], q[9], q[10];
rz(-0.0184) q[10];
ccx q[7], q[9], q[10];
ccx q[3], q[4], q[7];
ccx q[0], q[1], q[3];
// Hyperedge [3,6,7]
ccx q[3], q[6], q[7];
rz(-0.0421) q[7];
ccx q[3], q[6], q[7];
// Hyperedge [0,1,4,5,7,8]
ccx q[0], q[1], q[4];
ccx q[4], q[5], q[7];
ccx q[7], q[8], q[0];
rz(-0.0263) q[0];
ccx q[7], q[8], q[0];
ccx q[4], q[5], q[7];
ccx q[0], q[1], q[4];
// Hyperedge [0,1,4,5,10]
ccx q[0], q[1], q[4];
ccx q[4], q[5], q[10];
rz(-0.0316) q[10];
ccx q[4], q[5], q[10];
ccx q[0], q[1], q[4];
// Hyperedge [1,2,3,7]
ccx q[1], q[2], q[3];
ccx q[3], q[7], q[1];
rz(-0.0316) q[1];
ccx q[3], q[7], q[1];
ccx q[1], q[2], q[3];
// Hyperedge [8,9]
cx q[8], q[9];
rz(-0.0526) q[9];
cx q[8], q[9];
// Hyperedge [0,2,6]
ccx q[0], q[2], q[6];
rz(-0.0421) q[6];
ccx q[0], q[2], q[6];
// Hyperedge [1,2,4,5,6,10]
ccx q[1], q[2], q[4];
ccx q[4], q[5], q[6];
ccx q[6], q[10], q[1];
rz(-0.0263) q[1];
ccx q[6], q[10], q[1];
ccx q[4], q[5], q[6];
ccx q[1], q[2], q[4];
// Hyperedge [0,2,4,5,10]
ccx q[0], q[2], q[4];
ccx q[4], q[5], q[10];
rz(-0.0316) q[10];
ccx q[4], q[5], q[10];
ccx q[0], q[2], q[4];
// Hyperedge [0,1,3,5,9]
ccx q[0], q[1], q[3];
ccx q[3], q[5], q[9];
rz(-0.0316) q[9];
ccx q[3], q[5], q[9];
ccx q[0], q[1], q[3];
// Hyperedge [0,8,4,6]
ccx q[0], q[8], q[4];
ccx q[4], q[6], q[0];
rz(-0.0316) q[0];
ccx q[4], q[6], q[0];
ccx q[0], q[8], q[4];
// Mixer layer
h q[0];
rz(0.1052) q[0];
h q[0];
h q[1];
rz(0.1052) q[1];
h q[1];
h q[2];
rz(0.1052) q[2];
h q[2];
h q[3];
rz(0.1052) q[3];
h q[3];
h q[4];
rz(0.1052) q[4];
h q[4];
h q[5];
rz(0.1052) q[5];
h q[5];
h q[6];
rz(0.1052) q[6];
h q[6];
h q[7];
rz(0.1052) q[7];
h q[7];
h q[8];
rz(0.1052) q[8];
h q[8];
h q[9];
rz(0.1052) q[9];
h q[9];
h q[10];
rz(0.1052) q[10];
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