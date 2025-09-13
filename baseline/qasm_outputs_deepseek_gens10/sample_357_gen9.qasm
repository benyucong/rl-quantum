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
h q[6];
h q[7];

// First QAOA layer - Problem Hamiltonian
// Edge terms for clique constraints
rz(0.314) q[0];
rz(0.314) q[1];
rz(0.314) q[2];
rz(0.314) q[3];
rz(0.314) q[4];
rz(0.314) q[6];
rz(0.314) q[7];

// First QAOA layer - Mixer Hamiltonian
h q[0];
rz(0.628) q[0];
h q[0];
h q[1];
rz(0.628) q[1];
h q[1];
h q[2];
rz(0.628) q[2];
h q[2];
h q[3];
rz(0.628) q[3];
h q[3];
h q[4];
rz(0.628) q[4];
h q[4];
h q[6];
rz(0.628) q[6];
h q[6];
h q[7];
rz(0.628) q[7];
h q[7];

// Second QAOA layer - Problem Hamiltonian
// Edge terms for clique constraints
rz(0.471) q[0];
rz(0.471) q[1];
rz(0.471) q[2];
rz(0.471) q[3];
rz(0.471) q[4];
rz(0.471) q[6];
rz(0.471) q[7];

// Second QAOA layer - Mixer Hamiltonian
h q[0];
rz(0.942) q[0];
h q[0];
h q[1];
rz(0.942) q[1];
h q[1];
h q[2];
rz(0.942) q[2];
h q[2];
h q[3];
rz(0.942) q[3];
h q[3];
h q[4];
rz(0.942) q[4];
h q[4];
h q[6];
rz(0.942) q[6];
h q[6];
h q[7];
rz(0.942) q[7];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[6] = measure q[6];
c[7] = measure q[7];