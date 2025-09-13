OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

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
h q[15];

// Edge constraints and capacity encoding
// Edge 0-1 (capacity 2)
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-0.7854) q[1];
cx q[0], q[1];

// Edge 1-6 (capacity 2)
rz(0.7854) q[1];
rz(0.7854) q[6];
cx q[1], q[6];
rz(-0.7854) q[6];
cx q[1], q[6];

// Edge 2-3 (capacity 4)
rz(0.3927) q[2];
rz(0.3927) q[3];
cx q[2], q[3];
rz(-0.3927) q[3];
cx q[2], q[3];

// Edge 4-1 (capacity 4)
rz(0.3927) q[4];
rz(0.3927) q[1];
cx q[4], q[1];
rz(-0.3927) q[1];
cx q[4], q[1];

// Edge 4-2 (capacity 4)
rz(0.3927) q[4];
rz(0.3927) q[2];
cx q[4], q[2];
rz(-0.3927) q[2];
cx q[4], q[2];

// Edge 5-3 (capacity 4)
rz(0.3927) q[5];
rz(0.3927) q[3];
cx q[5], q[3];
rz(-0.3927) q[3];
cx q[5], q[3];

// Layer 2: Flow conservation constraints
// Node 1 conservation
cx q[0], q[7];
cx q[4], q[7];
cx q[1], q[7];
rz(1.0472) q[7];
cx q[1], q[7];
cx q[4], q[7];
cx q[0], q[7];

// Node 2 conservation
cx q[4], q[8];
cx q[2], q[8];
rz(0.7854) q[8];
cx q[2], q[8];
cx q[4], q[8];

// Node 3 conservation
cx q[2], q[9];
cx q[5], q[9];
cx q[3], q[9];
rz(1.0472) q[9];
cx q[3], q[9];
cx q[5], q[9];
cx q[2], q[9];

// Layer 3: Objective optimization and final rotations
// Maximize flow from source (0) to sink (6)
rz(0.6283) q[0];
rz(0.6283) q[1];
rz(0.6283) q[6];

// Final mixing and measurement
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
h q[15];

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
c[15] = measure q[15];