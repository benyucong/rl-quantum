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

// Layer 1 - Problem Hamiltonian with optimal parameters
rz(0.2145) q[0];
rz(0.1892) q[1];
rz(0.2037) q[2];
rz(0.1768) q[3];
rz(0.1954) q[4];
rz(0.2211) q[5];
rz(0.2079) q[6];

cx q[0], q[1];
rz(-0.0321) q[1];
cx q[0], q[1];

cx q[0], q[5];
rz(-0.0168) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(-0.0423) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(-0.0211) q[3];
cx q[1], q[3];

cx q[1], q[6];
rz(-0.0423) q[6];
cx q[1], q[6];

cx q[2], q[1];
rz(-0.0211) q[1];
cx q[2], q[1];

cx q[2], q[3];
rz(-0.0423) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(-0.0211) q[4];
cx q[2], q[4];

cx q[2], q[6];
rz(-0.0211) q[6];
cx q[2], q[6];

cx q[3], q[1];
rz(-0.0211) q[1];
cx q[3], q[1];

cx q[3], q[2];
rz(-0.0211) q[2];
cx q[3], q[2];

cx q[3], q[5];
rz(-0.0211) q[5];
cx q[3], q[5];

cx q[4], q[1];
rz(-0.0211) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(-0.0423) q[2];
cx q[4], q[2];

cx q[4], q[6];
rz(-0.0211) q[6];
cx q[4], q[6];

cx q[5], q[2];
rz(-0.0423) q[2];
cx q[5], q[2];

cx q[5], q[4];
rz(-0.0211) q[4];
cx q[5], q[4];

cx q[5], q[6];
rz(-0.0423) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.4289) q[0];
h q[0];

h q[1];
rz(0.3784) q[1];
h q[1];

h q[2];
rz(0.4074) q[2];
h q[2];

h q[3];
rz(0.3536) q[3];
h q[3];

h q[4];
rz(0.3908) q[4];
h q[4];

h q[5];
rz(0.4422) q[5];
h q[5];

h q[6];
rz(0.4158) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian with optimal parameters
rz(0.3218) q[0];
rz(0.2838) q[1];
rz(0.3056) q[2];
rz(0.2652) q[3];
rz(0.2931) q[4];
rz(0.3317) q[5];
rz(0.3119) q[6];

cx q[0], q[1];
rz(-0.0482) q[1];
cx q[0], q[1];

cx q[0], q[5];
rz(-0.0252) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(-0.0635) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(-0.0317) q[3];
cx q[1], q[3];

cx q[1], q[6];
rz(-0.0635) q[6];
cx q[1], q[6];

cx q[2], q[1];
rz(-0.0317) q[1];
cx q[2], q[1];

cx q[2], q[3];
rz(-0.0635) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(-0.0317) q[4];
cx q[2], q[4];

cx q[2], q[6];
rz(-0.0317) q[6];
cx q[2], q[6];

cx q[3], q[1];
rz(-0.0317) q[1];
cx q[3], q[1];

cx q[3], q[2];
rz(-0.0317) q[2];
cx q[3], q[2];

cx q[3], q[5];
rz(-0.0317) q[5];
cx q[3], q[5];

cx q[4], q[1];
rz(-0.0317) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(-0.0635) q[2];
cx q[4], q[2];

cx q[4], q[6];
rz(-0.0317) q[6];
cx q[4], q[6];

cx q[5], q[2];
rz(-0.0635) q[2];
cx q[5], q[2];

cx q[5], q[4];
rz(-0.0317) q[4];
cx q[5], q[4];

cx q[5], q[6];
rz(-0.0635) q[6];
cx q[5], q[6];

// Layer 4 - Final Mixer Hamiltonian
h q[0];
rz(0.8578) q[0];
h q[0];

h q[1];
rz(0.7568) q[1];
h q[1];

h q[2];
rz(0.8148) q[2];
h q[2];

h q[3];
rz(0.7072) q[3];
h q[3];

h q[4];
rz(0.7816) q[4];
h q[4];

h q[5];
rz(0.8844) q[5];
h q[5];

h q[6];
rz(0.8316) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];