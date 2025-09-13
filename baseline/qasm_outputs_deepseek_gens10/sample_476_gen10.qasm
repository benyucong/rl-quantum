OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge 0-1 (weight 5)
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge 0-3 (weight 11)
cx q[0], q[3];
rz(0.8639) q[3];
cx q[0], q[3];

// Edge 0-2 (weight 17)
cx q[0], q[2];
rz(1.3351) q[2];
cx q[0], q[2];

// Edge 0-5 (weight 11)
cx q[0], q[5];
rz(0.8639) q[5];
cx q[0], q[5];

// Edge 1-2 (weight 18)
cx q[1], q[2];
rz(1.4137) q[2];
cx q[1], q[2];

// Edge 2-3 (weight 8)
cx q[2], q[3];
rz(0.6283) q[3];
cx q[2], q[3];

// Edge 2-4 (weight 15)
cx q[2], q[4];
rz(1.1781) q[4];
cx q[2], q[4];

// Edge 4-5 (weight 1)
cx q[4], q[5];
rz(0.0785) q[5];
cx q[4], q[5];

// Layer 2: Mixing and additional parameterized rotations
h q[0];
rz(0.7854) q[0];
h q[0];
h q[1];
rz(0.7854) q[1];
h q[1];
h q[2];
rz(0.7854) q[2];
h q[2];
h q[3];
rz(0.7854) q[3];
h q[3];
h q[4];
rz(0.7854) q[4];
h q[4];
h q[5];
rz(0.7854) q[5];
h q[5];
h q[6];
rz(0.7854) q[6];
h q[6];
h q[7];
rz(0.7854) q[7];
h q[7];

// Repeat edge interactions with optimized parameters
cx q[0], q[1];
rz(0.3142) q[1];
cx q[0], q[1];
cx q[0], q[3];
rz(0.6912) q[3];
cx q[0], q[3];
cx q[0], q[2];
rz(1.0681) q[2];
cx q[0], q[2];
cx q[0], q[5];
rz(0.6912) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(1.1309) q[2];
cx q[1], q[2];
cx q[2], q[3];
rz(0.5027) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.9425) q[4];
cx q[2], q[4];
cx q[4], q[5];
rz(0.0628) q[5];
cx q[4], q[5];

// Layer 3: Final mixing and rotations
h q[0];
rz(1.1781) q[0];
h q[0];
h q[1];
rz(1.1781) q[1];
h q[1];
h q[2];
rz(1.1781) q[2];
h q[2];
h q[3];
rz(1.1781) q[3];
h q[3];
h q[4];
rz(1.1781) q[4];
h q[4];
h q[5];
rz(1.1781) q[5];
h q[5];
h q[6];
rz(1.1781) q[6];
h q[6];
h q[7];
rz(1.1781) q[7];
h q[7];

// Final edge interactions
cx q[0], q[1];
rz(0.2356) q[1];
cx q[0], q[1];
cx q[0], q[3];
rz(0.5185) q[3];
cx q[0], q[3];
cx q[0], q[2];
rz(0.8014) q[2];
cx q[0], q[2];
cx q[0], q[5];
rz(0.5185) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(0.8482) q[2];
cx q[1], q[2];
cx q[2], q[3];
rz(0.3770) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.7069) q[4];
cx q[2], q[4];
cx q[4], q[5];
rz(0.0471) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];