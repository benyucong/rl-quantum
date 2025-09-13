OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1 - Initial Hadamard and first parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.298) q[2];
rz(0.285) q[3];
rz(0.306) q[4];
rz(0.292) q[5];

// Layer 1 - Problem Hamiltonian (edge interactions)
// Edge (0,2)
cx q[0], q[2];
rz(0.127) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.134) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.141) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.118) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.125) q[3];
cx q[1], q[3];
// Edge (2,3)
cx q[2], q[3];
rz(0.109) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.132) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.116) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.123) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.138) q[5];
cx q[4], q[5];

// Layer 2 - Mixer Hamiltonian
rx(0.628) q[0];
rx(0.542) q[1];
rx(0.596) q[2];
rx(0.570) q[3];
rx(0.612) q[4];
rx(0.584) q[5];

// Layer 2 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.095) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.101) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.106) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.088) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.094) q[3];
cx q[1], q[3];
// Edge (2,3)
cx q[2], q[3];
rz(0.082) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.099) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.087) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.092) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.104) q[5];
cx q[4], q[5];

// Layer 3 - Mixer Hamiltonian
rx(0.471) q[0];
rx(0.406) q[1];
rx(0.447) q[2];
rx(0.428) q[3];
rx(0.459) q[4];
rx(0.438) q[5];

// Layer 3 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.071) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.076) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.080) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.066) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.070) q[3];
cx q[1], q[3];
// Edge (2,3)
cx q[2], q[3];
rz(0.061) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.074) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.065) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.069) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.078) q[5];
cx q[4], q[5];

// Layer 4 - Mixer Hamiltonian
rx(0.353) q[0];
rx(0.305) q[1];
rx(0.335) q[2];
rx(0.321) q[3];
rx(0.344) q[4];
rx(0.329) q[5];

// Layer 4 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.053) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.057) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.060) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.049) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.053) q[3];
cx q[1], q[3];
// Edge (2,3)
cx q[2], q[3];
rz(0.046) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.056) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.049) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.052) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.058) q[5];
cx q[4], q[5];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];