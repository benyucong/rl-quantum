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
// Edge (0,3)
cx q[0], q[3];
rz(0.214) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.198) q[5];
cx q[0], q[5];

// Edge (0,8)
cx q[0], q[8];
rz(0.225) q[8];
cx q[0], q[8];

// Edge (1,3)
cx q[1], q[3];
rz(0.206) q[3];
cx q[1], q[3];

// Edge (1,7)
cx q[1], q[7];
rz(0.192) q[7];
cx q[1], q[7];

// Edge (1,8)
cx q[1], q[8];
rz(0.218) q[8];
cx q[1], q[8];

// Edge (2,7)
cx q[2], q[7];
rz(0.185) q[7];
cx q[2], q[7];

// Edge (2,8)
cx q[2], q[8];
rz(0.211) q[8];
cx q[2], q[8];

// Edge (3,6)
cx q[3], q[6];
rz(0.202) q[6];
cx q[3], q[6];

// Edge (3,7)
cx q[3], q[7];
rz(0.189) q[7];
cx q[3], q[7];

// Edge (4,6)
cx q[4], q[6];
rz(0.195) q[6];
cx q[4], q[6];

// Edge (5,7)
cx q[5], q[7];
rz(0.183) q[7];
cx q[5], q[7];

// First Mixer layer
rx(0.428) q[0];
rx(0.412) q[1];
rx(0.370) q[2];
rx(0.414) q[3];
rx(0.390) q[4];
rx(0.396) q[5];
rx(0.404) q[6];
rx(0.384) q[7];
rx(0.450) q[8];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.107) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.099) q[5];
cx q[0], q[5];

// Edge (0,8)
cx q[0], q[8];
rz(0.112) q[8];
cx q[0], q[8];

// Edge (1,3)
cx q[1], q[3];
rz(0.103) q[3];
cx q[1], q[3];

// Edge (1,7)
cx q[1], q[7];
rz(0.096) q[7];
cx q[1], q[7];

// Edge (1,8)
cx q[1], q[8];
rz(0.109) q[8];
cx q[1], q[8];

// Edge (2,7)
cx q[2], q[7];
rz(0.092) q[7];
cx q[2], q[7];

// Edge (2,8)
cx q[2], q[8];
rz(0.105) q[8];
cx q[2], q[8];

// Edge (3,6)
cx q[3], q[6];
rz(0.101) q[6];
cx q[3], q[6];

// Edge (3,7)
cx q[3], q[7];
rz(0.094) q[7];
cx q[3], q[7];

// Edge (4,6)
cx q[4], q[6];
rz(0.097) q[6];
cx q[4], q[6];

// Edge (5,7)
cx q[5], q[7];
rz(0.091) q[7];
cx q[5], q[7];

// Second Mixer layer
rx(0.214) q[0];
rx(0.206) q[1];
rx(0.185) q[2];
rx(0.207) q[3];
rx(0.195) q[4];
rx(0.198) q[5];
rx(0.202) q[6];
rx(0.192) q[7];
rx(0.225) q[8];

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