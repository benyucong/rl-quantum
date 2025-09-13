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

// Layer 1 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.214) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.198) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.205) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.192) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.207) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.201) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.203) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.428) q[0];
h q[0];
h q[1];
rz(0.384) q[1];
h q[1];
h q[2];
rz(0.414) q[2];
h q[2];
h q[3];
rz(0.442) q[3];
h q[3];
h q[4];
rz(0.404) q[4];
h q[4];
h q[5];
rz(0.396) q[5];
h q[5];
h q[6];
rz(0.408) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.312) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.298) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.305) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.292) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.307) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.301) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.303) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.624) q[0];
h q[0];
h q[1];
rz(0.584) q[1];
h q[1];
h q[2];
rz(0.614) q[2];
h q[2];
h q[3];
rz(0.642) q[3];
h q[3];
h q[4];
rz(0.604) q[4];
h q[4];
h q[5];
rz(0.596) q[5];
h q[5];
h q[6];
rz(0.608) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.428) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.398) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.405) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.392) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.407) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.401) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.403) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.856) q[0];
h q[0];
h q[1];
rz(0.784) q[1];
h q[1];
h q[2];
rz(0.814) q[2];
h q[2];
h q[3];
rz(0.842) q[3];
h q[3];
h q[4];
rz(0.804) q[4];
h q[4];
h q[5];
rz(0.796) q[5];
h q[5];
h q[6];
rz(0.808) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];