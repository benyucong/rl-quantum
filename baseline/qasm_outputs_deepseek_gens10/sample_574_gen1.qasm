OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First QAOA layer - Cost Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.214) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.198) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.225) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.203) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.192) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.187) q[7];
cx q[1], q[7];
// Edge (2,5)
cx q[2], q[5];
rz(0.176) q[5];
cx q[2], q[5];
// Edge (2,7)
cx q[2], q[7];
rz(0.209) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[4];
rz(0.221) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.205) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.218) q[5];
cx q[4], q[5];
// Edge (4,8)
cx q[4], q[8];
rz(0.231) q[8];
cx q[4], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.194) q[7];
cx q[6], q[7];
// Edge (7,8)
cx q[7], q[8];
rz(0.227) q[8];
cx q[7], q[8];

// First Mixer layer
h q[0];
rz(0.432) q[0];
h q[0];
h q[1];
rz(0.432) q[1];
h q[1];
h q[2];
rz(0.432) q[2];
h q[2];
h q[3];
rz(0.432) q[3];
h q[3];
h q[4];
rz(0.432) q[4];
h q[4];
h q[5];
rz(0.432) q[5];
h q[5];
h q[6];
rz(0.432) q[6];
h q[6];
h q[7];
rz(0.432) q[7];
h q[7];
h q[8];
rz(0.432) q[8];
h q[8];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.387) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.356) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.405) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.365) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.346) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.337) q[7];
cx q[1], q[7];
// Edge (2,5)
cx q[2], q[5];
rz(0.317) q[5];
cx q[2], q[5];
// Edge (2,7)
cx q[2], q[7];
rz(0.376) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[4];
rz(0.398) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.369) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.392) q[5];
cx q[4], q[5];
// Edge (4,8)
cx q[4], q[8];
rz(0.416) q[8];
cx q[4], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.349) q[7];
cx q[6], q[7];
// Edge (7,8)
cx q[7], q[8];
rz(0.409) q[8];
cx q[7], q[8];

// Second Mixer layer
h q[0];
rz(0.778) q[0];
h q[0];
h q[1];
rz(0.778) q[1];
h q[1];
h q[2];
rz(0.778) q[2];
h q[2];
h q[3];
rz(0.778) q[3];
h q[3];
h q[4];
rz(0.778) q[4];
h q[4];
h q[5];
rz(0.778) q[5];
h q[5];
h q[6];
rz(0.778) q[6];
h q[6];
h q[7];
rz(0.778) q[7];
h q[7];
h q[8];
rz(0.778) q[8];
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