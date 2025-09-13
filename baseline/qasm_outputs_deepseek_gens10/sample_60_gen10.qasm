OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1 - Initial rotations
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 1 - Entangling gates for edges
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
cx q[0], q[7];
rz(0.7854) q[7];
cx q[0], q[7];
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.3927) q[4];
cx q[2], q[4];
cx q[2], q[6];
rz(0.3927) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(0.3927) q[7];
cx q[2], q[7];
cx q[3], q[6];
rz(0.3927) q[6];
cx q[3], q[6];
cx q[3], q[7];
rz(0.3927) q[7];
cx q[3], q[7];
cx q[5], q[6];
rz(0.3927) q[6];
cx q[5], q[6];
cx q[6], q[7];
rz(0.3927) q[7];
cx q[6], q[7];

// Layer 2 - Mixer layer
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];

// Layer 2 - Entangling gates for edges
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];
cx q[0], q[7];
rz(0.5236) q[7];
cx q[0], q[7];
cx q[1], q[5];
rz(0.5236) q[5];
cx q[1], q[5];
cx q[2], q[3];
rz(0.2618) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.2618) q[4];
cx q[2], q[4];
cx q[2], q[6];
rz(0.2618) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(0.2618) q[7];
cx q[2], q[7];
cx q[3], q[6];
rz(0.2618) q[6];
cx q[3], q[6];
cx q[3], q[7];
rz(0.2618) q[7];
cx q[3], q[7];
cx q[5], q[6];
rz(0.2618) q[6];
cx q[5], q[6];
cx q[6], q[7];
rz(0.2618) q[7];
cx q[6], q[7];

// Layer 3 - Mixer layer
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];

// Layer 3 - Entangling gates for edges
cx q[0], q[2];
rz(0.3491) q[2];
cx q[0], q[2];
cx q[0], q[7];
rz(0.3491) q[7];
cx q[0], q[7];
cx q[1], q[5];
rz(0.3491) q[5];
cx q[1], q[5];
cx q[2], q[3];
rz(0.1745) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.1745) q[4];
cx q[2], q[4];
cx q[2], q[6];
rz(0.1745) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(0.1745) q[7];
cx q[2], q[7];
cx q[3], q[6];
rz(0.1745) q[6];
cx q[3], q[6];
cx q[3], q[7];
rz(0.1745) q[7];
cx q[3], q[7];
cx q[5], q[6];
rz(0.1745) q[6];
cx q[5], q[6];
cx q[6], q[7];
rz(0.1745) q[7];
cx q[6], q[7];

// Layer 4 - Final mixer layer
rx(0.3491) q[0];
rx(0.3491) q[1];
rx(0.3491) q[2];
rx(0.3491) q[3];
rx(0.3491) q[4];
rx(0.3491) q[5];
rx(0.3491) q[6];
rx(0.3491) q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];