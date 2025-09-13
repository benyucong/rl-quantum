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
// Hyperedge [9, 11, 5]
ccx q[9], q[11], q[5];
rz(-0.0421) q[5];
ccx q[9], q[11], q[5];
// Hyperedge [0, 10]
cx q[0], q[10];
rz(-0.0632) q[10];
cx q[0], q[10];
// Hyperedge [8, 2, 7]
ccx q[8], q[2], q[7];
rz(-0.0421) q[7];
ccx q[8], q[2], q[7];
// Hyperedge [9, 7]
cx q[9], q[7];
rz(-0.0632) q[7];
cx q[9], q[7];
// Hyperedge [6, 7]
cx q[6], q[7];
rz(-0.0632) q[7];
cx q[6], q[7];
// Hyperedge [1, 3, 4]
ccx q[1], q[3], q[4];
rz(-0.0421) q[4];
ccx q[1], q[3], q[4];
// Hyperedge [8, 4, 5]
ccx q[8], q[4], q[5];
rz(-0.0421) q[5];
ccx q[8], q[4], q[5];
// Hyperedge [2, 3]
cx q[2], q[3];
rz(-0.0632) q[3];
cx q[2], q[3];
// Hyperedge [9, 2, 11]
ccx q[9], q[2], q[11];
rz(-0.0421) q[11];
ccx q[9], q[2], q[11];
// Hyperedge [1, 10, 5]
ccx q[1], q[10], q[5];
rz(-0.0421) q[5];
ccx q[1], q[10], q[5];
// Hyperedge [8, 1, 5]
ccx q[8], q[1], q[5];
rz(-0.0421) q[5];
ccx q[8], q[1], q[5];
// Hyperedge [0, 1, 2]
ccx q[0], q[1], q[2];
rz(-0.0421) q[2];
ccx q[0], q[1], q[2];
// Hyperedge [1, 6]
cx q[1], q[6];
rz(-0.0632) q[6];
cx q[1], q[6];
// Hyperedge [1, 10, 3]
ccx q[1], q[10], q[3];
rz(-0.0421) q[3];
ccx q[1], q[10], q[3];
// Hyperedge [0, 9, 4]
ccx q[0], q[9], q[4];
rz(-0.0421) q[4];
ccx q[0], q[9], q[4];
// Hyperedge [0, 11, 4]
ccx q[0], q[11], q[4];
rz(-0.0421) q[4];
ccx q[0], q[11], q[4];
// Hyperedge [2, 10, 4]
ccx q[2], q[10], q[4];
rz(-0.0421) q[4];
ccx q[2], q[10], q[4];
// Hyperedge [4, 7]
cx q[4], q[7];
rz(-0.0632) q[7];
cx q[4], q[7];
// Hyperedge [3, 5]
cx q[3], q[5];
rz(-0.0632) q[5];
cx q[3], q[5];
// Hyperedge [0, 5]
cx q[0], q[5];
rz(-0.0632) q[5];
cx q[0], q[5];
// Hyperedge [9, 6]
cx q[9], q[6];
rz(-0.0632) q[6];
cx q[9], q[6];
// Hyperedge [8, 11]
cx q[8], q[11];
rz(-0.0632) q[11];
cx q[8], q[11];
// Hyperedge [1, 11]
cx q[1], q[11];
rz(-0.0632) q[11];
cx q[1], q[11];
h q[0];
rz(0.1264) q[0];
h q[0];
h q[1];
rz(0.1264) q[1];
h q[1];
h q[2];
rz(0.1264) q[2];
h q[2];
h q[3];
rz(0.1264) q[3];
h q[3];
h q[4];
rz(0.1264) q[4];
h q[4];
h q[5];
rz(0.1264) q[5];
h q[5];
h q[6];
rz(0.1264) q[6];
h q[6];
h q[7];
rz(0.1264) q[7];
h q[7];
h q[8];
rz(0.1264) q[8];
h q[8];
h q[9];
rz(0.1264) q[9];
h q[9];
h q[10];
rz(0.1264) q[10];
h q[10];
h q[11];
rz(0.1264) q[11];
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