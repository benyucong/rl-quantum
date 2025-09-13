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
rz(0.3927) q[0];

// Edge 1-5 (capacity 3)
rz(0.7854) q[1];
rz(0.7854) q[5];
cx q[1], q[5];
rz(-0.3927) q[5];
cx q[1], q[5];
rz(0.3927) q[1];

// Edge 2-5 (capacity 4)
rz(1.0472) q[2];
rz(1.0472) q[5];
cx q[2], q[5];
rz(-0.5236) q[5];
cx q[2], q[5];
rz(0.5236) q[2];

// Edge 4-1 (capacity 4)
rz(1.0472) q[4];
rz(1.0472) q[1];
cx q[4], q[1];
rz(-0.5236) q[1];
cx q[4], q[1];
rz(0.5236) q[4];

// Edge 4-3 (capacity 3)
rz(0.7854) q[4];
rz(0.7854) q[3];
cx q[4], q[3];
rz(-0.3927) q[3];
cx q[4], q[3];
rz(0.3927) q[4];

// Edge 4-5 (capacity 6)
rz(1.5708) q[4];
rz(1.5708) q[5];
cx q[4], q[5];
rz(-0.7854) q[5];
cx q[4], q[5];
rz(0.7854) q[4];

// Layer 2: Flow conservation and optimization
// Flow conservation at nodes
// Node 0 conservation
cx q[0], q[6];
rz(-0.5236) q[6];
cx q[0], q[6];

// Node 1 conservation
cx q[1], q[7];
cx q[4], q[7];
rz(0.3927) q[7];
cx q[4], q[7];
cx q[1], q[7];

// Node 2 conservation
cx q[0], q[8];
cx q[2], q[8];
rz(0.2618) q[8];
cx q[2], q[8];
cx q[0], q[8];

// Node 3 conservation
cx q[4], q[9];
rz(-0.3927) q[9];
cx q[4], q[9];

// Node 4 conservation
cx q[4], q[10];
cx q[1], q[10];
cx q[3], q[10];
cx q[5], q[10];
rz(-0.5236) q[10];
cx q[5], q[10];
cx q[3], q[10];
cx q[1], q[10];
cx q[4], q[10];

// Node 5 conservation
cx q[1], q[11];
cx q[2], q[11];
cx q[4], q[11];
rz(0.6545) q[11];
cx q[4], q[11];
cx q[2], q[11];
cx q[1], q[11];

// Layer 3: Final optimization and measurement
// Final optimization rotations
rz(0.4363) q[0];
rz(0.5236) q[1];
rz(0.3491) q[2];
rz(0.2618) q[3];
rz(0.6109) q[4];
rz(0.7854) q[5];
rz(-0.2182) q[6];
rz(-0.1745) q[7];
rz(-0.1309) q[8];
rz(-0.0873) q[9];
rz(-0.3054) q[10];
rz(-0.3927) q[11];
rz(0.0) q[12];
rz(0.0) q[13];
rz(0.0) q[14];

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