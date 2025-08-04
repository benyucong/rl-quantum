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
// Hyperedge [0,1,2,3,4,5,8]
ccx q[0], q[1], q[2];
ccx q[3], q[4], q[5];
cx q[2], q[8];
cx q[5], q[8];
rz(-0.025) q[8];
cx q[5], q[8];
cx q[2], q[8];
ccx q[3], q[4], q[5];
ccx q[0], q[1], q[2];
// Hyperedge [0,2,5,7]
ccx q[0], q[2], q[5];
cx q[5], q[7];
rz(-0.035) q[7];
cx q[5], q[7];
ccx q[0], q[2], q[5];
// Hyperedge [0,5,6]
cx q[0], q[5];
cx q[5], q[6];
rz(-0.045) q[6];
cx q[5], q[6];
cx q[0], q[5];
// Hyperedge [1,4,6,7]
ccx q[1], q[4], q[6];
cx q[6], q[7];
rz(-0.035) q[7];
cx q[6], q[7];
ccx q[1], q[4], q[6];
// Hyperedge [0,1,2,7,8]
ccx q[0], q[1], q[2];
ccx q[7], q[2], q[8];
rz(-0.025) q[8];
ccx q[7], q[2], q[8];
ccx q[0], q[1], q[2];
// Hyperedge [1,5,6,7]
ccx q[1], q[5], q[6];
cx q[6], q[7];
rz(-0.035) q[7];
cx q[6], q[7];
ccx q[1], q[5], q[6];
// Hyperedge [0,4,7]
cx q[0], q[4];
cx q[4], q[7];
rz(-0.045) q[7];
cx q[4], q[7];
cx q[0], q[4];
// Hyperedge [3,4,6,7]
ccx q[3], q[4], q[6];
cx q[6], q[7];
rz(-0.035) q[7];
cx q[6], q[7];
ccx q[3], q[4], q[6];
// Hyperedge [2,3,4,5,7,8]
ccx q[2], q[3], q[4];
ccx q[5], q[7], q[8];
rz(-0.02) q[8];
ccx q[5], q[7], q[8];
ccx q[2], q[3], q[4];
// Hyperedge [3,5,6,7]
ccx q[3], q[5], q[6];
cx q[6], q[7];
rz(-0.035) q[7];
cx q[6], q[7];
ccx q[3], q[5], q[6];
// Hyperedge [2,5,6,7,8]
ccx q[2], q[5], q[6];
ccx q[7], q[6], q[8];
rz(-0.025) q[8];
ccx q[7], q[6], q[8];
ccx q[2], q[5], q[6];
// Hyperedge [2,3,4,6]
ccx q[2], q[3], q[4];
cx q[4], q[6];
rz(-0.035) q[6];
cx q[4], q[6];
ccx q[2], q[3], q[4];
// Mixer layer
h q[0];
rz(0.05) q[0];
h q[0];
h q[1];
rz(0.05) q[1];
h q[1];
h q[2];
rz(0.05) q[2];
h q[2];
h q[3];
rz(0.05) q[3];
h q[3];
h q[4];
rz(0.05) q[4];
h q[4];
h q[5];
rz(0.05) q[5];
h q[5];
h q[6];
rz(0.05) q[6];
h q[6];
h q[7];
rz(0.05) q[7];
h q[7];
h q[8];
rz(0.05) q[8];
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