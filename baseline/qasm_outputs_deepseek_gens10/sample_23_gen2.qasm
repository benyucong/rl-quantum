OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge 0-4 (weight 8)
rz(0.6283) q[0];
rz(0.6283) q[4];
cx q[0], q[4];
rz(0.3142) q[4];
cx q[0], q[4];

// Edge 1-5 (weight 10)
rz(0.7854) q[1];
rz(0.7854) q[5];
cx q[1], q[5];
rz(0.3927) q[5];
cx q[1], q[5];

// Edge 1-4 (weight 14)
rz(1.0996) q[1];
rz(1.0996) q[4];
cx q[1], q[4];
rz(0.5498) q[4];
cx q[1], q[4];

// Edge 2-6 (weight 4)
rz(0.3142) q[2];
rz(0.3142) q[6];
cx q[2], q[6];
rz(0.1571) q[6];
cx q[2], q[6];

// Edge 2-4 (weight 16)
rz(1.2566) q[2];
rz(1.2566) q[4];
cx q[2], q[4];
rz(0.6283) q[4];
cx q[2], q[4];

// Edge 2-5 (weight 17)
rz(1.3359) q[2];
rz(1.3359) q[5];
cx q[2], q[5];
rz(0.6679) q[5];
cx q[2], q[5];

// Edge 3-7 (weight 9)
rz(0.7069) q[3];
rz(0.7069) q[7];
cx q[3], q[7];
rz(0.3534) q[7];
cx q[3], q[7];

// Edge 3-6 (weight 13)
rz(1.0210) q[3];
rz(1.0210) q[6];
cx q[3], q[6];
rz(0.5105) q[6];
cx q[3], q[6];

// Edge 3-5 (weight 11)
rz(0.8639) q[3];
rz(0.8639) q[5];
cx q[3], q[5];
rz(0.4320) q[5];
cx q[3], q[5];

// Layer 2: Mixing and optimization
h q[0];
rz(1.2566) q[0];
h q[0];
h q[1];
rz(1.5708) q[1];
h q[1];
h q[2];
rz(1.8849) q[2];
h q[2];
h q[3];
rz(1.4137) q[3];
h q[3];
h q[4];
rz(2.5133) q[4];
h q[4];
h q[5];
rz(2.1991) q[5];
h q[5];
h q[6];
rz(0.9817) q[6];
h q[6];
h q[7];
rz(0.7069) q[7];
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