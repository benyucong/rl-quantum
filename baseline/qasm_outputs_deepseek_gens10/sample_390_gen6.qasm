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
h q[8];

// Edge 0-1 (weight 8)
rz(0.6283) q[0];
rz(0.6283) q[1];
cx q[0], q[1];
rz(-0.6283) q[1];
cx q[0], q[1];

// Edge 0-3 (weight 16)
rz(1.2566) q[0];
rz(1.2566) q[3];
cx q[0], q[3];
rz(-1.2566) q[3];
cx q[0], q[3];

// Edge 0-5 (weight 16)
rz(1.2566) q[0];
rz(1.2566) q[5];
cx q[0], q[5];
rz(-1.2566) q[5];
cx q[0], q[5];

// Edge 1-6 (weight 20)
rz(1.5708) q[1];
rz(1.5708) q[6];
cx q[1], q[6];
rz(-1.5708) q[6];
cx q[1], q[6];

// Edge 2-3 (weight 9)
rz(0.7069) q[2];
rz(0.7069) q[3];
cx q[2], q[3];
rz(-0.7069) q[3];
cx q[2], q[3];

// Edge 4-5 (weight 3)
rz(0.2356) q[4];
rz(0.2356) q[5];
cx q[4], q[5];
rz(-0.2356) q[5];
cx q[4], q[5];

// Edge 4-6 (weight 17)
rz(1.3359) q[4];
rz(1.3359) q[6];
cx q[4], q[6];
rz(-1.3359) q[6];
cx q[4], q[6];

// Edge 5-7 (weight 20)
rz(1.5708) q[5];
rz(1.5708) q[7];
cx q[5], q[7];
rz(-1.5708) q[7];
cx q[5], q[7];

// Edge 6-7 (weight 1)
rz(0.0785) q[6];
rz(0.0785) q[7];
cx q[6], q[7];
rz(-0.0785) q[7];
cx q[6], q[7];

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
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 3: Final optimization and measurement
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
rz(1.1781) q[4];
rz(1.1781) q[5];
rz(1.1781) q[6];
rz(1.1781) q[7];
rz(1.1781) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];