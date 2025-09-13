OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rx(0.314) q[0];
rx(0.628) q[1];
rx(0.942) q[2];
rx(1.256) q[3];
rx(1.570) q[4];
rx(1.884) q[5];
rx(2.198) q[6];

// Layer 2 - Problem Hamiltonian (edge constraints)
// Edge 0-1
cx q[0], q[1];
rz(0.785) q[1];
cx q[0], q[1];
// Edge 0-3
cx q[0], q[3];
rz(0.785) q[3];
cx q[0], q[3];
// Edge 0-4
cx q[0], q[4];
rz(0.785) q[4];
cx q[0], q[4];
// Edge 0-6
cx q[0], q[6];
rz(0.785) q[6];
cx q[0], q[6];
// Edge 1-3
cx q[1], q[3];
rz(0.785) q[3];
cx q[1], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.785) q[4];
cx q[1], q[4];
// Edge 1-5
cx q[1], q[5];
rz(0.785) q[5];
cx q[1], q[5];
// Edge 1-6
cx q[1], q[6];
rz(0.785) q[6];
cx q[1], q[6];
// Edge 2-3
cx q[2], q[3];
rz(0.785) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.785) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.785) q[5];
cx q[2], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.785) q[6];
cx q[3], q[6];
// Edge 4-5
cx q[4], q[5];
rz(0.785) q[5];
cx q[4], q[5];
// Edge 4-6
cx q[4], q[6];
rz(0.785) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
rx(1.047) q[0];
rx(1.047) q[1];
rx(1.047) q[2];
rx(1.047) q[3];
rx(1.047) q[4];
rx(1.047) q[5];
rx(1.047) q[6];
rz(0.524) q[0];
rz(0.524) q[1];
rz(0.524) q[2];
rz(0.524) q[3];
rz(0.524) q[4];
rz(0.524) q[5];
rz(0.524) q[6];

// Layer 4 - Final parameterized rotations and measurement
rx(0.262) q[0];
rx(0.524) q[1];
rx(0.786) q[2];
rx(1.048) q[3];
rx(1.310) q[4];
rx(1.572) q[5];
rx(1.834) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];