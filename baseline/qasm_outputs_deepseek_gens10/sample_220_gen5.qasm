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
// Hyperedge [0,4]
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
// Hyperedge [0,1,3]
cx q[0], q[1];
cx q[1], q[3];
rz(0.5236) q[3];
cx q[1], q[3];
cx q[0], q[1];
// Hyperedge [1,3,5]
cx q[1], q[3];
cx q[3], q[5];
rz(0.5236) q[5];
cx q[3], q[5];
cx q[1], q[3];
// Hyperedge [3,4,7]
cx q[3], q[4];
cx q[4], q[7];
rz(0.5236) q[7];
cx q[4], q[7];
cx q[3], q[4];
// Hyperedge [2,4,5]
cx q[2], q[4];
cx q[4], q[5];
rz(0.5236) q[5];
cx q[4], q[5];
cx q[2], q[4];
// Hyperedge [0,7]
cx q[0], q[7];
rz(0.7854) q[7];
cx q[0], q[7];
// Hyperedge [2,3,7]
cx q[2], q[3];
cx q[3], q[7];
rz(0.5236) q[7];
cx q[3], q[7];
cx q[2], q[3];
// Hyperedge [0,6]
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];
// Mixer layer
h q[0];
rz(1.5708) q[0];
h q[0];
h q[1];
rz(1.5708) q[1];
h q[1];
h q[2];
rz(1.5708) q[2];
h q[2];
h q[3];
rz(1.5708) q[3];
h q[3];
h q[4];
rz(1.5708) q[4];
h q[4];
h q[5];
rz(1.5708) q[5];
h q[5];
h q[6];
rz(1.5708) q[6];
h q[6];
h q[7];
rz(1.5708) q[7];
h q[7];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];