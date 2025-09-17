OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First cost Hamiltonian layer
rz(0.7854) q[0];
rz(0.1963) q[1];
rz(0.3927) q[2];
rz(0.1963) q[3];
rz(0.3927) q[4];
rz(0.5890) q[5];
rz(0.7854) q[6];
rz(0.9817) q[7];

// First mixing layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Second cost Hamiltonian
rz(0.6545) q[0];
rz(0.1636) q[1];
rz(0.3273) q[2];
rz(0.1636) q[3];
rz(0.3273) q[4];
rz(0.4909) q[5];
rz(0.6545) q[6];
rz(0.8182) q[7];

// Second mixing layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 3: Final cost Hamiltonian
rz(0.5236) q[0];
rz(0.1309) q[1];
rz(0.2618) q[2];
rz(0.1309) q[3];
rz(0.2618) q[4];
rz(0.3927) q[5];
rz(0.5236) q[6];
rz(0.6545) q[7];

// Final mixing layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];