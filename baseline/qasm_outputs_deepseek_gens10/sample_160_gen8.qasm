OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and problem encoding
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

// Edge interactions based on weights
// Edge 0-8 (weight 5)
rz(0.3927) q[0];
rz(0.3927) q[8];
cx q[0], q[8];
rz(-0.3927) q[8];
cx q[0], q[8];

// Edge 0-12 (weight 16) - mapped to q[0] and q[4]
rz(1.2566) q[0];
rz(1.2566) q[4];
cx q[0], q[4];
rz(-1.2566) q[4];
cx q[0], q[4];

// Edge 1-9 (weight 6)
rz(0.4712) q[1];
rz(0.4712) q[9];
cx q[1], q[9];
rz(-0.4712) q[9];
cx q[1], q[9];

// Edge 2-10 (weight 6)
rz(0.4712) q[2];
rz(0.4712) q[10];
cx q[2], q[10];
rz(-0.4712) q[10];
cx q[2], q[10];

// Edge 3-11 (weight 7)
rz(0.5498) q[3];
rz(0.5498) q[11];
cx q[3], q[11];
rz(-0.5498) q[11];
cx q[3], q[11];

// Edge 3-14 (weight 20) - mapped to q[3] and q[7]
rz(1.5708) q[3];
rz(1.5708) q[7];
cx q[3], q[7];
rz(-1.5708) q[7];
cx q[3], q[7];

// Edge 3-12 (weight 18) - mapped to q[3] and q[4]
rz(1.4137) q[3];
rz(1.4137) q[4];
cx q[3], q[4];
rz(-1.4137) q[4];
cx q[3], q[4];

// Edge 4-12 (weight 5) - mapped to q[4] and q[4] (self-edge, skip)

// Edge 5-13 (weight 4)
rz(0.3142) q[5];
rz(0.3142) q[6];
cx q[5], q[6];
rz(-0.3142) q[6];
cx q[5], q[6];

// Edge 5-10 (weight 17) - mapped to q[5] and q[10]
rz(1.3359) q[5];
rz(1.3359) q[10];
cx q[5], q[10];
rz(-1.3359) q[10];
cx q[5], q[10];

// Edge 6-14 (weight 8) - mapped to q[6] and q[7]
rz(0.6283) q[6];
rz(0.6283) q[7];
cx q[6], q[7];
rz(-0.6283) q[7];
cx q[6], q[7];

// Edge 7-9 (weight 20) - mapped to q[7] and q[9]
rz(1.5708) q[7];
rz(1.5708) q[9];
cx q[7], q[9];
rz(-1.5708) q[9];
cx q[7], q[9];

// Layer 2: Mixing and optimization
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];
rz(0.7854) q[9];
rz(0.7854) q[10];
rz(0.7854) q[11];
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

// Layer 3: Reinforcement of optimal matching
cx q[0], q[8];
rz(-0.3927) q[8];
cx q[0], q[8];
cx q[3], q[11];
rz(-0.5498) q[11];
cx q[3], q[11];
cx q[5], q[6];
rz(-0.3142) q[6];
cx q[5], q[6];
cx q[7], q[9];
rz(-1.5708) q[9];
cx q[7], q[9];
rz(0.3927) q[0];
rz(0.3927) q[8];
rz(0.5498) q[3];
rz(0.5498) q[11];
rz(0.3142) q[5];
rz(0.3142) q[6];
rz(1.5708) q[7];
rz(1.5708) q[9];

// Layer 4: Final optimization and measurement preparation
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
rz(1.2566) q[0];
rz(0.4712) q[1];
rz(0.4712) q[2];
rz(1.4137) q[3];
rz(1.2566) q[4];
rz(1.3359) q[5];
rz(0.6283) q[6];
rz(1.5708) q[7];
rz(0.3927) q[8];
rz(1.5708) q[9];
rz(1.3359) q[10];
rz(0.5498) q[11];

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