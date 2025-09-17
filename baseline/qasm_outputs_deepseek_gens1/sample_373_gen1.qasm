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
// Apply cost Hamiltonian for hyperedges
// Hyperedge [0,4,6]
ccx q[0], q[4], q[6];
rz(0.7854) q[6];
ccx q[0], q[4], q[6];
// Hyperedge [9,4]
cx q[9], q[4];
rz(0.3927) q[4];
cx q[9], q[4];
// Hyperedge [2,7]
cx q[2], q[7];
rz(0.3927) q[7];
cx q[2], q[7];
// Hyperedge [0,2,5]
ccx q[0], q[2], q[5];
rz(0.7854) q[5];
ccx q[0], q[2], q[5];
// Hyperedge [8,11,6]
ccx q[8], q[11], q[6];
rz(0.7854) q[6];
ccx q[8], q[11], q[6];
// Hyperedge [0,9]
cx q[0], q[9];
rz(0.3927) q[9];
cx q[0], q[9];
// Hyperedge [0,11,6]
ccx q[0], q[11], q[6];
rz(0.7854) q[6];
ccx q[0], q[11], q[6];
// Hyperedge [3,1,11]
ccx q[3], q[1], q[11];
rz(0.7854) q[11];
ccx q[3], q[1], q[11];
// Hyperedge [5,7]
cx q[5], q[7];
rz(0.3927) q[7];
cx q[5], q[7];
// Hyperedge [8,9,3]
ccx q[8], q[9], q[3];
rz(0.7854) q[3];
ccx q[8], q[9], q[3];
// Hyperedge [11,4,7]
ccx q[11], q[4], q[7];
rz(0.7854) q[7];
ccx q[11], q[4], q[7];
// Hyperedge [1,10,6]
ccx q[1], q[10], q[6];
rz(0.7854) q[6];
ccx q[1], q[10], q[6];
// Hyperedge [9,2,3]
ccx q[9], q[2], q[3];
rz(0.7854) q[3];
ccx q[9], q[2], q[3];
// Hyperedge [0,3]
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];
// Hyperedge [0,1,7]
ccx q[0], q[1], q[7];
rz(0.7854) q[7];
ccx q[0], q[1], q[7];
// Hyperedge [8,3,7]
ccx q[8], q[3], q[7];
rz(0.7854) q[7];
ccx q[8], q[3], q[7];
// Hyperedge [2,5,6]
ccx q[2], q[5], q[6];
rz(0.7854) q[6];
ccx q[2], q[5], q[6];
// Hyperedge [9,6]
cx q[9], q[6];
rz(0.3927) q[6];
cx q[9], q[6];
// Hyperedge [2,3,4]
ccx q[2], q[3], q[4];
rz(0.7854) q[4];
ccx q[2], q[3], q[4];
// Hyperedge [0,1,11]
ccx q[0], q[1], q[11];
rz(0.7854) q[11];
ccx q[0], q[1], q[11];
// Hyperedge [10,5]
cx q[10], q[5];
rz(0.3927) q[5];
cx q[10], q[5];
// Hyperedge [1,10,11]
ccx q[1], q[10], q[11];
rz(0.7854) q[11];
ccx q[1], q[10], q[11];
// Hyperedge [2,10,3]
ccx q[2], q[10], q[3];
rz(0.7854) q[3];
ccx q[2], q[10], q[3];
// Hyperedge [8,11,5]
ccx q[8], q[11], q[5];
rz(0.7854) q[5];
ccx q[8], q[11], q[5];
// Apply mixer Hamiltonian
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
h q[8];
rz(1.5708) q[8];
h q[8];
h q[9];
rz(1.5708) q[9];
h q[9];
h q[10];
rz(1.5708) q[10];
h q[10];
h q[11];
rz(1.5708) q[11];
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