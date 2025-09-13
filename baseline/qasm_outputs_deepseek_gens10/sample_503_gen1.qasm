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
// Hyperedge [0,3,4,5,6,10]
cccz q[0], q[3], q[4], q[5];
cccz q[5], q[6], q[10], q[0];
rz(0.0421) q[0];
cccz q[5], q[6], q[10], q[0];
cccz q[0], q[3], q[4], q[5];
// Hyperedge [1,10,3,6]
cccz q[1], q[10], q[3], q[6];
rz(0.0358) q[6];
cccz q[1], q[10], q[3], q[6];
// Hyperedge [5,6,7,9,10]
cccz q[5], q[6], q[7], q[9];
cccz q[9], q[10], q[5], q[6];
rz(0.0389) q[6];
cccz q[9], q[10], q[5], q[6];
cccz q[5], q[6], q[7], q[9];
// Hyperedge [0,4,7,8,9]
cccz q[0], q[4], q[7], q[8];
cccz q[8], q[9], q[0], q[4];
rz(0.0367) q[4];
cccz q[8], q[9], q[0], q[4];
cccz q[0], q[4], q[7], q[8];
// Hyperedge [1,6,7,8,9,10]
cccz q[1], q[6], q[7], q[8];
cccz q[8], q[9], q[10], q[1];
cccz q[1], q[6], q[7], q[8];
rz(0.0415) q[8];
cccz q[1], q[6], q[7], q[8];
cccz q[8], q[9], q[10], q[1];
cccz q[1], q[6], q[7], q[8];
// Hyperedge [0,1,2,4,7,8]
cccz q[0], q[1], q[2], q[4];
cccz q[4], q[7], q[8], q[0];
cccz q[0], q[1], q[2], q[4];
rz(0.0432) q[4];
cccz q[0], q[1], q[2], q[4];
cccz q[4], q[7], q[8], q[0];
cccz q[0], q[1], q[2], q[4];
// Hyperedge [2,4,5,6,9]
cccz q[2], q[4], q[5], q[6];
cccz q[6], q[9], q[2], q[4];
rz(0.0374) q[4];
cccz q[6], q[9], q[2], q[4];
cccz q[2], q[4], q[5], q[6];
// Hyperedge [0,1,4,7,10]
cccz q[0], q[1], q[4], q[7];
cccz q[7], q[10], q[0], q[1];
rz(0.0398) q[1];
cccz q[7], q[10], q[0], q[1];
cccz q[0], q[1], q[4], q[7];
// Hyperedge [8,9,3,1]
cccz q[8], q[9], q[3], q[1];
rz(0.0331) q[1];
cccz q[8], q[9], q[3], q[1];
// Hyperedge [0,2,4,6,8]
cccz q[0], q[2], q[4], q[6];
cccz q[6], q[8], q[0], q[2];
rz(0.0406) q[2];
cccz q[6], q[8], q[0], q[2];
cccz q[0], q[2], q[4], q[6];
// Hyperedge [9,2,3]
ccz q[9], q[2], q[3];
rz(0.0315) q[3];
ccz q[9], q[2], q[3];
// Hyperedge [10,2]
cz q[10], q[2];
rz(0.0287) q[2];
cz q[10], q[2];
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