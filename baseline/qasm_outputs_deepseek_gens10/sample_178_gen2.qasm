OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1 - Initial Hadamard and first parameterized rotations
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

rz(0.3142) q[0];
rz(0.6283) q[1];
rz(0.9425) q[2];
rz(1.2566) q[3];
rz(1.5708) q[4];
rz(1.8850) q[5];
rz(2.1991) q[6];
rz(2.5133) q[7];
rz(2.8274) q[8];
rz(3.1416) q[9];

// Layer 1 - Problem Hamiltonian (edge constraints)
// Edge 0-1
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge 0-3
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Edge 0-5
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];

// Edge 1-2
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];

// Edge 1-6
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Edge 3-4
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];

// Edge 4-5
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Edge 4-6
cx q[4], q[6];
rz(0.7854) q[6];
cx q[4], q[6];

// Edge 5-6
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
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

rz(0.6283) q[0];
rz(1.2566) q[1];
rz(1.8850) q[2];
rz(2.5133) q[3];
rz(3.1416) q[4];
rz(3.7699) q[5];
rz(4.3982) q[6];
rz(5.0265) q[7];
rz(5.6549) q[8];
rz(6.2832) q[9];

// Layer 3 - Problem Hamiltonian
// Edge 0-1
cx q[0], q[1];
rz(1.1781) q[1];
cx q[0], q[1];

// Edge 0-3
cx q[0], q[3];
rz(1.1781) q[3];
cx q[0], q[3];

// Edge 0-5
cx q[0], q[5];
rz(1.1781) q[5];
cx q[0], q[5];

// Edge 1-2
cx q[1], q[2];
rz(1.1781) q[2];
cx q[1], q[2];

// Edge 1-6
cx q[1], q[6];
rz(1.1781) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(1.1781) q[3];
cx q[2], q[3];

// Edge 3-4
cx q[3], q[4];
rz(1.1781) q[4];
cx q[3], q[4];

// Edge 4-5
cx q[4], q[5];
rz(1.1781) q[5];
cx q[4], q[5];

// Edge 4-6
cx q[4], q[6];
rz(1.1781) q[6];
cx q[4], q[6];

// Edge 5-6
cx q[5], q[6];
rz(1.1781) q[6];
cx q[5], q[6];

// Layer 4 - Final mixer and parameterized rotations
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

rz(0.9425) q[0];
rz(1.8850) q[1];
rz(2.8274) q[2];
rz(3.7699) q[3];
rz(4.7124) q[4];
rz(5.6549) q[5];
rz(6.5973) q[6];
rz(7.5398) q[7];
rz(8.4823) q[8];
rz(9.4248) q[9];

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