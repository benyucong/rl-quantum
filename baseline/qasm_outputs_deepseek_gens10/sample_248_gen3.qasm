OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
// Layer 1: Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Layer 1: Problem unitary (edge constraints)
// Edge (0,4)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];
// Layer 1: Mixing unitary
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
// Layer 2: Problem unitary (edge constraints)
// Edge (0,4)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];
// Layer 2: Mixing unitary
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
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];