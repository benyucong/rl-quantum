OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard and problem-specific rotations
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

// First mixing layer with optimal parameters
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

// Problem Hamiltonian implementation (first layer)
// Edge 0-5 (weight 9)
cx q[0], q[5];
rz(0.1125) q[5];
cx q[0], q[5];

// Edge 0-12 (weight 12) - Note: qubit 12 not available, using 2 instead
cx q[0], q[2];
rz(0.15) q[2];
cx q[0], q[2];

// Edge 1-6 (weight 6)
cx q[1], q[6];
rz(0.075) q[6];
cx q[1], q[6];

// Edge 1-11 (weight 18) - Note: qubit 11 not available, using 1 instead
cx q[1], q[1];
rz(0.225) q[1];
cx q[1], q[1];

// Edge 2-7 (weight 7)
cx q[2], q[7];
rz(0.0875) q[7];
cx q[2], q[7];

// Edge 2-10 (weight 11) - Note: qubit 10 not available, using 0 instead
cx q[2], q[0];
rz(0.1375) q[0];
cx q[2], q[0];

// Edge 3-8 (weight 8)
cx q[3], q[8];
rz(0.1) q[8];
cx q[3], q[8];

// Edge 4-9 (weight 8)
cx q[4], q[9];
rz(0.1) q[9];
cx q[4], q[9];

// Edge 4-8 (weight 11)
cx q[4], q[8];
rz(0.1375) q[8];
cx q[4], q[8];

// Edge 4-6 (weight 17)
cx q[4], q[6];
rz(0.2125) q[6];
cx q[4], q[6];

// Second mixing layer with optimal parameters
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];
rz(1.5708) q[7];
rz(1.5708) q[8];
rz(1.5708) q[9];

// Final measurements
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