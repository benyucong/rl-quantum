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
rz(0.2145) q[0];
rz(0.1892) q[1];
rz(0.2037) q[2];
rz(0.2251) q[3];
rz(0.1783) q[4];
rz(0.2318) q[5];
rz(0.2476) q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 2 - Problem Hamiltonian
rz(0.1987) q[0];
rz(0.1743) q[1];
rz(0.1889) q[2];
rz(0.2092) q[3];
rz(0.1651) q[4];
rz(0.2148) q[5];
rz(0.2294) q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 3 - Problem Hamiltonian
rz(0.1832) q[0];
rz(0.1601) q[1];
rz(0.1744) q[2];
rz(0.1938) q[3];
rz(0.1524) q[4];
rz(0.1983) q[5];
rz(0.2117) q[6];

// Layer 3 - Mixer Hamiltonian
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 4 - Problem Hamiltonian
rz(0.1684) q[0];
rz(0.1465) q[1];
rz(0.1603) q[2];
rz(0.1789) q[3];
rz(0.1402) q[4];
rz(0.1824) q[5];
rz(0.1946) q[6];

// Layer 4 - Mixer Hamiltonian
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];