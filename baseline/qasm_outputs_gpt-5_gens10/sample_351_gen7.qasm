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

// Applying controlled rotations based on hyperedges
// Hyperedges: [10, 4, 6], [2, 6], [8, 9], [3, 10, 2], 
// [11, 1, 3], [8, 6, 7], [9, 2, 11], [8, 2, 11], 
// [3, 6, 7], [5, 6, 7], [1, 11, 4], [1, 10, 7], 
// [0, 3, 11], [9, 6], [0, 11, 5], [3, 11, 5], 
// [8, 1, 3], [10, 11, 5], [2, 5], [0, 9, 10], 
// [11, 6], [0, 1, 9], [9, 3], [1, 10, 6], 
// [8, 1, 6], [1, 3, 7]

cx q[10], q[4];
rz(-0.5) q[4];
cx q[10], q[4];
cx q[2], q[6];
rz(-0.5) q[6];
cx q[2], q[6];
cx q[8], q[9];
rz(-0.5) q[9];
cx q[8], q[9];
cx q[3], q[10];
rz(-0.5) q[10];
cx q[3], q[10];
cx q[11], q[1];
rz(-0.5) q[1];
cx q[11], q[1];
cx q[8], q[6];
rz(-0.5) q[6];
cx q[8], q[6];
cx q[9], q[2];
rz(-0.5) q[2];
cx q[9], q[2];
cx q[8], q[2];
rz(-0.5) q[2];
cx q[8], q[2];
cx q[3], q[6];
rz(-0.5) q[6];
cx q[3], q[6];
cx q[5], q[6];
rz(-0.5) q[6];
cx q[5], q[6];
cx q[1], q[11];
rz(-0.5) q[11];
cx q[1], q[11];
cx q[1], q[10];
rz(-0.5) q[10];
cx q[1], q[10];
cx q[0], q[3];
rz(-0.5) q[3];
cx q[0], q[3];
cx q[9], q[6];
rz(-0.5) q[6];
cx q[9], q[6];
cx q[0], q[11];
rz(-0.5) q[11];
cx q[0], q[11];
cx q[3], q[11];
rz(-0.5) q[11];
cx q[3], q[11];
cx q[8], q[1];
rz(-0.5) q[1];
cx q[8], q[1];
cx q[10], q[11];
rz(-0.5) q[11];
cx q[10], q[11];
ccx q[2], q[5], q[6];
dsz(-0.5) q[5];
ccx q[2], q[5], q[6];
cx q[0], q[9];
rz(0.5) q[9];
cx q[0], q[9];
cx q[10], q[11];
rz(0.5) q[11];
cx q[10], q[11];

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