OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialization and first mixing
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

// First constraint layer (flow conservation)
// Node 0: source constraint
rz(0.7854) q[0];
rz(0.7854) q[1];

// Node 1: conservation constraint
cx q[0], q[2];
cx q[4], q[2];
cx q[5], q[2];
rz(1.0472) q[2];
cx q[5], q[2];
cx q[4], q[2];
cx q[0], q[2];

// Node 2: conservation constraint
cx q[2], q[3];
cx q[6], q[3];
cx q[7], q[3];
rz(1.0472) q[3];
cx q[7], q[3];
cx q[6], q[3];
cx q[2], q[3];

// Node 3: sink constraint
rz(0.7854) q[8];
rz(0.7854) q[9];

// Capacity constraints
// Edge 0->1 (capacity 5)
rz(0.6283) q[0];
// Edge 0->3 (capacity 2)
rz(1.2566) q[1];
// Edge 1->2 (capacity 3)
rz(1.0472) q[4];
// Edge 1->3 (capacity 1)
rz(3.1416) q[5];
// Edge 2->1 (capacity 2)
rz(1.2566) q[6];
// Edge 2->3 (capacity 3)
rz(1.0472) q[7];

// Layer 2: Second mixing and constraint application
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

// Second constraint layer
// Node 0: source constraint
rz(0.7854) q[0];
rz(0.7854) q[1];

// Node 1: conservation constraint
cx q[0], q[2];
cx q[4], q[2];
cx q[5], q[2];
rz(1.0472) q[2];
cx q[5], q[2];
cx q[4], q[2];
cx q[0], q[2];

// Node 2: conservation constraint
cx q[2], q[3];
cx q[6], q[3];
cx q[7], q[3];
rz(1.0472) q[3];
cx q[7], q[3];
cx q[6], q[3];
cx q[2], q[3];

// Node 3: sink constraint
rz(0.7854) q[8];
rz(0.7854) q[9];

// Capacity constraints
rz(0.6283) q[0];
rz(1.2566) q[1];
rz(1.0472) q[4];
rz(3.1416) q[5];
rz(1.2566) q[6];
rz(1.0472) q[7];

// Layer 3: Final mixing and measurement
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

// Final constraint layer
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[2];
cx q[4], q[2];
cx q[5], q[2];
rz(1.0472) q[2];
cx q[5], q[2];
cx q[4], q[2];
cx q[0], q[2];
cx q[2], q[3];
cx q[6], q[3];
cx q[7], q[3];
rz(1.0472) q[3];
cx q[7], q[3];
cx q[6], q[3];
cx q[2], q[3];
rz(0.7854) q[8];
rz(0.7854) q[9];
rz(0.6283) q[0];
rz(1.2566) q[1];
rz(1.0472) q[4];
rz(3.1416) q[5];
rz(1.2566) q[6];
rz(1.0472) q[7];

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