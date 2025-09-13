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
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.1987) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.1863) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.2031) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.1759) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.1924) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.1897) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4231) q[0];
h q[0];

h q[1];
rz(0.3985) q[1];
h q[1];

h q[2];
rz(0.4127) q[2];
h q[2];

h q[3];
rz(0.4079) q[3];
h q[3];

h q[4];
rz(0.4153) q[4];
h q[4];

h q[5];
rz(0.4218) q[5];
h q[5];

h q[6];
rz(0.3962) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.3257) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.3124) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.2986) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.3218) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.2875) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.3052) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.3019) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.6384) q[0];
h q[0];

h q[1];
rz(0.6129) q[1];
h q[1];

h q[2];
rz(0.6273) q[2];
h q[2];

h q[3];
rz(0.6218) q[3];
h q[3];

h q[4];
rz(0.6295) q[4];
h q[4];

h q[5];
rz(0.6357) q[5];
h q[5];

h q[6];
rz(0.6083) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.4528) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.4376) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.4231) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.4489) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.4127) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.4315) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.4283) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.8527) q[0];
h q[0];

h q[1];
rz(0.8246) q[1];
h q[1];

h q[2];
rz(0.8392) q[2];
h q[2];

h q[3];
rz(0.8339) q[3];
h q[3];

h q[4];
rz(0.8415) q[4];
h q[4];

h q[5];
rz(0.8478) q[5];
h q[5];

h q[6];
rz(0.8194) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];