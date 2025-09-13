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
// Edge (0,2)
cx q[0], q[2];
rz(0.314) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.314) q[3];
cx q[0], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.314) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.314) q[5];
cx q[1], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.314) q[4];
cx q[2], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.314) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.314) q[6];
cx q[5], q[6];

// Layer 1 - Mixing Hamiltonian
rx(0.628) q[0];
rx(0.628) q[1];
rx(0.628) q[2];
rx(0.628) q[3];
rx(0.628) q[4];
rx(0.628) q[5];
rx(0.628) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.471) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.471) q[3];
cx q[0], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.471) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.471) q[5];
cx q[1], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.471) q[4];
cx q[2], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.471) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.471) q[6];
cx q[5], q[6];

// Layer 2 - Mixing Hamiltonian
rx(0.942) q[0];
rx(0.942) q[1];
rx(0.942) q[2];
rx(0.942) q[3];
rx(0.942) q[4];
rx(0.942) q[5];
rx(0.942) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.628) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.628) q[3];
cx q[0], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.628) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.628) q[5];
cx q[1], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.628) q[4];
cx q[2], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.628) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.628) q[6];
cx q[5], q[6];

// Layer 3 - Mixing Hamiltonian
rx(1.256) q[0];
rx(1.256) q[1];
rx(1.256) q[2];
rx(1.256) q[3];
rx(1.256) q[4];
rx(1.256) q[5];
rx(1.256) q[6];

// Layer 4 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.785) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.785) q[3];
cx q[0], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.785) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.785) q[5];
cx q[1], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.785) q[4];
cx q[2], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.785) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.785) q[6];
cx q[5], q[6];

// Layer 4 - Mixing Hamiltonian
rx(1.57) q[0];
rx(1.57) q[1];
rx(1.57) q[2];
rx(1.57) q[3];
rx(1.57) q[4];
rx(1.57) q[5];
rx(1.57) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];