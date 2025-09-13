OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Hyperedge [0, 2, 4]
ccx q[0], q[2], q[4];
rz(-0.042) q[4];
ccx q[0], q[2], q[4];
// Hyperedge [1, 5]
cx q[1], q[5];
rz(-0.028) q[5];
cx q[1], q[5];
// Hyperedge [3, 5, 6]
ccx q[3], q[5], q[6];
rz(-0.035) q[6];
ccx q[3], q[5], q[6];
// Hyperedge [0, 3]
cx q[0], q[3];
rz(-0.025) q[3];
cx q[0], q[3];
// Hyperedge [1, 2, 3]
ccx q[1], q[2], q[3];
rz(-0.038) q[3];
ccx q[1], q[2], q[3];
// Hyperedge [0, 5]
cx q[0], q[5];
rz(-0.022) q[5];
cx q[0], q[5];
// Hyperedge [4, 7]
cx q[4], q[7];
rz(-0.020) q[7];
cx q[4], q[7];
// Hyperedge [2, 3, 5]
ccx q[2], q[3], q[5];
rz(-0.040) q[5];
ccx q[2], q[3], q[5];
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
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];