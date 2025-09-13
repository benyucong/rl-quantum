OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Layer 1: Initialization and flow encoding
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
h q[14];

// Edge flow constraints and capacity encoding
// Edge 0-2 (capacity 3)
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-0.3927) q[2];
cx q[0], q[2];
rz(0.3927) q[2];

// Edge 1-5 (capacity 3)
rz(0.7854) q[1];
rz(0.7854) q[5];
cx q[1], q[5];
rz(-0.3927) q[5];
cx q[1], q[5];
rz(0.3927) q[5];

// Edge 2-5 (capacity 4)
rz(1.0472) q[2];
rz(1.0472) q[5];
cx q[2], q[5];
rz(-0.5236) q[5];
cx q[2], q[5];
rz(0.5236) q[5];

// Edge 4-1 (capacity 4)
rz(1.0472) q[4];
rz(1.0472) q[1];
cx q[4], q[1];
rz(-0.5236) q[1];
cx q[4], q[1];
rz(0.5236) q[1];

// Edge 4-3 (capacity 3)
rz(0.7854) q[4];
rz(0.7854) q[3];
cx q[4], q[3];
rz(-0.3927) q[3];
cx q[4], q[3];
rz(0.3927) q[3];

// Edge 4-5 (capacity 6)
rz(1.5708) q[4];
rz(1.5708) q[5];
cx q[4], q[5];
rz(-0.7854) q[5];
cx q[4], q[5];
rz(0.7854) q[5];

// Layer 2: Flow conservation constraints
// Node 0 (source)
rz(1.5708) q[0];
rz(1.5708) q[2];
cx q[0], q[2];
rz(-0.7854) q[2];
cx q[0], q[2];
rz(0.7854) q[2];

// Node 1
rz(1.0472) q[1];
rz(1.0472) q[5];
cx q[1], q[5];
rz(-0.5236) q[5];
cx q[1], q[5];
rz(0.5236) q[5];
rz(1.0472) q[4];
rz(1.0472) q[1];
cx q[4], q[1];
rz(-0.5236) q[1];
cx q[4], q[1];
rz(0.5236) q[1];

// Node 2
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-0.3927) q[2];
cx q[0], q[2];
rz(0.3927) q[2];
rz(1.0472) q[2];
rz(1.0472) q[5];
cx q[2], q[5];
rz(-0.5236) q[5];
cx q[2], q[5];
rz(0.5236) q[5];

// Node 3
rz(0.7854) q[4];
rz(0.7854) q[3];
cx q[4], q[3];
rz(-0.3927) q[3];
cx q[4], q[3];
rz(0.3927) q[3];

// Node 4
rz(1.0472) q[4];
rz(1.0472) q[1];
cx q[4], q[1];
rz(-0.5236) q[1];
cx q[4], q[1];
rz(0.5236) q[1];
rz(0.7854) q[4];
rz(0.7854) q[3];
cx q[4], q[3];
rz(-0.3927) q[3];
cx q[4], q[3];
rz(0.3927) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
cx q[4], q[5];
rz(-0.7854) q[5];
cx q[4], q[5];
rz(0.7854) q[5];

// Node 5 (sink)
rz(1.0472) q[1];
rz(1.0472) q[5];
cx q[1], q[5];
rz(-0.5236) q[5];
cx q[1], q[5];
rz(0.5236) q[5];
rz(1.0472) q[2];
rz(1.0472) q[5];
cx q[2], q[5];
rz(-0.5236) q[5];
cx q[2], q[5];
rz(0.5236) q[5];
rz(1.5708) q[4];
rz(1.5708) q[5];
cx q[4], q[5];
rz(-0.7854) q[5];
cx q[4], q[5];
rz(0.7854) q[5];

// Layer 3: Objective optimization and measurement
// Maximize flow from source to sink
rz(1.5708) q[0];
rz(1.5708) q[2];
cx q[0], q[2];
rz(-0.7854) q[2];
cx q[0], q[2];
rz(0.7854) q[2];

// Final rotations for optimal measurement
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
rx(0.5236) q[14];

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
c[14] = measure q[14];