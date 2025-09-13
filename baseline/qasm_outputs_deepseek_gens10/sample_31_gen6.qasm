OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1: Problem-specific phase operations
// Edge (0,6) with capacity 1
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];

// Edge (0,8) with capacity 1
cx q[0], q[8];
rz(0.7854) q[8];
cx q[0], q[8];

// Edge (1,4) with capacity 3
cx q[1], q[4];
rz(2.3562) q[4];
cx q[1], q[4];

// Edge (1,5) with capacity 5
cx q[1], q[5];
rz(3.9270) q[5];
cx q[1], q[5];

// Edge (1,6) with capacity 1
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];

// Edge (1,7) with capacity 1
cx q[1], q[7];
rz(0.7854) q[7];
cx q[1], q[7];

// Edge (2,8) with capacity 5
cx q[2], q[8];
rz(3.9270) q[8];
cx q[2], q[8];

// Edge (3,2) with capacity 2
cx q[3], q[2];
rz(1.5708) q[2];
cx q[3], q[2];

// Edge (4,5) with capacity 1
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Edge (4,7) with capacity 5
cx q[4], q[7];
rz(3.9270) q[7];
cx q[4], q[7];

// Edge (6,5) with capacity 5
cx q[6], q[5];
rz(3.9270) q[5];
cx q[6], q[5];

// Edge (6,7) with capacity 2
cx q[6], q[7];
rz(1.5708) q[7];
cx q[6], q[7];

// Edge (7,3) with capacity 2
cx q[7], q[3];
rz(1.5708) q[3];
cx q[7], q[3];

// Edge (7,4) with capacity 2
cx q[7], q[4];
rz(1.5708) q[4];
cx q[7], q[4];

// Edge (7,5) with capacity 1
cx q[7], q[5];
rz(0.7854) q[5];
cx q[7], q[5];

// Layer 2: Mixing operations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2: Problem-specific phase operations (repeated)
// Edge (0,6) with capacity 1
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];

// Edge (0,8) with capacity 1
cx q[0], q[8];
rz(0.7854) q[8];
cx q[0], q[8];

// Edge (1,4) with capacity 3
cx q[1], q[4];
rz(2.3562) q[4];
cx q[1], q[4];

// Edge (1,5) with capacity 5
cx q[1], q[5];
rz(3.9270) q[5];
cx q[1], q[5];

// Edge (1,6) with capacity 1
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];

// Edge (1,7) with capacity 1
cx q[1], q[7];
rz(0.7854) q[7];
cx q[1], q[7];

// Edge (2,8) with capacity 5
cx q[2], q[8];
rz(3.9270) q[8];
cx q[2], q[8];

// Edge (3,2) with capacity 2
cx q[3], q[2];
rz(1.5708) q[2];
cx q[3], q[2];

// Edge (4,5) with capacity 1
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Edge (4,7) with capacity 5
cx q[4], q[7];
rz(3.9270) q[7];
cx q[4], q[7];

// Edge (6,5) with capacity 5
cx q[6], q[5];
rz(3.9270) q[5];
cx q[6], q[5];

// Edge (6,7) with capacity 2
cx q[6], q[7];
rz(1.5708) q[7];
cx q[6], q[7];

// Edge (7,3) with capacity 2
cx q[7], q[3];
rz(1.5708) q[3];
cx q[7], q[3];

// Edge (7,4) with capacity 2
cx q[7], q[4];
rz(1.5708) q[4];
cx q[7], q[4];

// Edge (7,5) with capacity 1
cx q[7], q[5];
rz(0.7854) q[5];
cx q[7], q[5];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];