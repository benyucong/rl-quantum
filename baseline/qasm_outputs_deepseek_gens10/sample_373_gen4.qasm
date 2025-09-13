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
// Hyperedge [0,4,6]
cx q[0], q[4];
cx q[4], q[6];
rz(-0.0421) q[6];
cx q[4], q[6];
cx q[0], q[4];
// Hyperedge [9,4]
cx q[9], q[4];
rz(-0.0287) q[4];
cx q[9], q[4];
// Hyperedge [2,7]
cx q[2], q[7];
rz(-0.0287) q[7];
cx q[2], q[7];
// Hyperedge [0,2,5]
cx q[0], q[2];
cx q[2], q[5];
rz(-0.0421) q[5];
cx q[2], q[5];
cx q[0], q[2];
// Hyperedge [8,11,6]
cx q[8], q[11];
cx q[11], q[6];
rz(-0.0421) q[6];
cx q[11], q[6];
cx q[8], q[11];
// Hyperedge [0,9]
cx q[0], q[9];
rz(-0.0287) q[9];
cx q[0], q[9];
// Hyperedge [0,11,6]
cx q[0], q[11];
cx q[11], q[6];
rz(-0.0421) q[6];
cx q[11], q[6];
cx q[0], q[11];
// Hyperedge [3,1,11]
cx q[3], q[1];
cx q[1], q[11];
rz(-0.0421) q[11];
cx q[1], q[11];
cx q[3], q[1];
// Hyperedge [5,7]
cx q[5], q[7];
rz(-0.0287) q[7];
cx q[5], q[7];
// Hyperedge [8,9,3]
cx q[8], q[9];
cx q[9], q[3];
rz(-0.0421) q[3];
cx q[9], q[3];
cx q[8], q[9];
// Hyperedge [11,4,7]
cx q[11], q[4];
cx q[4], q[7];
rz(-0.0421) q[7];
cx q[4], q[7];
cx q[11], q[4];
// Hyperedge [1,10,6]
cx q[1], q[10];
cx q[10], q[6];
rz(-0.0421) q[6];
cx q[10], q[6];
cx q[1], q[10];
// Hyperedge [9,2,3]
cx q[9], q[2];
cx q[2], q[3];
rz(-0.0421) q[3];
cx q[2], q[3];
cx q[9], q[2];
// Hyperedge [0,3]
cx q[0], q[3];
rz(-0.0287) q[3];
cx q[0], q[3];
// Hyperedge [0,1,7]
cx q[0], q[1];
cx q[1], q[7];
rz(-0.0421) q[7];
cx q[1], q[7];
cx q[0], q[1];
// Hyperedge [8,3,7]
cx q[8], q[3];
cx q[3], q[7];
rz(-0.0421) q[7];
cx q[3], q[7];
cx q[8], q[3];
// Hyperedge [2,5,6]
cx q[2], q[5];
cx q[5], q[6];
rz(-0.0421) q[6];
cx q[5], q[6];
cx q[2], q[5];
// Hyperedge [9,6]
cx q[9], q[6];
rz(-0.0287) q[6];
cx q[9], q[6];
// Hyperedge [2,3,4]
cx q[2], q[3];
cx q[3], q[4];
rz(-0.0421) q[4];
cx q[3], q[4];
cx q[2], q[3];
// Hyperedge [0,1,11]
cx q[0], q[1];
cx q[1], q[11];
rz(-0.0421) q[11];
cx q[1], q[11];
cx q[0], q[1];
// Hyperedge [10,5]
cx q[10], q[5];
rz(-0.0287) q[5];
cx q[10], q[5];
// Hyperedge [1,10,11]
cx q[1], q[10];
cx q[10], q[11];
rz(-0.0421) q[11];
cx q[10], q[11];
cx q[1], q[10];
// Hyperedge [2,10,3]
cx q[2], q[10];
cx q[10], q[3];
rz(-0.0421) q[3];
cx q[10], q[3];
cx q[2], q[10];
// Hyperedge [8,11,5]
cx q[8], q[11];
cx q[11], q[5];
rz(-0.0421) q[5];
cx q[11], q[5];
cx q[8], q[11];
// Mixer layer
h q[0];
rz(0.0854) q[0];
h q[0];
h q[1];
rz(0.0854) q[1];
h q[1];
h q[2];
rz(0.0854) q[2];
h q[2];
h q[3];
rz(0.0854) q[3];
h q[3];
h q[4];
rz(0.0854) q[4];
h q[4];
h q[5];
rz(0.0854) q[5];
h q[5];
h q[6];
rz(0.0854) q[6];
h q[6];
h q[7];
rz(0.0854) q[7];
h q[7];
h q[8];
rz(0.0854) q[8];
h q[8];
h q[9];
rz(0.0854) q[9];
h q[9];
h q[10];
rz(0.0854) q[10];
h q[10];
h q[11];
rz(0.0854) q[11];
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