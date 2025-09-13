OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
// Layer 1 - Initialization and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Layer 2 - Problem Hamiltonian (edge constraints)
// Edge 0-1
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge 0-2
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
// Edge 0-3
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
// Edge 1-6
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];
// Edge 2-6
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];
// Edge 3-4
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];
// Edge 3-7
cx q[3], q[7];
rz(0.7854) q[7];
cx q[3], q[7];
// Edge 3-5
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];
// Edge 4-7
cx q[4], q[7];
rz(0.7854) q[7];
cx q[4], q[7];
// Layer 3 - Mixing Hamiltonian
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
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];