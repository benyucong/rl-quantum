OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem Hamiltonian (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge (0,6)
cx q[0], q[6];
rz(0.1987) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.2251) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.2318) q[5];
cx q[1], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1923) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.2056) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.2194) q[6];
cx q[4], q[6];

// Layer 1 - Mixing Hamiltonian
rx(0.8764) q[0];
rx(0.8764) q[1];
rx(0.8764) q[2];
rx(0.8764) q[3];
rx(0.8764) q[4];
rx(0.8764) q[5];
rx(0.8764) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.4321) q[1];
cx q[0], q[1];

// Edge (0,6)
cx q[0], q[6];
rz(0.3982) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.4517) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.4639) q[5];
cx q[1], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.3847) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.4115) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.4389) q[6];
cx q[4], q[6];

// Layer 2 - Mixing Hamiltonian
rx(0.6542) q[0];
rx(0.6542) q[1];
rx(0.6542) q[2];
rx(0.6542) q[3];
rx(0.6542) q[4];
rx(0.6542) q[5];
rx(0.6542) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.6483) q[1];
cx q[0], q[1];

// Edge (0,6)
cx q[0], q[6];
rz(0.5974) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.6776) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.6958) q[5];
cx q[1], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.5771) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.6173) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.6584) q[6];
cx q[4], q[6];

// Layer 3 - Mixing Hamiltonian
rx(0.4328) q[0];
rx(0.4328) q[1];
rx(0.4328) q[2];
rx(0.4328) q[3];
rx(0.4328) q[4];
rx(0.4328) q[5];
rx(0.4328) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];