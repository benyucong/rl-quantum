OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
rz(0.314) q[0];
rz(0.628) q[1];
rz(0.942) q[2];
rz(0.471) q[3];
rz(0.785) q[4];
rz(0.157) q[5];
rz(0.392) q[6];

// Edge interactions
cx q[0], q[2];
rz(0.126) q[2];
cx q[0], q[2];

cx q[1], q[2];
rz(0.094) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.078) q[3];
cx q[1], q[3];

cx q[1], q[5];
rz(0.063) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(0.057) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(0.071) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.082) q[4];
cx q[2], q[4];

cx q[5], q[6];
rz(0.049) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
rx(1.256) q[0];
rx(1.884) q[1];
rx(0.942) q[2];
rx(1.571) q[3];
rx(0.628) q[4];
rx(2.199) q[5];
rx(0.785) q[6];

// Layer 3: Problem unitary
rz(0.471) q[0];
rz(0.942) q[1];
rz(1.413) q[2];
rz(0.706) q[3];
rz(1.178) q[4];
rz(0.235) q[5];
rz(0.589) q[6];

// Edge interactions
cx q[0], q[2];
rz(0.189) q[2];
cx q[0], q[2];

cx q[1], q[2];
rz(0.141) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.117) q[3];
cx q[1], q[3];

cx q[1], q[5];
rz(0.094) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(0.085) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(0.106) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.123) q[4];
cx q[2], q[4];

cx q[5], q[6];
rz(0.073) q[6];
cx q[5], q[6];

// Layer 4: Final mixer and measurement preparation
rx(1.884) q[0];
rx(2.513) q[1];
rx(1.413) q[2];
rx(2.356) q[3];
rx(0.942) q[4];
rx(3.141) q[5];
rx(1.178) q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];