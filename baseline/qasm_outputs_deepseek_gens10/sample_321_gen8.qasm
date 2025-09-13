OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2 - Problem encoding with optimal parameters
rz(0.7854) q[0];
rz(1.0472) q[1];
rz(0.5236) q[2];
rz(0.3491) q[3];
rz(0.7854) q[4];
rz(1.0472) q[5];
rz(0.5236) q[6];
rz(0.3491) q[7];
rz(0.0) q[8];

// Entangling operations for bipartite matching
cx q[0], q[4];
rz(-0.3927) q[4];
cx q[0], q[4];
cx q[0], q[7];
rz(-0.7854) q[7];
cx q[0], q[7];
cx q[1], q[5];
rz(-0.5236) q[5];
cx q[1], q[5];
cx q[1], q[4];
rz(-0.7854) q[4];
cx q[1], q[4];
cx q[1], q[7];
rz(-0.6981) q[7];
cx q[1], q[7];
cx q[2], q[6];
rz(-0.0873) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(-0.8727) q[7];
cx q[2], q[7];
cx q[2], q[4];
rz(-0.6981) q[4];
cx q[2], q[4];
cx q[3], q[7];
rz(-0.1745) q[7];
cx q[3], q[7];

// Layer 3 - Mixer operations
rx(1.2566) q[0];
rx(1.4137) q[1];
rx(0.9425) q[2];
rx(0.6283) q[3];
rx(1.2566) q[4];
rx(1.4137) q[5];
rx(0.9425) q[6];
rx(0.6283) q[7];
rx(0.0) q[8];

// Layer 4 - Final optimization
rz(0.3927) q[0];
rz(0.5236) q[1];
rz(0.2618) q[2];
rz(0.1745) q[3];
rz(0.3927) q[4];
rz(0.5236) q[5];
rz(0.2618) q[6];
rz(0.1745) q[7];
rz(0.0) q[8];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];