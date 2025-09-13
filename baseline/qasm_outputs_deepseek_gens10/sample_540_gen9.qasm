OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;
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
h q[11];
// Hyperedge [8,10]
cx q[8], q[10];
rz(-0.0421) q[10];
cx q[8], q[10];
// Hyperedge [1,9]
cx q[1], q[9];
rz(-0.0387) q[9];
cx q[1], q[9];
// Hyperedge [9,10]
cx q[9], q[10];
rz(-0.0395) q[10];
cx q[9], q[10];
// Hyperedge [4,6]
cx q[4], q[6];
rz(-0.0412) q[6];
cx q[4], q[6];
// Hyperedge [1,2]
cx q[1], q[2];
rz(-0.0379) q[2];
cx q[1], q[2];
// Hyperedge [1,10]
cx q[1], q[10];
rz(-0.0382) q[10];
cx q[1], q[10];
// Hyperedge [8,6]
cx q[8], q[6];
rz(-0.0418) q[6];
cx q[8], q[6];
// Hyperedge [0,8]
cx q[0], q[8];
rz(-0.0431) q[8];
cx q[0], q[8];
// Hyperedge [0,1]
cx q[0], q[1];
rz(-0.0365) q[1];
cx q[0], q[1];
// Hyperedge [2,7]
cx q[2], q[7];
rz(-0.0403) q[7];
cx q[2], q[7];
// Hyperedge [3,6]
cx q[3], q[6];
rz(-0.0415) q[6];
cx q[3], q[6];
// Hyperedge [5,7]
cx q[5], q[7];
rz(-0.0407) q[7];
cx q[5], q[7];
// Hyperedge [8,7]
cx q[8], q[7];
rz(-0.0419) q[7];
cx q[8], q[7];
// Hyperedge [2,6]
cx q[2], q[6];
rz(-0.0409) q[6];
cx q[2], q[6];
// Hyperedge [8,2]
cx q[8], q[2];
rz(-0.0398) q[2];
cx q[8], q[2];
// Hyperedge [2,3]
cx q[2], q[3];
rz(-0.0392) q[3];
cx q[2], q[3];
// Hyperedge [4,5]
cx q[4], q[5];
rz(-0.0405) q[5];
cx q[4], q[5];
// Hyperedge [9,4]
cx q[9], q[4];
rz(-0.0399) q[4];
cx q[9], q[4];
// Hyperedge [0,5]
cx q[0], q[5];
rz(-0.0423) q[5];
cx q[0], q[5];
// Hyperedge [2,10]
cx q[2], q[10];
rz(-0.0391) q[10];
cx q[2], q[10];
// Hyperedge [1,11]
cx q[1], q[11];
rz(-0.0373) q[11];
cx q[1], q[11];
// Hyperedge [0,11]
cx q[0], q[11];
rz(-0.0429) q[11];
cx q[0], q[11];
// Hyperedge [2,5]
cx q[2], q[5];
rz(-0.0396) q[5];
cx q[2], q[5];
// Hyperedge [11,7]
cx q[11], q[7];
rz(-0.0410) q[7];
cx q[11], q[7];
// Hyperedge [0,3]
cx q[0], q[3];
rz(-0.0426) q[3];
cx q[0], q[3];
// Hyperedge [10,4]
cx q[10], q[4];
rz(-0.0401) q[4];
cx q[10], q[4];
// Hyperedge [9,5]
cx q[9], q[5];
rz(-0.0397) q[5];
cx q[9], q[5];
// Hyperedge [0,10]
cx q[0], q[10];
rz(-0.0424) q[10];
cx q[0], q[10];
// Hyperedge [0,4]
cx q[0], q[4];
rz(-0.0427) q[4];
cx q[0], q[4];
// Hyperedge [8,5]
cx q[8], q[5];
rz(-0.0416) q[5];
cx q[8], q[5];
// Hyperedge [11,6]
cx q[11], q[6];
rz(-0.0413) q[6];
cx q[11], q[6];
// Hyperedge [10,7]
cx q[10], q[7];
rz(-0.0408) q[7];
cx q[10], q[7];
// Hyperedge [8,3]
cx q[8], q[3];
rz(-0.0417) q[3];
cx q[8], q[3];
// Hyperedge [8,9]
cx q[8], q[9];
rz(-0.0414) q[9];
cx q[8], q[9];
// Mixer layer
h q[0];
rz(0.0848) q[0];
h q[0];
h q[1];
rz(0.0775) q[1];
h q[1];
h q[2];
rz(0.0796) q[2];
h q[2];
h q[3];
rz(0.0834) q[3];
h q[3];
h q[4];
rz(0.0841) q[4];
h q[4];
h q[5];
rz(0.0832) q[5];
h q[5];
h q[6];
rz(0.0837) q[6];
h q[6];
h q[7];
rz(0.0821) q[7];
h q[7];
h q[8];
rz(0.0850) q[8];
h q[8];
h q[9];
rz(0.0801) q[9];
h q[9];
h q[10];
rz(0.0828) q[10];
h q[10];
h q[11];
rz(0.0822) q[11];
h q[11];
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
c[11] = measure q[11];