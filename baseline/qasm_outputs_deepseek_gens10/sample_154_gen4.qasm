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
rz(0.8921) q[1];
rz(0.3678) q[2];
rz(0.5312) q[3];
rz(0.6789) q[4];
rz(0.7453) q[5];
rz(0.4236) q[6];

// Edge interactions
cx q[0], q[1];
rz(0.1567) q[1];
cx q[0], q[1];

cx q[0], q[5];
rz(0.1342) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.1789) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.1678) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.1892) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(0.2015) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(0.1923) q[6];
cx q[1], q[6];

cx q[2], q[4];
rz(0.1456) q[4];
cx q[2], q[4];

cx q[2], q[6];
rz(0.1634) q[6];
cx q[2], q[6];

cx q[3], q[5];
rz(0.1389) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.1521) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.1672) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(0.1745) q[6];
cx q[4], q[6];

cx q[5], q[6];
rz(0.1897) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.4231) q[0];
h q[0];

h q[1];
rz(0.5678) q[1];
h q[1];

h q[2];
rz(0.3124) q[2];
h q[2];

h q[3];
rz(0.4789) q[3];
h q[3];

h q[4];
rz(0.5342) q[4];
h q[4];

h q[5];
rz(0.6123) q[5];
h q[5];

h q[6];
rz(0.3897) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
rz(0.2789) q[0];
rz(0.7234) q[1];
rz(0.4123) q[2];
rz(0.5891) q[3];
rz(0.6456) q[4];
rz(0.8012) q[5];
rz(0.5123) q[6];

// Edge interactions
cx q[0], q[1];
rz(0.1892) q[1];
cx q[0], q[1];

cx q[0], q[5];
rz(0.1678) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.2015) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.1923) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.2145) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(0.2234) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(0.2156) q[6];
cx q[1], q[6];

cx q[2], q[4];
rz(0.1789) q[4];
cx q[2], q[4];

cx q[2], q[6];
rz(0.1956) q[6];
cx q[2], q[6];

cx q[3], q[5];
rz(0.1672) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.1834) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.1989) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(0.2056) q[6];
cx q[4], q[6];

cx q[5], q[6];
rz(0.2231) q[6];
cx q[5], q[6];

// Layer 4 - Mixer Hamiltonian
h q[0];
rz(0.5342) q[0];
h q[0];

h q[1];
rz(0.6891) q[1];
h q[1];

h q[2];
rz(0.4236) q[2];
h q[2];

h q[3];
rz(0.5897) q[3];
h q[3];

h q[4];
rz(0.6456) q[4];
h q[4];

h q[5];
rz(0.7234) q[5];
h q[5];

h q[6];
rz(0.5012) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];