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
// Hyperedge [8,4]
ccx q[8], q[4], q[0];
rz(-0.0421) q[0];
ccx q[8], q[4], q[0];
// Hyperedge [9,2,5,1]
cccx q[9], q[2], q[5], q[1];
rz(-0.0158) q[1];
cccx q[9], q[2], q[5], q[1];
// Hyperedge [0,2,3]
ccx q[0], q[2], q[3];
rz(-0.0421) q[3];
ccx q[0], q[2], q[3];
// Hyperedge [0,2,4,6]
cccx q[0], q[2], q[4], q[6];
rz(-0.0158) q[6];
cccx q[0], q[2], q[4], q[6];
// Hyperedge [9,2,4]
ccx q[9], q[2], q[4];
rz(-0.0421) q[4];
ccx q[9], q[2], q[4];
// Hyperedge [8,9,2,3]
cccx q[8], q[9], q[2], q[3];
rz(-0.0158) q[3];
cccx q[8], q[9], q[2], q[3];
// Hyperedge [8,0,7]
ccx q[8], q[0], q[7];
rz(-0.0421) q[7];
ccx q[8], q[0], q[7];
// Hyperedge [8,2,6]
ccx q[8], q[2], q[6];
rz(-0.0421) q[6];
ccx q[8], q[2], q[6];
// Hyperedge [0,2,5]
ccx q[0], q[2], q[5];
rz(-0.0421) q[5];
ccx q[0], q[2], q[5];
// Hyperedge [8,0,6]
ccx q[8], q[0], q[6];
rz(-0.0421) q[6];
ccx q[8], q[0], q[6];
// Mixer layer
h q[0];
rz(0.0842) q[0];
h q[0];
h q[1];
rz(0.0842) q[1];
h q[1];
h q[2];
rz(0.0842) q[2];
h q[2];
h q[3];
rz(0.0842) q[3];
h q[3];
h q[4];
rz(0.0842) q[4];
h q[4];
h q[5];
rz(0.0842) q[5];
h q[5];
h q[6];
rz(0.0842) q[6];
h q[6];
h q[7];
rz(0.0842) q[7];
h q[7];
h q[8];
rz(0.0842) q[8];
h q[8];
h q[9];
rz(0.0842) q[9];
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