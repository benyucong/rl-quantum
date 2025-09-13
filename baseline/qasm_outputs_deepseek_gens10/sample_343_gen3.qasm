OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];

// Layer 1: Problem Hamiltonian (edge constraints)
// Edge 0-3
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
cx q[3], q[7];
rz(0.2145) q[7];
cx q[3], q[7];

// Edge 0-5
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
cx q[5], q[8];
rz(0.1987) q[8];
cx q[5], q[8];

// Edge 1-2
cx q[1], q[9];
rz(0.2251) q[9];
cx q[1], q[9];
cx q[2], q[9];
rz(0.2251) q[9];
cx q[2], q[9];

// Edge 1-3
cx q[1], q[10];
rz(0.2073) q[10];
cx q[1], q[10];
cx q[3], q[10];
rz(0.2073) q[10];
cx q[3], q[10];

// Edge 1-4
cx q[1], q[11];
rz(0.1928) q[11];
cx q[1], q[11];
cx q[4], q[11];
rz(0.1928) q[11];
cx q[4], q[11];

// Edge 1-5
cx q[1], q[12];
rz(0.1864) q[12];
cx q[1], q[12];
cx q[5], q[12];
rz(0.1864) q[12];
cx q[5], q[12];

// Edge 2-3
cx q[2], q[7];
rz(0.2189) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.2189) q[7];
cx q[3], q[7];

// Edge 2-4
cx q[2], q[11];
rz(0.2015) q[11];
cx q[2], q[11];
cx q[4], q[11];
rz(0.2015) q[11];
cx q[4], q[11];

// Edge 2-5
cx q[2], q[12];
rz(0.1952) q[12];
cx q[2], q[12];
cx q[5], q[12];
rz(0.1952) q[12];
cx q[5], q[12];

// Edge 3-4
cx q[3], q[11];
rz(0.2097) q[11];
cx q[3], q[11];
cx q[4], q[11];
rz(0.2097) q[11];
cx q[4], q[11];

// Edge 4-5
cx q[4], q[12];
rz(0.2031) q[12];
cx q[4], q[12];
cx q[5], q[12];
rz(0.2031) q[12];
cx q[5], q[12];

// Edge 4-6
cx q[4], q[13];
rz(0.2216) q[13];
cx q[4], q[13];
cx q[6], q[13];
rz(0.2216) q[13];
cx q[6], q[13];

// Edge 5-6
cx q[5], q[13];
rz(0.2158) q[13];
cx q[5], q[13];
cx q[6], q[13];
rz(0.2158) q[13];
cx q[6], q[13];

// Layer 2: Mixing Hamiltonian
h q[0];
rz(0.4289) q[0];
h q[0];
h q[1];
rz(0.8123) q[1];
h q[1];
h q[2];
rz(0.6217) q[2];
h q[2];
h q[3];
rz(0.8491) q[3];
h q[3];
h q[4];
rz(1.0275) q[4];
h q[4];
h q[5];
rz(0.7946) q[5];
h q[5];
h q[6];
rz(0.4372) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];