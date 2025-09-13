OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First cost function layer
// Edge (0,6) with capacity 2
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];

// Edge (1,3) with capacity 3
cx q[1], q[3];
rz(1.1781) q[3];
cx q[1], q[3];

// Edge (1,4) with capacity 3
cx q[1], q[4];
rz(1.1781) q[4];
cx q[1], q[4];

// Edge (1,7) with capacity 4
cx q[1], q[7];
rz(1.5708) q[7];
cx q[1], q[7];

// Edge (2,1) with capacity 6
cx q[2], q[1];
rz(2.3562) q[1];
cx q[2], q[1];

// Edge (2,5) with capacity 2
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Edge (2,7) with capacity 5
cx q[2], q[7];
rz(1.9635) q[7];
cx q[2], q[7];

// Edge (3,4) with capacity 4
cx q[3], q[4];
rz(1.5708) q[4];
cx q[3], q[4];

// Edge (4,1) with capacity 4
cx q[4], q[1];
rz(1.5708) q[1];
cx q[4], q[1];

// Edge (4,2) with capacity 5
cx q[4], q[2];
rz(1.9635) q[2];
cx q[4], q[2];

// Edge (4,7) with capacity 5
cx q[4], q[7];
rz(1.9635) q[7];
cx q[4], q[7];

// Edge (5,4) with capacity 7
cx q[5], q[4];
rz(2.7489) q[4];
cx q[5], q[4];

// Edge (5,6) with capacity 3
cx q[5], q[6];
rz(1.1781) q[6];
cx q[5], q[6];

// Edge (6,4) with capacity 2
cx q[6], q[4];
rz(0.7854) q[4];
cx q[6], q[4];

// First mixing layer
h q[0];
rz(0.5236) q[0];
h q[0];
h q[1];
rz(0.5236) q[1];
h q[1];
h q[2];
rz(0.5236) q[2];
h q[2];
h q[3];
rz(0.5236) q[3];
h q[3];
h q[4];
rz(0.5236) q[4];
h q[4];
h q[5];
rz(0.5236) q[5];
h q[5];
h q[6];
rz(0.5236) q[6];
h q[6];
h q[7];
rz(0.5236) q[7];
h q[7];

// Layer 2: Second cost function
// Edge (0,6) with capacity 2
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];

// Edge (1,3) with capacity 3
cx q[1], q[3];
rz(1.1781) q[3];
cx q[1], q[3];

// Edge (1,4) with capacity 3
cx q[1], q[4];
rz(1.1781) q[4];
cx q[1], q[4];

// Edge (1,7) with capacity 4
cx q[1], q[7];
rz(1.5708) q[7];
cx q[1], q[7];

// Edge (2,1) with capacity 6
cx q[2], q[1];
rz(2.3562) q[1];
cx q[2], q[1];

// Edge (2,5) with capacity 2
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Edge (2,7) with capacity 5
cx q[2], q[7];
rz(1.9635) q[7];
cx q[2], q[7];

// Edge (3,4) with capacity 4
cx q[3], q[4];
rz(1.5708) q[4];
cx q[3], q[4];

// Edge (4,1) with capacity 4
cx q[4], q[1];
rz(1.5708) q[1];
cx q[4], q[1];

// Edge (4,2) with capacity 5
cx q[4], q[2];
rz(1.9635) q[2];
cx q[4], q[2];

// Edge (4,7) with capacity 5
cx q[4], q[7];
rz(1.9635) q[7];
cx q[4], q[7];

// Edge (5,4) with capacity 7
cx q[5], q[4];
rz(2.7489) q[4];
cx q[5], q[4];

// Edge (5,6) with capacity 3
cx q[5], q[6];
rz(1.1781) q[6];
cx q[5], q[6];

// Edge (6,4) with capacity 2
cx q[6], q[4];
rz(0.7854) q[4];
cx q[6], q[4];

// Second mixing layer
h q[0];
rz(0.5236) q[0];
h q[0];
h q[1];
rz(0.5236) q[1];
h q[1];
h q[2];
rz(0.5236) q[2];
h q[2];
h q[3];
rz(0.5236) q[3];
h q[3];
h q[4];
rz(0.5236) q[4];
h q[4];
h q[5];
rz(0.5236) q[5];
h q[5];
h q[6];
rz(0.5236) q[6];
h q[6];
h q[7];
rz(0.5236) q[7];
h q[7];

// Layer 3: Third cost function
// Edge (0,6) with capacity 2
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];

// Edge (1,3) with capacity 3
cx q[1], q[3];
rz(1.1781) q[3];
cx q[1], q[3];

// Edge (1,4) with capacity 3
cx q[1], q[4];
rz(1.1781) q[4];
cx q[1], q[4];

// Edge (1,7) with capacity 4
cx q[1], q[7];
rz(1.5708) q[7];
cx q[1], q[7];

// Edge (2,1) with capacity 6
cx q[2], q[1];
rz(2.3562) q[1];
cx q[2], q[1];

// Edge (2,5) with capacity 2
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Edge (2,7) with capacity 5
cx q[2], q[7];
rz(1.9635) q[7];
cx q[2], q[7];

// Edge (3,4) with capacity 4
cx q[3], q[4];
rz(1.5708) q[4];
cx q[3], q[4];

// Edge (4,1) with capacity 4
cx q[4], q[1];
rz(1.5708) q[1];
cx q[4], q[1];

// Edge (4,2) with capacity 5
cx q[4], q[2];
rz(1.9635) q[2];
cx q[4], q[2];

// Edge (4,7) with capacity 5
cx q[4], q[7];
rz(1.9635) q[7];
cx q[4], q[7];

// Edge (5,4) with capacity 7
cx q[5], q[4];
rz(2.7489) q[4];
cx q[5], q[4];

// Edge (5,6) with capacity 3
cx q[5], q[6];
rz(1.1781) q[6];
cx q[5], q[6];

// Edge (6,4) with capacity 2
cx q[6], q[4];
rz(0.7854) q[4];
cx q[6], q[4];

// Final mixing layer
h q[0];
rz(0.5236) q[0];
h q[0];
h q[1];
rz(0.5236) q[1];
h q[1];
h q[2];
rz(0.5236) q[2];
h q[2];
h q[3];
rz(0.5236) q[3];
h q[3];
h q[4];
rz(0.5236) q[4];
h q[4];
h q[5];
rz(0.5236) q[5];
h q[5];
h q[6];
rz(0.5236) q[6];
h q[6];
h q[7];
rz(0.5236) q[7];
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