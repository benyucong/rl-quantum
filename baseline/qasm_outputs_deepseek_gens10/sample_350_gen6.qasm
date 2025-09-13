OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1: Problem unitary for vertex cover
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (0,5)
cx q[0], q[5];
rz(0.1987) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.2231) q[2];
cx q[1], q[2];
// Edge (1,7)
cx q[1], q[7];
rz(0.2056) q[7];
cx q[1], q[7];
// Edge (2,3)
cx q[2], q[3];
rz(0.2318) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.2194) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.2083) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.2129) q[5];
cx q[4], q[5];
// Edge (5,8)
cx q[5], q[8];
rz(0.2017) q[8];
cx q[5], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.2172) q[7];
cx q[6], q[7];
// Edge (6,8)
cx q[6], q[8];
rz(0.2256) q[8];
cx q[6], q[8];

// Layer 1: Mixer unitary
rx(1.4832) q[0];
rx(1.4765) q[1];
rx(1.4921) q[2];
rx(1.4689) q[3];
rx(1.4713) q[4];
rx(1.4857) q[5];
rx(1.4894) q[6];
rx(1.4728) q[7];
rx(1.4783) q[8];

// Layer 2: Problem unitary for vertex cover
// Edge (0,2)
cx q[0], q[2];
rz(0.4327) q[2];
cx q[0], q[2];
// Edge (0,5)
cx q[0], q[5];
rz(0.4189) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.4412) q[2];
cx q[1], q[2];
// Edge (1,7)
cx q[1], q[7];
rz(0.4263) q[7];
cx q[1], q[7];
// Edge (2,3)
cx q[2], q[3];
rz(0.4487) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.4379) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.4231) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.4318) q[5];
cx q[4], q[5];
// Edge (5,8)
cx q[5], q[8];
rz(0.4195) q[8];
cx q[5], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.4356) q[7];
cx q[6], q[7];
// Edge (6,8)
cx q[6], q[8];
rz(0.4429) q[8];
cx q[6], q[8];

// Layer 2: Mixer unitary
rx(0.9876) q[0];
rx(0.9821) q[1];
rx(0.9943) q[2];
rx(0.9789) q[3];
rx(0.9802) q[4];
rx(0.9887) q[5];
rx(0.9921) q[6];
rx(0.9815) q[7];
rx(0.9842) q[8];

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