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
// Hyperedge [8,10,2]
ccx q[8], q[10], q[2];
rz(-0.042) q[2];
ccx q[8], q[10], q[2];
// Hyperedge [8,7]
cx q[8], q[7];
rz(-0.028) q[7];
cx q[8], q[7];
// Hyperedge [0,1,8]
ccx q[0], q[1], q[8];
rz(-0.042) q[8];
ccx q[0], q[1], q[8];
// Hyperedge [10,6,7]
ccx q[10], q[6], q[7];
rz(-0.042) q[7];
ccx q[10], q[6], q[7];
// Hyperedge [1,6]
cx q[1], q[6];
rz(-0.028) q[6];
cx q[1], q[6];
// Hyperedge [2,6,7]
ccx q[2], q[6], q[7];
rz(-0.042) q[7];
ccx q[2], q[6], q[7];
// Hyperedge [3,7]
cx q[3], q[7];
rz(-0.028) q[7];
cx q[3], q[7];
// Hyperedge [10,4]
cx q[10], q[4];
rz(-0.028) q[4];
cx q[10], q[4];
// Hyperedge [5,7]
cx q[5], q[7];
rz(-0.028) q[7];
cx q[5], q[7];
// Hyperedge [9,4]
cx q[9], q[4];
rz(-0.028) q[4];
cx q[9], q[4];
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
h q[10];
rz(0.084) q[10];
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