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

// Layer 1 - Mixer and Cost Hamiltonians
// Cost Hamiltonian for vertex cover
rz(0.2145) q[0];
rz(0.3128) q[1];
rz(0.4287) q[2];
rz(0.1983) q[3];
rz(0.3762) q[4];
rz(0.4019) q[5];
rz(0.1057) q[6];

// Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Layer 2 - Cost Hamiltonian with edge constraints
// Edge (0,2)
cx q[0], q[2];
rz(0.1423) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.1387) q[3];
cx q[0], q[3];

// Edge (1,2)
cx q[1], q[2];
rz(0.1569) q[2];
cx q[1], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.1624) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.1741) q[5];
cx q[1], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.1486) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.1528) q[5];
cx q[2], q[5];

// Edge (3,4)
cx q[3], q[4];
rz(0.1362) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.1683) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1245) q[6];
cx q[5], q[6];

// Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Layer 3 - Cost Hamiltonian
rz(0.3218) q[0];
rz(0.4692) q[1];
rz(0.6431) q[2];
rz(0.2975) q[3];
rz(0.5643) q[4];
rz(0.6029) q[5];
rz(0.1586) q[6];

// Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Layer 4 - Final cost terms
rz(0.4291) q[0];
rz(0.6256) q[1];
rz(0.8574) q[2];
rz(0.3966) q[3];
rz(0.7524) q[4];
rz(0.8038) q[5];
rz(0.2114) q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];