OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialization and first parameterized rotations
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

// Edge (0,1) with capacity 5
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge (0,3) with capacity 2
rz(0.3927) q[0];
rz(0.3927) q[3];
cx q[0], q[3];
rz(0.1963) q[3];
cx q[0], q[3];

// Edge (1,2) with capacity 3
rz(0.5890) q[1];
rz(0.5890) q[2];
cx q[1], q[2];
rz(0.2945) q[2];
cx q[1], q[2];

// Edge (1,3) with capacity 1
rz(0.1963) q[1];
rz(0.1963) q[3];
cx q[1], q[3];
rz(0.0982) q[3];
cx q[1], q[3];

// Edge (2,1) with capacity 2
rz(0.3927) q[2];
rz(0.3927) q[1];
cx q[2], q[1];
rz(0.1963) q[1];
cx q[2], q[1];

// Edge (2,3) with capacity 3
rz(0.5890) q[2];
rz(0.5890) q[3];
cx q[2], q[3];
rz(0.2945) q[3];
cx q[2], q[3];

// Layer 2: Mixing and optimization
// Source constraint (node 0)
rz(1.5708) q[0];
h q[0];
rz(1.5708) q[0];
h q[0];

// Sink constraint (node 3)
rz(1.5708) q[3];
h q[3];
rz(1.5708) q[3];
h q[3];

// Flow conservation constraints
// Node 1 conservation
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];
cx q[1], q[4];
cx q[0], q[4];

// Node 2 conservation
cx q[1], q[5];
cx q[2], q[5];
rz(0.5890) q[5];
cx q[2], q[5];
cx q[1], q[5];

// Layer 3: Final optimization and measurement
// Final parameterized rotations
rz(0.3927) q[0];
rz(0.5890) q[1];
rz(0.5890) q[2];
rz(0.7854) q[3];
rz(0.1963) q[4];
rz(0.2945) q[5];
rz(0.0982) q[6];
rz(0.1963) q[7];
rz(0.2945) q[8];
rz(0.3927) q[9];
rz(0.5890) q[10];
rz(0.7854) q[11];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];