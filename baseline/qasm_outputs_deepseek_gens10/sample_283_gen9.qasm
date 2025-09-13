OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Hyperedge [0,1,3,4,5,6,7,8]
cccz q[0], q[1], q[3], q[4];
cccz q[4], q[5], q[6], q[7];
cccz q[7], q[8], q[0], q[1];
rz(0.1273) q[8];
cccz q[7], q[8], q[0], q[1];
cccz q[4], q[5], q[6], q[7];
cccz q[0], q[1], q[3], q[4];
// Hyperedge [2,5,6,7,8]
cccz q[2], q[5], q[6], q[7];
cccz q[7], q[8], q[2], q[5];
rz(0.1273) q[8];
cccz q[7], q[8], q[2], q[5];
cccz q[2], q[5], q[6], q[7];
// Hyperedge [0,2,6,7,8]
cccz q[0], q[2], q[6], q[7];
cccz q[7], q[8], q[0], q[2];
rz(0.1273) q[8];
cccz q[7], q[8], q[0], q[2];
cccz q[0], q[2], q[6], q[7];
// Hyperedge [0,1,2,3,8]
cccz q[0], q[1], q[2], q[3];
cccz q[3], q[8], q[0], q[1];
rz(0.1273) q[8];
cccz q[3], q[8], q[0], q[1];
cccz q[0], q[1], q[2], q[3];
// Hyperedge [0,2,3,4,5,7,8]
cccz q[0], q[2], q[3], q[4];
cccz q[4], q[5], q[7], q[8];
cccz q[8], q[0], q[2], q[3];
rz(0.1273) q[8];
cccz q[8], q[0], q[2], q[3];
cccz q[4], q[5], q[7], q[8];
cccz q[0], q[2], q[3], q[4];
// Hyperedge [2,3,4,6,7,8]
cccz q[2], q[3], q[4], q[6];
cccz q[6], q[7], q[8], q[2];
rz(0.1273) q[8];
cccz q[6], q[7], q[8], q[2];
cccz q[2], q[3], q[4], q[6];
// Hyperedge [1,2,4]
ccx q[1], q[2], q[4];
rz(0.1273) q[4];
ccx q[1], q[2], q[4];
// Hyperedge [0,1,2,3,6,7]
cccz q[0], q[1], q[2], q[3];
cccz q[3], q[6], q[7], q[0];
rz(0.1273) q[7];
cccz q[3], q[6], q[7], q[0];
cccz q[0], q[1], q[2], q[3];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];