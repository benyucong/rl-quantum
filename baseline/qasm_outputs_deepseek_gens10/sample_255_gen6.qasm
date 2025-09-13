OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Cost Hamiltonian for k-clique (k=5)
// Penalize non-clique configurations
// Edge (6,5) - not part of main clique
cx q[6], q[5];
rz(0.314) q[5];
cx q[6], q[5];
// Edge (5,7) - not part of main clique
cx q[5], q[7];
rz(0.314) q[7];
cx q[5], q[7];
// Missing edges penalty (none missing in main clique)
// Mixer Hamiltonian
rx(0.628) q[0];
rx(0.628) q[1];
rx(0.628) q[2];
rx(0.628) q[3];
rx(0.628) q[4];
rx(0.628) q[5];
rx(0.628) q[6];
rx(0.628) q[7];
// Layer 2
// Cost Hamiltonian
cx q[6], q[5];
rz(0.471) q[5];
cx q[6], q[5];
cx q[5], q[7];
rz(0.471) q[7];
cx q[5], q[7];
// Mixer Hamiltonian
rx(0.942) q[0];
rx(0.942) q[1];
rx(0.942) q[2];
rx(0.942) q[3];
rx(0.942) q[4];
rx(0.942) q[5];
rx(0.942) q[6];
rx(0.942) q[7];
// Layer 3
// Cost Hamiltonian
cx q[6], q[5];
rz(0.628) q[5];
cx q[6], q[5];
cx q[5], q[7];
rz(0.628) q[7];
cx q[5], q[7];
// Mixer Hamiltonian
rx(1.256) q[0];
rx(1.256) q[1];
rx(1.256) q[2];
rx(1.256) q[3];
rx(1.256) q[4];
rx(1.256) q[5];
rx(1.256) q[6];
rx(1.256) q[7];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];