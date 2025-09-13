OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and parameterized rotations
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
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];
rz(0.7854) q[9];
rz(0.7854) q[10];
rz(0.7854) q[11];

// Layer 2: Edge constraints (1-2, 1-3, 2-3, 0-3)
// Edge 1-2
cx q[3], q[4];
rz(0.5236) q[4];
cx q[3], q[4];
cx q[3], q[5];
rz(0.5236) q[5];
cx q[3], q[5];

// Edge 1-3
cx q[3], q[6];
rz(0.5236) q[6];
cx q[3], q[6];
cx q[3], q[7];
rz(0.5236) q[7];
cx q[3], q[7];

// Edge 2-3
cx q[4], q[6];
rz(0.5236) q[6];
cx q[4], q[6];
cx q[4], q[7];
rz(0.5236) q[7];
cx q[4], q[7];
cx q[5], q[6];
rz(0.5236) q[6];
cx q[5], q[6];
cx q[5], q[7];
rz(0.5236) q[7];
cx q[5], q[7];

// Edge 0-3
cx q[0], q[6];
rz(0.5236) q[6];
cx q[0], q[6];
cx q[0], q[7];
rz(0.5236) q[7];
cx q[0], q[7];
cx q[1], q[6];
rz(0.5236) q[6];
cx q[1], q[6];
cx q[1], q[7];
rz(0.5236) q[7];
cx q[1], q[7];
cx q[2], q[6];
rz(0.5236) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(0.5236) q[7];
cx q[2], q[7];

// Layer 3: Mixing and optimization
rz(1.0472) q[0];
rz(1.0472) q[1];
rz(1.0472) q[2];
rz(1.0472) q[3];
rz(1.0472) q[4];
rz(1.0472) q[5];
rz(1.0472) q[6];
rz(1.0472) q[7];
rz(1.0472) q[8];
rz(1.0472) q[9];
rz(1.0472) q[10];
rz(1.0472) q[11];
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

// Layer 4: Final parameterized rotations and measurement
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];
rz(0.3927) q[8];
rz(0.3927) q[9];
rz(0.3927) q[10];
rz(0.3927) q[11];

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