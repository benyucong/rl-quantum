OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Weighted edge interactions
rz(0.7854) q[0];
rz(2.3562) q[1];
rz(1.5708) q[2];
rz(0.1963) q[3];
rz(0.5890) q[4];
rz(0.3927) q[5];
rz(0.9817) q[6];
rz(0.7854) q[7];

cx q[0], q[3];
rz(0.3142) q[3];
cx q[0], q[3];

cx q[0], q[7];
rz(0.9425) q[7];
cx q[0], q[7];

cx q[0], q[6];
rz(1.2566) q[6];
cx q[0], q[6];

cx q[0], q[4];
rz(0.9425) q[4];
cx q[0], q[4];

cx q[1], q[4];
rz(0.0785) q[4];
cx q[1], q[4];

cx q[1], q[7];
rz(0.9425) q[7];
cx q[1], q[7];

cx q[1], q[6];
rz(1.0210) q[6];
cx q[1], q[6];

cx q[2], q[5];
rz(0.5498) q[5];
cx q[2], q[5];

// Layer 3: Mixer and optimization
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];

cx q[0], q[3];
rz(0.1571) q[3];
cx q[0], q[3];

cx q[0], q[7];
rz(0.4712) q[7];
cx q[0], q[7];

cx q[1], q[4];
rz(0.0393) q[4];
cx q[1], q[4];

cx q[1], q[7];
rz(0.4712) q[7];
cx q[1], q[7];

cx q[2], q[5];
rz(0.2749) q[5];
cx q[2], q[5];

// Layer 4: Final optimization and measurement preparation
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.3927) q[3];
rx(0.3927) q[4];
rx(0.3927) q[5];
rx(0.3927) q[6];
rx(0.3927) q[7];

rz(0.3142) q[0];
rz(0.3142) q[1];
rz(0.3142) q[2];
rz(0.1963) q[3];
rz(0.1963) q[4];
rz(0.1963) q[5];
rz(0.1963) q[6];
rz(0.1963) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];