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
rz(0.3872) q[1];
rz(0.1568) q[2];
rz(0.2984) q[3];
rz(0.2451) q[4];
rz(0.3327) q[5];
rz(0.1893) q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.1256) q[0];
h q[0];
h q[1];
rz(0.2258) q[1];
h q[1];
h q[2];
rz(0.0987) q[2];
h q[2];
h q[3];
rz(0.1873) q[3];
h q[3];
h q[4];
rz(0.1539) q[4];
h q[4];
h q[5];
rz(0.2084) q[5];
h q[5];
h q[6];
rz(0.1186) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
rz(0.4289) q[0];
rz(0.7744) q[1];
rz(0.3136) q[2];
rz(0.5968) q[3];
rz(0.4902) q[4];
rz(0.6654) q[5];
rz(0.3786) q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.2512) q[0];
h q[0];
h q[1];
rz(0.4516) q[1];
h q[1];
h q[2];
rz(0.1974) q[2];
h q[2];
h q[3];
rz(0.3746) q[3];
h q[3];
h q[4];
rz(0.3078) q[4];
h q[4];
h q[5];
rz(0.4168) q[5];
h q[5];
h q[6];
rz(0.2372) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
rz(0.6434) q[0];
rz(1.1616) q[1];
rz(0.4704) q[2];
rz(0.8952) q[3];
rz(0.7353) q[4];
rz(0.9981) q[5];
rz(0.5679) q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3768) q[0];
h q[0];
h q[1];
rz(0.6774) q[1];
h q[1];
h q[2];
rz(0.2961) q[2];
h q[2];
h q[3];
rz(0.5619) q[3];
h q[3];
h q[4];
rz(0.4617) q[4];
h q[4];
h q[5];
rz(0.6252) q[5];
h q[5];
h q[6];
rz(0.3558) q[6];
h q[6];

// Layer 4 - Problem Hamiltonian
rz(0.8578) q[0];
rz(1.5488) q[1];
rz(0.6272) q[2];
rz(1.1936) q[3];
rz(0.9804) q[4];
rz(1.3308) q[5];
rz(0.7572) q[6];

// Layer 4 - Mixer Hamiltonian
h q[0];
rz(0.5024) q[0];
h q[0];
h q[1];
rz(0.9032) q[1];
h q[1];
h q[2];
rz(0.3948) q[2];
h q[2];
h q[3];
rz(0.7492) q[3];
h q[3];
h q[4];
rz(0.6156) q[4];
h q[4];
h q[5];
rz(0.8336) q[5];
h q[5];
h q[6];
rz(0.4744) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];