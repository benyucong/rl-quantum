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
// Hyperedge [9,3]
cx q[9], q[3];
rz(-0.0421) q[3];
cx q[9], q[3];
// Hyperedge [5,7]
cx q[5], q[7];
rz(-0.0387) q[7];
cx q[5], q[7];
// Hyperedge [1,3]
cx q[1], q[3];
rz(-0.0352) q[3];
cx q[1], q[3];
// Hyperedge [2,6]
cx q[2], q[6];
rz(-0.0395) q[6];
cx q[2], q[6];
// Hyperedge [0,3]
cx q[0], q[3];
rz(-0.0368) q[3];
cx q[0], q[3];
// Hyperedge [9,5]
cx q[9], q[5];
rz(-0.0413) q[5];
cx q[9], q[5];
// Hyperedge [1,2]
cx q[1], q[2];
rz(-0.0374) q[2];
cx q[1], q[2];
// Hyperedge [5,6]
cx q[5], q[6];
rz(-0.0402) q[6];
cx q[5], q[6];
// Hyperedge [1,4]
cx q[1], q[4];
rz(-0.0349) q[4];
cx q[1], q[4];
// Hyperedge [1,9]
cx q[1], q[9];
rz(-0.0432) q[9];
cx q[1], q[9];
// Hyperedge [0,7]
cx q[0], q[7];
rz(-0.0391) q[7];
cx q[0], q[7];
// Hyperedge [0,5]
cx q[0], q[5];
rz(-0.0376) q[5];
cx q[0], q[5];
// Hyperedge [2,4]
cx q[2], q[4];
rz(-0.0383) q[4];
cx q[2], q[4];
// Hyperedge [3,6]
cx q[3], q[6];
rz(-0.0417) q[6];
cx q[3], q[6];
// Hyperedge [8,0]
cx q[8], q[0];
rz(-0.0358) q[0];
cx q[8], q[0];
// Hyperedge [0,9]
cx q[0], q[9];
rz(-0.0425) q[9];
cx q[0], q[9];
// Hyperedge [2,7]
cx q[2], q[7];
rz(-0.0409) q[7];
cx q[2], q[7];
// Hyperedge [8,1]
cx q[8], q[1];
rz(-0.0365) q[1];
cx q[8], q[1];
// Hyperedge [9,7]
cx q[9], q[7];
rz(-0.0441) q[7];
cx q[9], q[7];
// Hyperedge [1,6]
cx q[1], q[6];
rz(-0.0398) q[6];
cx q[1], q[6];
// Hyperedge [8,2]
cx q[8], q[2];
rz(-0.0379) q[2];
cx q[8], q[2];
// Hyperedge [9,2]
cx q[9], q[2];
rz(-0.0428) q[2];
cx q[9], q[2];
// Mixer layer
h q[0];
rz(0.0842) q[0];
h q[0];
h q[1];
rz(0.0864) q[1];
h q[1];
h q[2];
rz(0.0856) q[2];
h q[2];
h q[3];
rz(0.0842) q[3];
h q[3];
h q[4];
rz(0.0766) q[4];
h q[4];
h q[5];
rz(0.0775) q[5];
h q[5];
h q[6];
rz(0.0812) q[6];
h q[6];
h q[7];
rz(0.0822) q[7];
h q[7];
h q[8];
rz(0.0730) q[8];
h q[8];
h q[9];
rz(0.0857) q[9];
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