OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

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
h q[13];

// First problem unitary (edge constraints)
// Edge 0->1 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-0.7854) q[1];
cx q[0], q[1];

// Edge 0->2 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-0.7854) q[2];
cx q[0], q[2];

// Edge 0->4 (capacity 2)
rz(1.1781) q[0];
rz(1.1781) q[4];
cx q[0], q[4];
rz(-1.1781) q[4];
cx q[0], q[4];

// Edge 1->6 (capacity 1)
rz(0.7854) q[1];
rz(0.7854) q[6];
cx q[1], q[6];
rz(-0.7854) q[6];
cx q[1], q[6];

// Edge 2->1 (capacity 2)
rz(1.1781) q[2];
rz(1.1781) q[1];
cx q[2], q[1];
rz(-1.1781) q[1];
cx q[2], q[1];

// Edge 2->4 (capacity 1)
rz(0.7854) q[2];
rz(0.7854) q[4];
cx q[2], q[4];
rz(-0.7854) q[4];
cx q[2], q[4];

// Edge 3->5 (capacity 1)
rz(0.7854) q[3];
rz(0.7854) q[5];
cx q[3], q[5];
rz(-0.7854) q[5];
cx q[3], q[5];

// Edge 4->2 (capacity 2)
rz(1.1781) q[4];
rz(1.1781) q[2];
cx q[4], q[2];
rz(-1.1781) q[2];
cx q[4], q[2];

// Edge 4->6 (capacity 1)
rz(0.7854) q[4];
rz(0.7854) q[6];
cx q[4], q[6];
rz(-0.7854) q[6];
cx q[4], q[6];

// Edge 5->1 (capacity 1)
rz(0.7854) q[5];
rz(0.7854) q[1];
cx q[5], q[1];
rz(-0.7854) q[1];
cx q[5], q[1];

// Edge 5->3 (capacity 1)
rz(0.7854) q[5];
rz(0.7854) q[3];
cx q[5], q[3];
rz(-0.7854) q[3];
cx q[5], q[3];

// First mixing layer
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];
rx(1.0472) q[8];
rx(1.0472) q[9];
rx(1.0472) q[10];
rx(1.0472) q[11];
rx(1.0472) q[12];
rx(1.0472) q[13];

// Layer 2: Second problem unitary
// Edge 0->1
rz(0.3927) q[0];
rz(0.3927) q[1];
cx q[0], q[1];
rz(-0.3927) q[1];
cx q[0], q[1];

// Edge 0->2
rz(0.3927) q[0];
rz(0.3927) q[2];
cx q[0], q[2];
rz(-0.3927) q[2];
cx q[0], q[2];

// Edge 0->4
rz(0.5890) q[0];
rz(0.5890) q[4];
cx q[0], q[4];
rz(-0.5890) q[4];
cx q[0], q[4];

// Edge 1->6
rz(0.3927) q[1];
rz(0.3927) q[6];
cx q[1], q[6];
rz(-0.3927) q[6];
cx q[1], q[6];

// Edge 2->1
rz(0.5890) q[2];
rz(0.5890) q[1];
cx q[2], q[1];
rz(-0.5890) q[1];
cx q[2], q[1];

// Edge 2->4
rz(0.3927) q[2];
rz(0.3927) q[4];
cx q[2], q[4];
rz(-0.3927) q[4];
cx q[2], q[4];

// Edge 3->5
rz(0.3927) q[3];
rz(0.3927) q[5];
cx q[3], q[5];
rz(-0.3927) q[5];
cx q[3], q[5];

// Edge 4->2
rz(0.5890) q[4];
rz(0.5890) q[2];
cx q[4], q[2];
rz(-0.5890) q[2];
cx q[4], q[2];

// Edge 4->6
rz(0.3927) q[4];
rz(0.3927) q[6];
cx q[4], q[6];
rz(-0.3927) q[6];
cx q[4], q[6];

// Edge 5->1
rz(0.3927) q[5];
rz(0.3927) q[1];
cx q[5], q[1];
rz(-0.3927) q[1];
cx q[5], q[1];

// Edge 5->3
rz(0.3927) q[5];
rz(0.3927) q[3];
cx q[5], q[3];
rz(-0.3927) q[3];
cx q[5], q[3];

// Second mixing layer
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];
rx(0.7854) q[8];
rx(0.7854) q[9];
rx(0.7854) q[10];
rx(0.7854) q[11];
rx(0.7854) q[12];
rx(0.7854) q[13];

// Layer 3: Third problem unitary
// Edge 0->1
rz(0.1963) q[0];
rz(0.1963) q[1];
cx q[0], q[1];
rz(-0.1963) q[1];
cx q[0], q[1];

// Edge 0->2
rz(0.1963) q[0];
rz(0.1963) q[2];
cx q[0], q[2];
rz(-0.1963) q[2];
cx q[0], q[2];

// Edge 0->4
rz(0.2945) q[0];
rz(0.2945) q[4];
cx q[0], q[4];
rz(-0.2945) q[4];
cx q[0], q[4];

// Edge 1->6
rz(0.1963) q[1];
rz(0.1963) q[6];
cx q[1], q[6];
rz(-0.1963) q[6];
cx q[1], q[6];

// Edge 2->1
rz(0.2945) q[2];
rz(0.2945) q[1];
cx q[2], q[1];
rz(-0.2945) q[1];
cx q[2], q[1];

// Edge 2->4
rz(0.1963) q[2];
rz(0.1963) q[4];
cx q[2], q[4];
rz(-0.1963) q[4];
cx q[2], q[4];

// Edge 3->5
rz(0.1963) q[3];
rz(0.1963) q[5];
cx q[3], q[5];
rz(-0.1963) q[5];
cx q[3], q[5];

// Edge 4->2
rz(0.2945) q[4];
rz(0.2945) q[2];
cx q[4], q[2];
rz(-0.2945) q[2];
cx q[4], q[2];

// Edge 4->6
rz(0.1963) q[4];
rz(0.1963) q[6];
cx q[4], q[6];
rz(-0.1963) q[6];
cx q[4], q[6];

// Edge 5->1
rz(0.1963) q[5];
rz(0.1963) q[1];
cx q[5], q[1];
rz(-0.1963) q[1];
cx q[5], q[1];

// Edge 5->3
rz(0.1963) q[5];
rz(0.1963) q[3];
cx q[5], q[3];
rz(-0.1963) q[3];
cx q[5], q[3];

// Final mixing layer
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];
rx(0.5236) q[8];
rx(0.5236) q[9];
rx(0.5236) q[10];
rx(0.5236) q[11];
rx(0.5236) q[12];
rx(0.5236) q[13];

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
c[13] = measure q[13];