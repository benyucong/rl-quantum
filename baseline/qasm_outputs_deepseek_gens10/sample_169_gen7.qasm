OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

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

// First mixing layer
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];

// First problem layer - edges with highest weights
// Edge (1,4) weight 20
cx q[1], q[4];
rz(0.6283) q[4];
cx q[1], q[4];

// Edge (2,7) weight 18
cx q[2], q[7];
rz(0.5655) q[7];
cx q[2], q[7];

// Edge (0,7) weight 20
cx q[0], q[7];
rz(0.6283) q[7];
cx q[0], q[7];

// Edge (2,4) weight 14
cx q[2], q[4];
rz(0.4398) q[4];
cx q[2], q[4];

// Edge (1,7) weight 14
cx q[1], q[7];
rz(0.4398) q[7];
cx q[1], q[7];

// Layer 2: Second mixing layer
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];
rz(1.5708) q[7];
rz(1.5708) q[8];

// Second problem layer - remaining edges
// Edge (0,4) weight 10
cx q[0], q[4];
rz(0.3142) q[4];
cx q[0], q[4];

// Edge (1,5) weight 10
cx q[1], q[5];
rz(0.3142) q[5];
cx q[1], q[5];

// Edge (3,7) weight 5
cx q[3], q[7];
rz(0.1571) q[7];
cx q[3], q[7];

// Edge (2,6) weight 1
cx q[2], q[6];
rz(0.0314) q[6];
cx q[2], q[6];

// Layer 3: Final mixing layer
rz(2.3562) q[0];
rz(2.3562) q[1];
rz(2.3562) q[2];
rz(2.3562) q[3];
rz(2.3562) q[4];
rz(2.3562) q[5];
rz(2.3562) q[6];
rz(2.3562) q[7];
rz(2.3562) q[8];

// Final Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];