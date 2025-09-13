OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

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
h q[12];

// Capacity constraints and flow conservation
// Edge 0->1 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-0.3927) q[1];
cx q[0], q[1];
rz(0.3927) q[0];

// Edge 0->6 (capacity 2)
rz(1.1781) q[0];
rz(1.1781) q[6];
cx q[0], q[6];
rz(-0.5890) q[6];
cx q[0], q[6];
rz(0.5890) q[0];

// Edge 1->4 (capacity 1)
rz(0.7854) q[1];
rz(0.7854) q[4];
cx q[1], q[4];
rz(-0.3927) q[4];
cx q[1], q[4];
rz(0.3927) q[1];

// Edge 1->6 (capacity 2)
rz(1.1781) q[1];
rz(1.1781) q[6];
cx q[1], q[6];
rz(-0.5890) q[6];
cx q[1], q[6];
rz(0.5890) q[1];

// Edge 2->4 (capacity 1)
rz(0.7854) q[2];
rz(0.7854) q[4];
cx q[2], q[4];
rz(-0.3927) q[4];
cx q[2], q[4];
rz(0.3927) q[2];

// Edge 3->2 (capacity 2)
rz(1.1781) q[3];
rz(1.1781) q[2];
cx q[3], q[2];
rz(-0.5890) q[2];
cx q[3], q[2];
rz(0.5890) q[3];

// Edge 3->5 (capacity 3)
rz(1.5708) q[3];
rz(1.5708) q[5];
cx q[3], q[5];
rz(-0.7854) q[5];
cx q[3], q[5];
rz(0.7854) q[3];

// Edge 3->6 (capacity 1)
rz(0.7854) q[3];
rz(0.7854) q[6];
cx q[3], q[6];
rz(-0.3927) q[6];
cx q[3], q[6];
rz(0.3927) q[3];

// Edge 4->2 (capacity 1)
rz(0.7854) q[4];
rz(0.7854) q[2];
cx q[4], q[2];
rz(-0.3927) q[2];
cx q[4], q[2];
rz(0.3927) q[4];

// Layer 2: Mixing and optimization
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
h q[12];

// Flow conservation constraints
// Source node 0
rz(1.9635) q[0];
rz(1.9635) q[7];
cx q[0], q[7];
rz(-0.9817) q[7];
cx q[0], q[7];
rz(0.9817) q[0];

// Sink node 6
rz(2.3562) q[6];
rz(2.3562) q[8];
cx q[6], q[8];
rz(-1.1781) q[8];
cx q[6], q[8];
rz(1.1781) q[6];

// Intermediate nodes conservation
// Node 1
rz(1.5708) q[1];
rz(1.5708) q[9];
cx q[1], q[9];
rz(-0.7854) q[9];
cx q[1], q[9];
rz(0.7854) q[1];

// Node 2
rz(1.5708) q[2];
rz(1.5708) q[10];
cx q[2], q[10];
rz(-0.7854) q[10];
cx q[2], q[10];
rz(0.7854) q[2];

// Node 3
rz(1.9635) q[3];
rz(1.9635) q[11];
cx q[3], q[11];
rz(-0.9817) q[11];
cx q[3], q[11];
rz(0.9817) q[3];

// Node 4
rz(1.5708) q[4];
rz(1.5708) q[12];
cx q[4], q[12];
rz(-0.7854) q[12];
cx q[4], q[12];
rz(0.7854) q[4];

// Layer 3: Final optimization and measurement
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
h q[12];

// Final flow maximization
rz(2.7489) q[0];
rz(2.7489) q[6];
cx q[0], q[6];
rz(-1.3744) q[6];
cx q[0], q[6];
rz(1.3744) q[0];

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
c[12] = measure q[12];