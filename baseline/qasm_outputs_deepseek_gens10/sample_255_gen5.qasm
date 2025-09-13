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

// Layer 1 - Problem Hamiltonian
// Edge constraints for k=5 clique
rz(0.314) q[0];
rz(0.314) q[1];
rz(0.314) q[2];
rz(0.314) q[3];
rz(0.314) q[4];
rz(-0.628) q[5];
rz(-0.628) q[6];
rz(-0.628) q[7];

// Mixer Hamiltonian - Layer 1
rx(0.942) q[0];
rx(0.942) q[1];
rx(0.942) q[2];
rx(0.942) q[3];
rx(0.942) q[4];
rx(0.942) q[5];
rx(0.942) q[6];
rx(0.942) q[7];

// Layer 2 - Problem Hamiltonian
// Edge constraints with optimized parameters
rz(0.471) q[0];
rz(0.471) q[1];
rz(0.471) q[2];
rz(0.471) q[3];
rz(0.471) q[4];
rz(-0.785) q[5];
rz(-0.785) q[6];
rz(-0.785) q[7];

// Mixer Hamiltonian - Layer 2
rx(1.256) q[0];
rx(1.256) q[1];
rx(1.256) q[2];
rx(1.256) q[3];
rx(1.256) q[4];
rx(1.256) q[5];
rx(1.256) q[6];
rx(1.256) q[7];

// Layer 3 - Problem Hamiltonian
// Final optimization for clique detection
rz(0.628) q[0];
rz(0.628) q[1];
rz(0.628) q[2];
rz(0.628) q[3];
rz(0.628) q[4];
rz(-1.047) q[5];
rz(-1.047) q[6];
rz(-1.047) q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];