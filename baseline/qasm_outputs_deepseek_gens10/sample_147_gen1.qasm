OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge interactions (0,1) weight=4
rz(0.628) q[0];
rz(0.628) q[1];
cx q[0], q[1];
rz(-0.628) q[1];
cx q[0], q[1];

// Edge (0,4) weight=19
rz(2.983) q[0];
rz(2.983) q[4];
cx q[0], q[4];
rz(-2.983) q[4];
cx q[0], q[4];

// Edge (1,3) weight=18
rz(2.827) q[1];
rz(2.827) q[3];
cx q[1], q[3];
rz(-2.827) q[3];
cx q[1], q[3];

// Edge (1,4) weight=16
rz(2.513) q[1];
rz(2.513) q[4];
cx q[1], q[4];
rz(-2.513) q[4];
cx q[1], q[4];

// Edge (1,5) weight=11
rz(1.728) q[1];
rz(1.728) q[5];
cx q[1], q[5];
rz(-1.728) q[5];
cx q[1], q[5];

// Edge (2,3) weight=10
rz(1.571) q[2];
rz(1.571) q[3];
cx q[2], q[3];
rz(-1.571) q[3];
cx q[2], q[3];

// Edge (2,6) weight=18
rz(2.827) q[2];
rz(2.827) q[6];
cx q[2], q[6];
rz(-2.827) q[6];
cx q[2], q[6];

// Edge (4,5) weight=4
rz(0.628) q[4];
rz(0.628) q[5];
cx q[4], q[5];
rz(-0.628) q[5];
cx q[4], q[5];

// Layer 2: Mixing and optimization
rz(1.047) q[0];
rz(1.047) q[1];
rz(1.047) q[2];
rz(1.047) q[3];
rz(1.047) q[4];
rz(1.047) q[5];
rz(1.047) q[6];
rz(1.047) q[7];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Repeat edge interactions with optimized parameters
cx q[0], q[1];
rz(-0.942) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(-4.474) q[4];
cx q[0], q[4];
cx q[1], q[3];
rz(-4.241) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(-3.770) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-2.592) q[5];
cx q[1], q[5];
cx q[2], q[3];
rz(-2.356) q[3];
cx q[2], q[3];
cx q[2], q[6];
rz(-4.241) q[6];
cx q[2], q[6];
cx q[4], q[5];
rz(-0.942) q[5];
cx q[4], q[5];

// Layer 3: Final optimization and measurement preparation
rz(0.785) q[0];
rz(0.785) q[1];
rz(0.785) q[2];
rz(0.785) q[3];
rz(0.785) q[4];
rz(0.785) q[5];
rz(0.785) q[6];
rz(0.785) q[7];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Final edge optimization
cx q[0], q[1];
rz(-1.256) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(-5.969) q[4];
cx q[0], q[4];
cx q[1], q[3];
rz(-5.655) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(-5.027) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-3.456) q[5];
cx q[1], q[5];
cx q[2], q[3];
rz(-3.142) q[3];
cx q[2], q[3];
cx q[2], q[6];
rz(-5.655) q[6];
cx q[2], q[6];
cx q[4], q[5];
rz(-1.256) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];