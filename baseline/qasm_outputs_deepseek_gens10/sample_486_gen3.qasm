OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

// Layer 2: Problem-specific entangling gates (matching constraints)
// Edge (0,5) - weight 6
cx q[0], q[5];
rz(0.5236) q[5];
cx q[0], q[5];

// Edge (0,8) - weight 18
cx q[0], q[8];
rz(1.5708) q[8];
cx q[0], q[8];

// Edge (1,6) - weight 6
cx q[1], q[6];
rz(0.5236) q[6];
cx q[1], q[6];

// Edge (2,7) - weight 5
cx q[2], q[7];
rz(0.4363) q[7];
cx q[2], q[7];

// Edge (2,12) - weight 19 (mapped to q[2] and q[7] due to 10 qubit limit)
cx q[2], q[7];
rz(1.6581) q[7];
cx q[2], q[7];

// Edge (3,8) - weight 7
cx q[3], q[8];
rz(0.6109) q[8];
cx q[3], q[8];

// Edge (3,5) - weight 13
cx q[3], q[5];
rz(1.1345) q[5];
cx q[3], q[5];

// Edge (4,9) - weight 1
cx q[4], q[9];
rz(0.0873) q[9];
cx q[4], q[9];

// Edge (4,5) - weight 14
cx q[4], q[5];
rz(1.2217) q[5];
cx q[4], q[5];

// Edge (4,8) - weight 12
cx q[4], q[8];
rz(1.0472) q[8];
cx q[4], q[8];

// Layer 3: Final parameterized rotations and measurement
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