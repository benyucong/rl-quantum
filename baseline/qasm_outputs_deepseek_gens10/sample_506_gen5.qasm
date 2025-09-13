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
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.295) q[2];
rz(0.302) q[3];
rz(0.289) q[4];
rz(0.278) q[5];
rz(0.307) q[6];

// Mixer Hamiltonian layer 1
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];

// Layer 2 - Cost Hamiltonian
rz(0.628) q[0];
rz(0.542) q[1];
rz(0.590) q[2];
rz(0.604) q[3];
rz(0.578) q[4];
rz(0.556) q[5];
rz(0.614) q[6];

// Mixer Hamiltonian layer 2
rx(1.571) q[0];
rx(1.571) q[1];
rx(1.571) q[2];
rx(1.571) q[3];
rx(1.571) q[4];
rx(1.571) q[5];
rx(1.571) q[6];

// Layer 3 - Cost Hamiltonian
rz(0.942) q[0];
rz(0.813) q[1];
rz(0.885) q[2];
rz(0.906) q[3];
rz(0.867) q[4];
rz(0.834) q[5];
rz(0.921) q[6];

// Mixer Hamiltonian layer 3
rx(2.356) q[0];
rx(2.356) q[1];
rx(2.356) q[2];
rx(2.356) q[3];
rx(2.356) q[4];
rx(2.356) q[5];
rx(2.356) q[6];

// Layer 4 - Final Cost Hamiltonian
rz(1.256) q[0];
rz(1.084) q[1];
rz(1.180) q[2];
rz(1.208) q[3];
rz(1.156) q[4];
rz(1.112) q[5];
rz(1.228) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];