OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Cost Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.214) q[1];
cx q[0], q[1];
// Edge (0,6)
cx q[0], q[6];
rz(0.183) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.197) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.205) q[5];
cx q[1], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.176) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.189) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.192) q[6];
cx q[4], q[6];

// Mixer layer 1
rx(0.352) q[0];
rx(0.368) q[1];
rx(0.341) q[2];
rx(0.357) q[3];
rx(0.364) q[4];
rx(0.376) q[5];
rx(0.382) q[6];

// Layer 2 - Cost Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.228) q[1];
cx q[0], q[1];
// Edge (0,6)
cx q[0], q[6];
rz(0.195) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.211) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.219) q[5];
cx q[1], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.188) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.202) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.205) q[6];
cx q[4], q[6];

// Mixer layer 2
rx(0.376) q[0];
rx(0.392) q[1];
rx(0.364) q[2];
rx(0.381) q[3];
rx(0.388) q[4];
rx(0.401) q[5];
rx(0.407) q[6];

// Layer 3 - Cost Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.243) q[1];
cx q[0], q[1];
// Edge (0,6)
cx q[0], q[6];
rz(0.208) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.225) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.233) q[5];
cx q[1], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.201) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.215) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.218) q[6];
cx q[4], q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];