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
rz(0.1832) q[1];
rz(0.1976) q[2];
rz(0.2251) q[3];
rz(0.1628) q[4];
rz(0.2089) q[5];
rz(0.2317) q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Layer 2 - Problem Hamiltonian
rz(0.1987) q[0];
rz(0.1694) q[1];
rz(0.1823) q[2];
rz(0.2079) q[3];
rz(0.1502) q[4];
rz(0.1928) q[5];
rz(0.2141) q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Layer 3 - Problem Hamiltonian
rz(0.1842) q[0];
rz(0.1568) q[1];
rz(0.1687) q[2];
rz(0.1921) q[3];
rz(0.1387) q[4];
rz(0.1782) q[5];
rz(0.1980) q[6];

// Layer 3 - Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Layer 4 - Problem Hamiltonian
rz(0.1705) q[0];
rz(0.1450) q[1];
rz(0.1560) q[2];
rz(0.1776) q[3];
rz(0.1281) q[4];
rz(0.1648) q[5];
rz(0.1831) q[6];

// Layer 4 - Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];