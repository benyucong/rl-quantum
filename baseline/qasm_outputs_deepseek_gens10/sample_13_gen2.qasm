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
// Hyperedge [9,4,7]
ccx q[9], q[4], q[7];
rz(-0.042) q[7];
ccx q[9], q[4], q[7];
// Hyperedge [9,3,6,1]
ccx q[9], q[3], q[6];
ccx q[6], q[1], q[0];
rz(-0.031) q[0];
ccx q[6], q[1], q[0];
ccx q[9], q[3], q[6];
// Hyperedge [8,1,4,9]
ccx q[8], q[1], q[4];
ccx q[4], q[9], q[0];
rz(-0.029) q[0];
ccx q[4], q[9], q[0];
ccx q[8], q[1], q[4];
// Hyperedge [8,2,3,5]
ccx q[8], q[2], q[3];
ccx q[3], q[5], q[0];
rz(-0.033) q[0];
ccx q[3], q[5], q[0];
ccx q[8], q[2], q[3];
// Hyperedge [1,4,5,7]
ccx q[1], q[4], q[5];
ccx q[5], q[7], q[0];
rz(-0.028) q[0];
ccx q[5], q[7], q[0];
ccx q[1], q[4], q[5];
// Hyperedge [8,0,3,1]
ccx q[8], q[0], q[3];
ccx q[3], q[1], q[2];
rz(-0.035) q[2];
ccx q[3], q[1], q[2];
ccx q[8], q[0], q[3];
// Hyperedge [8,0,2,5]
ccx q[8], q[0], q[2];
ccx q[2], q[5], q[1];
rz(-0.032) q[1];
ccx q[2], q[5], q[1];
ccx q[8], q[0], q[2];
// Hyperedge [8,1,4,7]
ccx q[8], q[1], q[4];
ccx q[4], q[7], q[2];
rz(-0.027) q[2];
ccx q[4], q[7], q[2];
ccx q[8], q[1], q[4];
// Hyperedge [0,7]
cx q[0], q[7];
rz(-0.045) q[7];
cx q[0], q[7];
// Hyperedge [1,2,3]
ccx q[1], q[2], q[3];
rz(-0.038) q[3];
ccx q[1], q[2], q[3];
// Hyperedge [9,5]
cx q[9], q[5];
rz(-0.044) q[5];
cx q[9], q[5];
// Hyperedge [8,1,2,6]
ccx q[8], q[1], q[2];
ccx q[2], q[6], q[3];
rz(-0.030) q[3];
ccx q[2], q[6], q[3];
ccx q[8], q[1], q[2];
// Hyperedge [8,0,4,1]
ccx q[8], q[0], q[4];
ccx q[4], q[1], q[5];
rz(-0.034) q[5];
ccx q[4], q[1], q[5];
ccx q[8], q[0], q[4];
// Hyperedge [2,3,4,6,7]
ccx q[2], q[3], q[4];
ccx q[4], q[6], q[7];
ccx q[7], q[0], q[1];
rz(-0.026) q[1];
ccx q[7], q[0], q[1];
ccx q[4], q[6], q[7];
ccx q[2], q[3], q[4];
// Hyperedge [9,6,7]
ccx q[9], q[6], q[7];
rz(-0.041) q[7];
ccx q[9], q[6], q[7];
// Hyperedge [0,1,5,6]
ccx q[0], q[1], q[5];
ccx q[5], q[6], q[7];
rz(-0.036) q[7];
ccx q[5], q[6], q[7];
ccx q[0], q[1], q[5];
// Hyperedge [9,3,4]
ccx q[9], q[3], q[4];
rz(-0.039) q[4];
ccx q[9], q[3], q[4];
// Mixer layer
h q[0];
rz(0.084) q[0];
h q[0];
h q[1];
rz(0.084) q[1];
h q[1];
h q[2];
rz(0.084) q[2];
h q[2];
h q[3];
rz(0.084) q[3];
h q[3];
h q[4];
rz(0.084) q[4];
h q[4];
h q[5];
rz(0.084) q[5];
h q[5];
h q[6];
rz(0.084) q[6];
h q[6];
h q[7];
rz(0.084) q[7];
h q[7];
h q[8];
rz(0.084) q[8];
h q[8];
h q[9];
rz(0.084) q[9];
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