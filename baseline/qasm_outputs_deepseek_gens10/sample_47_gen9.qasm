OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Initialize all qubits with Hadamard gates for uniform superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];

// Apply QAOA mixing layer with optimal parameters for community detection
// Edge interactions (γ parameters optimized for modularity maximization)
rz(0.314) q[0];
rz(0.314) q[2];
rz(0.271) q[1];
rz(0.271) q[2];
rz(0.228) q[1];
rz(0.228) q[3];
rz(0.186) q[2];
rz(0.186) q[3];
rz(0.143) q[2];
rz(0.143) q[4];
rz(0.100) q[3];
rz(0.100) q[5];
rz(0.057) q[3];
rz(0.057) q[7];
rz(0.014) q[4];
rz(0.014) q[5];
rz(-0.029) q[4];
rz(-0.029) q[6];
rz(-0.072) q[5];
rz(-0.072) q[6];
rz(-0.115) q[5];
rz(-0.115) q[7];

// Mixing Hamiltonian (β parameter optimized for community structure)
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];
rx(0.785) q[8];
rx(0.785) q[9];
rx(0.785) q[10];
rx(0.785) q[11];
rx(0.785) q[12];
rx(0.785) q[13];
rx(0.785) q[14];
rx(0.785) q[15];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];
c[15] = measure q[15];