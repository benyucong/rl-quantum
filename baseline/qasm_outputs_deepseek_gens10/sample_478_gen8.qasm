OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Edge (0,1) with capacity 1
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (0,5) with capacity 4
cx q[0], q[5];
rz(1.5708) q[5];
cx q[0], q[5];

// Edge (1,5) with capacity 4
cx q[1], q[5];
rz(1.5708) q[5];
cx q[1], q[5];

// Edge (4,1) with capacity 1
cx q[4], q[1];
rz(0.7854) q[1];
cx q[4], q[1];

// Edge (4,5) with capacity 1
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Layer 2: Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Edge (0,1) with capacity 1
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge (0,5) with capacity 4
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];

// Edge (1,5) with capacity 4
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge (4,1) with capacity 1
cx q[4], q[1];
rz(0.3927) q[1];
cx q[4], q[1];

// Edge (4,5) with capacity 1
cx q[4], q[5];
rz(0.3927) q[5];
cx q[4], q[5];

// Layer 3: Final optimization and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Edge (0,1) with capacity 1
cx q[0], q[1];
rz(0.1963) q[1];
cx q[0], q[1];

// Edge (0,5) with capacity 4
cx q[0], q[5];
rz(0.3927) q[5];
cx q[0], q[5];

// Edge (1,5) with capacity 4
cx q[1], q[5];
rz(0.3927) q[5];
cx q[1], q[5];

// Edge (4,1) with capacity 1
cx q[4], q[1];
rz(0.1963) q[1];
cx q[4], q[1];

// Edge (4,5) with capacity 1
cx q[4], q[5];
rz(0.1963) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];