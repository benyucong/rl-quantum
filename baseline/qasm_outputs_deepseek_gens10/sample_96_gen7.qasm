OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Edge interactions with optimal parameters
rz(0.3142) q[0];
rz(0.6283) q[1];
rz(0.4712) q[2];
rz(0.3927) q[3];
rz(0.5498) q[4];
rz(0.7069) q[5];
rz(0.2356) q[6];
rz(0.1571) q[7];

cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(1.5708) q[5];
cx q[0], q[5];

cx q[1], q[3];
rz(0.3927) q[3];
cx q[1], q[3];

cx q[1], q[5];
rz(1.1781) q[5];
cx q[1], q[5];

cx q[1], q[7];
rz(0.1963) q[7];
cx q[1], q[7];

cx q[2], q[1];
rz(0.1963) q[1];
cx q[2], q[1];

cx q[2], q[6];
rz(0.3927) q[6];
cx q[2], q[6];

// Layer 2: Additional edge interactions
cx q[3], q[1];
rz(0.3927) q[1];
cx q[3], q[1];

cx q[3], q[5];
rz(0.1963) q[5];
cx q[3], q[5];

cx q[4], q[1];
rz(0.3927) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(0.3927) q[2];
cx q[4], q[2];

cx q[4], q[3];
rz(0.9425) q[3];
cx q[4], q[3];

cx q[4], q[5];
rz(0.1963) q[5];
cx q[4], q[5];

cx q[5], q[7];
rz(0.9425) q[7];
cx q[5], q[7];

cx q[6], q[5];
rz(0.3927) q[5];
cx q[6], q[5];

// Layer 3: Mixing and optimization
rz(0.1571) q[0];
rz(0.7854) q[1];
rz(0.3142) q[2];
rz(0.6283) q[3];
rz(0.4712) q[4];
rz(1.0996) q[5];
rz(0.2356) q[6];
rz(0.3927) q[7];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 4: Final optimization and measurement preparation
rz(0.0785) q[0];
rz(0.3927) q[1];
rz(0.1571) q[2];
rz(0.3142) q[3];
rz(0.2356) q[4];
rz(0.5498) q[5];
rz(0.1178) q[6];
rz(0.1963) q[7];

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