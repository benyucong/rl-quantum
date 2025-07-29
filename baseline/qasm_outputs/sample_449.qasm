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
// Hyperedge [4,7]
cx q[4], q[7];
rz(0.7854) q[7];
cx q[4], q[7];
// Hyperedge [1,5]
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];
// Hyperedge [2,5]
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];
// Hyperedge [2,6]
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];
// Hyperedge [2,4]
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];
// Hyperedge [5,6]
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];
// Hyperedge [0,1]
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Hyperedge [1,6]
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];
// Hyperedge [3,7]
cx q[3], q[7];
rz(0.7854) q[7];
cx q[3], q[7];
// Hyperedge [3,5]
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];
// Hyperedge [0,4]
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
// Hyperedge [8,2]
cx q[8], q[2];
rz(0.7854) q[2];
cx q[8], q[2];
// Mixer layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
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