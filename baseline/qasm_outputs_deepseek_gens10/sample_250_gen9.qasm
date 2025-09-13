OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
// Edge (0,1)
cx q[0], q[1];
rz(0.314) q[1];
cx q[0], q[1];
// Edge (1,2)
cx q[1], q[2];
rz(0.271) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.298) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.285) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.226) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.192) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.263) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.241) q[6];
cx q[4], q[6];

// Layer 1: Mixer unitary
rx(1.832) q[0];
rx(1.789) q[1];
rx(1.756) q[2];
rx(1.821) q[3];
rx(1.803) q[4];
rx(1.771) q[5];
rx(1.795) q[6];

// Layer 2: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.287) q[1];
cx q[0], q[1];
// Edge (1,2)
cx q[1], q[2];
rz(0.253) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.276) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.264) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.211) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.183) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.248) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.229) q[6];
cx q[4], q[6];

// Layer 2: Mixer unitary
rx(1.765) q[0];
rx(1.728) q[1];
rx(1.701) q[2];
rx(1.758) q[3];
rx(1.742) q[4];
rx(1.716) q[5];
rx(1.737) q[6];

// Layer 3: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.261) q[1];
cx q[0], q[1];
// Edge (1,2)
cx q[1], q[2];
rz(0.235) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.254) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.243) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.196) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.174) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.233) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.217) q[6];
cx q[4], q[6];

// Layer 3: Mixer unitary
rx(1.698) q[0];
rx(1.667) q[1];
rx(1.646) q[2];
rx(1.695) q[3];
rx(1.681) q[4];
rx(1.661) q[5];
rx(1.679) q[6];

// Layer 4: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.235) q[1];
cx q[0], q[1];
// Edge (1,2)
cx q[1], q[2];
rz(0.217) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.232) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.222) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.181) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.165) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.218) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.205) q[6];
cx q[4], q[6];

// Layer 4: Mixer unitary
rx(1.631) q[0];
rx(1.606) q[1];
rx(1.591) q[2];
rx(1.632) q[3];
rx(1.620) q[4];
rx(1.606) q[5];
rx(1.621) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];