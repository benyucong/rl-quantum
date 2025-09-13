OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initialization and problem encoding
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

// Capacity constraints encoding
rz(0.7854) q[0];  // Edge 0->3 capacity 1
rz(1.5708) q[1];  // Edge 0->4 capacity 2
rz(1.5708) q[2];  // Edge 1->2 capacity 2
rz(0.7854) q[3];  // Edge 1->3 capacity 1
rz(0.7854) q[4];  // Edge 2->1 capacity 1
rz(1.5708) q[5];  // Edge 2->4 capacity 2
rz(0.7854) q[6];  // Edge 3->1 capacity 1

// Flow conservation constraints
cx q[0], q[7];    // Source node 0 constraint
cx q[1], q[7];
rz(-1.2566) q[7];
cx q[1], q[7];
cx q[0], q[7];

cx q[2], q[8];    // Sink node 4 constraint
cx q[5], q[8];
rz(1.2566) q[8];
cx q[5], q[8];
cx q[2], q[8];

// Layer 2: Optimization and mixing
// Mixing layer
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(0.7854) q[7];
rx(0.7854) q[8];
rx(0.7854) q[9];

// Final cost function optimization
rz(0.6283) q[0];
rz(0.3142) q[1];
rz(0.3142) q[2];
rz(0.6283) q[3];
rz(0.6283) q[4];
rz(0.3142) q[5];
rz(0.6283) q[6];
rz(0.3927) q[7];
rz(0.3927) q[8];
rz(0.3927) q[9];

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