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
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.1987) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1873) q[3];
cx q[2], q[3];
// Edge (3,4)
cx q[3], q[4];
rz(0.2056) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.1921) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1898) q[6];
cx q[3], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1764) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4289) q[0];
h q[0];
h q[1];
rz(0.3974) q[1];
h q[1];
h q[2];
rz(0.3746) q[2];
h q[2];
h q[3];
rz(0.4112) q[3];
h q[3];
h q[4];
rz(0.4112) q[4];
h q[4];
h q[5];
rz(0.3842) q[5];
h q[5];
h q[6];
rz(0.3662) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.3218) q[2];
cx q[0], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.2981) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.2809) q[3];
cx q[2], q[3];
// Edge (3,4)
cx q[3], q[4];
rz(0.3084) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.2882) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.2847) q[6];
cx q[3], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2646) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.6436) q[0];
h q[0];
h q[1];
rz(0.5962) q[1];
h q[1];
h q[2];
rz(0.5618) q[2];
h q[2];
h q[3];
rz(0.6168) q[3];
h q[3];
h q[4];
rz(0.6168) q[4];
h q[4];
h q[5];
rz(0.5764) q[5];
h q[5];
h q[6];
rz(0.5493) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.4291) q[2];
cx q[0], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.3975) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.3745) q[3];
cx q[2], q[3];
// Edge (3,4)
cx q[3], q[4];
rz(0.4112) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.3843) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.3796) q[6];
cx q[3], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.3528) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.8582) q[0];
h q[0];
h q[1];
rz(0.7950) q[1];
h q[1];
h q[2];
rz(0.7490) q[2];
h q[2];
h q[3];
rz(0.8224) q[3];
h q[3];
h q[4];
rz(0.8224) q[4];
h q[4];
h q[5];
rz(0.7686) q[5];
h q[5];
h q[6];
rz(0.7324) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];