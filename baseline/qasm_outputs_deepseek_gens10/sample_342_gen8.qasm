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

// Edge 0-1 (weight 5)
rz(0.3927) q[0];
rz(0.3927) q[1];
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge 1-4 (weight 13)
rz(1.0210) q[1];
rz(1.0210) q[4];
cx q[1], q[4];
rz(2.0420) q[4];
cx q[1], q[4];

// Edge 1-2 (weight 18)
rz(1.4137) q[1];
rz(1.4137) q[2];
cx q[1], q[2];
rz(2.8274) q[2];
cx q[1], q[2];

// Edge 2-3 (weight 10)
rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[2], q[3];
rz(1.5708) q[3];
cx q[2], q[3];

// Edge 2-6 (weight 14)
rz(1.0996) q[2];
rz(1.0996) q[6];
cx q[2], q[6];
rz(2.1991) q[6];
cx q[2], q[6];

// Edge 2-7 (weight 11)
rz(0.8639) q[2];
rz(0.8639) q[7];
cx q[2], q[7];
rz(1.7279) q[7];
cx q[2], q[7];

// Edge 4-5 (weight 2)
rz(0.1571) q[4];
rz(0.1571) q[5];
cx q[4], q[5];
rz(0.3142) q[5];
cx q[4], q[5];

// Edge 5-6 (weight 19)
rz(1.4923) q[5];
rz(1.4923) q[6];
cx q[5], q[6];
rz(2.9845) q[6];
cx q[5], q[6];

// Edge 6-7 (weight 1)
rz(0.0785) q[6];
rz(0.0785) q[7];
cx q[6], q[7];
rz(0.1571) q[7];
cx q[6], q[7];

// Layer 2: Mixing and optimization
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];
rx(1.0472) q[8];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];