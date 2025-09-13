OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
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
// Hyperedge [2,4,5]
cx q[2], q[4];
cx q[4], q[5];
rz(-0.0423) q[5];
cx q[4], q[5];
cx q[2], q[4];
// Hyperedge [8,2]
cx q[8], q[2];
rz(-0.0318) q[2];
cx q[8], q[2];
// Hyperedge [1,4,5]
cx q[1], q[4];
cx q[4], q[5];
rz(-0.0387) q[5];
cx q[4], q[5];
cx q[1], q[4];
// Hyperedge [0,2,5,7]
cx q[0], q[2];
cx q[2], q[5];
cx q[5], q[7];
rz(-0.0256) q[7];
cx q[5], q[7];
cx q[2], q[5];
cx q[0], q[2];
// Hyperedge [0,4,5,7]
cx q[0], q[4];
cx q[4], q[5];
cx q[5], q[7];
rz(-0.0271) q[7];
cx q[5], q[7];
cx q[4], q[5];
cx q[0], q[4];
// Hyperedge [1,7]
cx q[1], q[7];
rz(-0.0352) q[7];
cx q[1], q[7];
// Hyperedge [9,4]
cx q[9], q[4];
rz(-0.0339) q[4];
cx q[9], q[4];
// Hyperedge [8,3]
cx q[8], q[3];
rz(-0.0324) q[3];
cx q[8], q[3];
// Hyperedge [9,3]
cx q[9], q[3];
rz(-0.0341) q[3];
cx q[9], q[3];
// Hyperedge [3,4,5]
cx q[3], q[4];
cx q[4], q[5];
rz(-0.0298) q[5];
cx q[4], q[5];
cx q[3], q[4];
// Hyperedge [0,4,6]
cx q[0], q[4];
cx q[4], q[6];
rz(-0.0283) q[6];
cx q[4], q[6];
cx q[0], q[4];
// Hyperedge [8,1]
cx q[8], q[1];
rz(-0.0306) q[1];
cx q[8], q[1];
// Hyperedge [8,5,6,7]
cx q[8], q[5];
cx q[5], q[6];
cx q[6], q[7];
rz(-0.0227) q[7];
cx q[6], q[7];
cx q[5], q[6];
cx q[8], q[5];
// Hyperedge [4,5,6,7]
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];
rz(-0.0242) q[7];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
// Hyperedge [0,9,5,7]
cx q[0], q[9];
cx q[9], q[5];
cx q[5], q[7];
rz(-0.0235) q[7];
cx q[5], q[7];
cx q[9], q[5];
cx q[0], q[9];
// Hyperedge [1,2,4]
cx q[1], q[2];
cx q[2], q[4];
rz(-0.0279) q[4];
cx q[2], q[4];
cx q[1], q[2];
// Hyperedge [9,1,6]
cx q[9], q[1];
cx q[1], q[6];
rz(-0.0264) q[6];
cx q[1], q[6];
cx q[9], q[1];
// Hyperedge [0,2,6,7]
cx q[0], q[2];
cx q[2], q[6];
cx q[6], q[7];
rz(-0.0249) q[7];
cx q[6], q[7];
cx q[2], q[6];
cx q[0], q[2];
// Mixer layer
h q[0];
rz(0.085) q[0];
h q[0];
h q[1];
rz(0.085) q[1];
h q[1];
h q[2];
rz(0.085) q[2];
h q[2];
h q[3];
rz(0.085) q[3];
h q[3];
h q[4];
rz(0.085) q[4];
h q[4];
h q[5];
rz(0.085) q[5];
h q[5];
h q[6];
rz(0.085) q[6];
h q[6];
h q[7];
rz(0.085) q[7];
h q[7];
h q[8];
rz(0.085) q[8];
h q[8];
h q[9];
rz(0.085) q[9];
h q[9];
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