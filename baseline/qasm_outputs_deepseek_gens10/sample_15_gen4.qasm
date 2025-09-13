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
// Problem unitary for vertex cover (edges: 0-3, 0-6, 1-2, 2-3, 2-6, 3-5, 3-6, 3-4, 5-6)
// Edge 0-3
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
// Edge 0-6
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];
// Edge 1-2
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
// Edge 2-3
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
// Edge 2-6
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];
// Edge 3-5
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];
// Edge 3-4
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];
// Edge 5-6
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];
// Mixing unitary layer 1
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
// Layer 2: Problem unitary
// Edge 0-3
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
// Edge 0-6
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];
// Edge 1-2
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
// Edge 2-3
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
// Edge 2-6
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];
// Edge 3-5
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];
// Edge 3-4
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];
// Edge 5-6
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];
// Mixing unitary layer 2
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
// Layer 3: Problem unitary
// Edge 0-3
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
// Edge 0-6
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];
// Edge 1-2
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
// Edge 2-3
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
// Edge 2-6
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];
// Edge 3-5
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];
// Edge 3-4
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];
// Edge 5-6
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];
// Final mixing
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];