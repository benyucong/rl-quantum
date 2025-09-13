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
rz(1.5708) q[1];
rz(0.3927) q[2];
rz(0.1963) q[3];
rz(1.1781) q[4];
rz(0.5890) q[5];
rz(0.9817) q[6];
rz(0.4909) q[7];
rz(0.2945) q[8];

cx q[0], q[4];
rz(0.3142) q[4];
cx q[0], q[4];
cx q[0], q[7];
rz(0.6283) q[7];
cx q[0], q[7];
cx q[1], q[5];
rz(0.3142) q[5];
cx q[1], q[5];
cx q[1], q[4];
rz(0.6283) q[4];
cx q[1], q[4];
cx q[1], q[7];
rz(0.4398) q[7];
cx q[1], q[7];
cx q[2], q[6];
rz(0.0785) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(0.7069) q[7];
cx q[2], q[7];
cx q[2], q[4];
rz(0.5498) q[4];
cx q[2], q[4];
cx q[3], q[7];
rz(0.1963) q[7];
cx q[3], q[7];

// Layer 3 - Mixing and optimization
h q[0];
rz(0.9425) q[0];
h q[0];
h q[1];
rz(1.2566) q[1];
h q[1];
h q[2];
rz(0.6283) q[2];
h q[2];
h q[3];
rz(0.3142) q[3];
h q[3];
h q[4];
rz(1.4137) q[4];
h q[4];
h q[5];
rz(0.7069) q[5];
h q[5];
h q[6];
rz(1.1781) q[6];
h q[6];
h q[7];
rz(0.5890) q[7];
h q[7];
h q[8];
rz(0.3534) q[8];
h q[8];

// Layer 4 - Final optimization and measurement preparation
rz(0.1571) q[0];
rz(0.2094) q[1];
rz(0.1047) q[2];
rz(0.0524) q[3];
rz(0.1257) q[4];
rz(0.0628) q[5];
rz(0.1047) q[6];
rz(0.0524) q[7];
rz(0.0314) q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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