OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initial Hadamard layer
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

// Problem unitary for hypermaxcut with optimal parameters
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
rz(-0.0352) q[10];
cx q[9], q[10];

// Hyperedge [4,6]
cx q[4], q[6];
rz(-0.0298) q[6];
cx q[4], q[6];

// Hyperedge [1,2]
cx q[1], q[2];
rz(-0.0415) q[2];
cx q[1], q[2];

// Hyperedge [1,10]
cx q[1], q[10];
rz(-0.0369) q[10];
cx q[1], q[10];

// Hyperedge [8,6]
cx q[8], q[6];
rz(-0.0334) q[6];
cx q[8], q[6];

// Hyperedge [0,8]
cx q[0], q[8];
rz(-0.0396) q[8];
cx q[0], q[8];

// Hyperedge [0,1]
cx q[0], q[1];
rz(-0.0442) q[1];
cx q[0], q[1];

// Hyperedge [2,7]
cx q[2], q[7];
rz(-0.0317) q[7];
cx q[2], q[7];

// Hyperedge [3,6]
cx q[3], q[6];
rz(-0.0283) q[6];
cx q[3], q[6];

// Hyperedge [5,7]
cx q[5], q[7];
rz(-0.0305) q[7];
cx q[5], q[7];

// Hyperedge [8,7]
cx q[8], q[7];
rz(-0.0328) q[7];
cx q[8], q[7];

// Hyperedge [2,6]
cx q[2], q[6];
rz(-0.0341) q[6];
cx q[2], q[6];

// Hyperedge [8,2]
cx q[8], q[2];
rz(-0.0374) q[2];
cx q[8], q[2];

// Hyperedge [2,3]
cx q[2], q[3];
rz(-0.0408) q[3];
cx q[2], q[3];

// Hyperedge [4,5]
cx q[4], q[5];
rz(-0.0276) q[5];
cx q[4], q[5];

// Hyperedge [9,4]
cx q[9], q[4];
rz(-0.0312) q[4];
cx q[9], q[4];

// Hyperedge [0,5]
cx q[0], q[5];
rz(-0.0359) q[5];
cx q[0], q[5];

// Hyperedge [2,10]
cx q[2], q[10];
rz(-0.0385) q[10];
cx q[2], q[10];

// Hyperedge [1,11]
cx q[1], q[11];
rz(-0.0428) q[11];
cx q[1], q[11];

// Hyperedge [0,11]
cx q[0], q[11];
rz(-0.0413) q[11];
cx q[0], q[11];

// Hyperedge [2,5]
cx q[2], q[5];
rz(-0.0337) q[5];
cx q[2], q[5];

// Hyperedge [11,7]
cx q[11], q[7];
rz(-0.0294) q[7];
cx q[11], q[7];

// Hyperedge [0,3]
cx q[0], q[3];
rz(-0.0366) q[3];
cx q[0], q[3];

// Hyperedge [10,4]
cx q[10], q[4];
rz(-0.0321) q[4];
cx q[10], q[4];

// Hyperedge [9,5]
cx q[9], q[5];
rz(-0.0289) q[5];
cx q[9], q[5];

// Hyperedge [0,10]
cx q[0], q[10];
rz(-0.0392) q[10];
cx q[0], q[10];

// Hyperedge [0,4]
cx q[0], q[4];
rz(-0.0348) q[4];
cx q[0], q[4];

// Hyperedge [8,5]
cx q[8], q[5];
rz(-0.0301) q[5];
cx q[8], q[5];

// Hyperedge [11,6]
cx q[11], q[6];
rz(-0.0272) q[6];
cx q[11], q[6];

// Hyperedge [10,7]
cx q[10], q[7];
rz(-0.0319) q[7];
cx q[10], q[7];

// Hyperedge [8,3]
cx q[8], q[3];
rz(-0.0378) q[3];
cx q[8], q[3];

// Hyperedge [8,9]
cx q[8], q[9];
rz(-0.0355) q[9];
cx q[8], q[9];

// Mixer unitary with optimal parameters
h q[0];
rz(0.0842) q[0];
h q[0];
h q[1];
rz(0.0774) q[1];
h q[1];
h q[2];
rz(0.0830) q[2];
h q[2];
h q[3];
rz(0.0756) q[3];
h q[3];
h q[4];
rz(0.0656) q[4];
h q[4];
h q[5];
rz(0.0718) q[5];
h q[5];
h q[6];
rz(0.0668) q[6];
h q[6];
h q[7];
rz(0.0638) q[7];
h q[7];
h q[8];
rz(0.0792) q[8];
h q[8];
h q[9];
rz(0.0710) q[9];
h q[9];
h q[10];
rz(0.0770) q[10];
h q[10];
h q[11];
rz(0.0856) q[11];
h q[11];

// Measurement
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