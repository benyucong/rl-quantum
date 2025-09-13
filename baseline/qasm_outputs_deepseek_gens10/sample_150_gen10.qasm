OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem Hamiltonian (edges)
rz(0.2145) q[0];
rz(0.3128) q[1];
rz(0.1892) q[2];
rz(0.4276) q[3];
rz(0.1563) q[4];
rz(0.2987) q[5];
rz(0.2341) q[6];

// Layer 2 - Mixing Hamiltonian
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2 - Problem Hamiltonian (edges)
rz(0.1987) q[0];
rz(0.2894) q[1];
rz(0.1736) q[2];
rz(0.3952) q[3];
rz(0.1428) q[4];
rz(0.2763) q[5];
rz(0.2169) q[6];

// Layer 3 - Mixing Hamiltonian
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 3 - Problem Hamiltonian (edges)
rz(0.1832) q[0];
rz(0.2675) q[1];
rz(0.1591) q[2];
rz(0.3648) q[3];
rz(0.1304) q[4];
rz(0.2552) q[5];
rz(0.2012) q[6];

// Layer 4 - Mixing Hamiltonian
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 4 - Final problem phase
rz(0.1691) q[0];
rz(0.2473) q[1];
rz(0.1462) q[2];
rz(0.3372) q[3];
rz(0.1193) q[4];
rz(0.2358) q[5];
rz(0.1869) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];