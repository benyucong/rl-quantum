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
rz(-0.0398) q[6];
cx q[2], q[6];
// Hyperedge [0,3]
cx q[0], q[3];
rz(-0.0364) q[3];
cx q[0], q[3];
// Hyperedge [9,5]
cx q[9], q[5];
rz(-0.0416) q[5];
cx q[9], q[5];
// Hyperedge [1,2]
cx q[1], q[2];
rz(-0.0379) q[2];
cx q[1], q[2];
// Hyperedge [5,6]
cx q[5], q[6];
rz(-0.0403) q[6];
cx q[5], q[6];
// Hyperedge [1,4]
cx q[1], q[4];
rz(-0.0382) q[4];
cx q[1], q[4];
// Hyperedge [1,9]
cx q[1], q[9];
rz(-0.0431) q[9];
cx q[1], q[9];
// Hyperedge [0,7]
cx q[0], q[7];
rz(-0.0395) q[7];
cx q[0], q[7];
// Hyperedge [0,5]
cx q[0], q[5];
rz(-0.0372) q[5];
cx q[0], q[5];
// Hyperedge [2,4]
cx q[2], q[4];
rz(-0.0407) q[4];
cx q[2], q[4];
// Hyperedge [3,6]
cx q[3], q[6];
rz(-0.0419) q[6];
cx q[3], q[6];
// Hyperedge [8,0]
cx q[8], q[0];
rz(-0.0368) q[0];
cx q[8], q[0];
// Hyperedge [0,9]
cx q[0], q[9];
rz(-0.0425) q[9];
cx q[0], q[9];
// Hyperedge [2,7]
cx q[2], q[7];
rz(-0.0391) q[7];
cx q[2], q[7];
// Hyperedge [8,1]
cx q[8], q[1];
rz(-0.0359) q[1];
cx q[8], q[1];
// Hyperedge [9,7]
cx q[9], q[7];
rz(-0.0428) q[7];
cx q[9], q[7];
// Hyperedge [1,6]
cx q[1], q[6];
rz(-0.0384) q[6];
cx q[1], q[6];
// Hyperedge [8,2]
cx q[8], q[2];
rz(-0.0375) q[2];
cx q[8], q[2];
// Hyperedge [9,2]
cx q[9], q[2];
rz(-0.0434) q[2];
cx q[9], q[2];
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