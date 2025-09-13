OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

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
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];

// Layer 1: Problem-specific phase separation
// Community 1 (nodes 0,1,2,3) vs Community 2 (nodes 4,5,6,7)
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(-0.7854) q[4];
rz(-0.7854) q[5];
rz(-0.7854) q[6];
rz(-0.7854) q[7];

// Inter-community edges
// Edge 0-4 (between communities)
cx q[0], q[8];
rz(0.3927) q[8];
cx q[0], q[8];
cx q[4], q[8];
rz(0.3927) q[8];
cx q[4], q[8];

// Edge 0-7 (between communities)
cx q[0], q[9];
rz(0.3927) q[9];
cx q[0], q[9];
cx q[7], q[9];
rz(0.3927) q[9];
cx q[7], q[9];

// Edge 3-4 (between communities)
cx q[3], q[10];
rz(0.3927) q[10];
cx q[3], q[10];
cx q[4], q[10];
rz(0.3927) q[10];
cx q[4], q[10];

// Edge 4-7 (within community 2)
cx q[4], q[11];
rz(-0.3927) q[11];
cx q[4], q[11];
cx q[7], q[11];
rz(-0.3927) q[11];
cx q[7], q[11];

// Edge 5-7 (within community 2)
cx q[5], q[12];
rz(-0.3927) q[12];
cx q[5], q[12];
cx q[7], q[12];
rz(-0.3927) q[12];
cx q[7], q[12];

// Edge 6-7 (within community 2)
cx q[6], q[13];
rz(-0.3927) q[13];
cx q[6], q[13];
cx q[7], q[13];
rz(-0.3927) q[13];
cx q[7], q[13];

// Layer 2: Mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];
rz(1.5708) q[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Phase separation (same as layer 1)
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(-0.7854) q[4];
rz(-0.7854) q[5];
rz(-0.7854) q[6];
rz(-0.7854) q[7];

// Repeat inter-community edge terms
cx q[0], q[14];
rz(0.3927) q[14];
cx q[0], q[14];
cx q[4], q[14];
rz(0.3927) q[14];
cx q[4], q[14];

cx q[0], q[15];
rz(0.3927) q[15];
cx q[0], q[15];
cx q[7], q[15];
rz(0.3927) q[15];
cx q[7], q[15];

// Layer 3: Final mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];
rz(1.5708) q[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

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