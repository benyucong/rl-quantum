OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard gates
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

// Layer 1: Problem-specific entangling gates
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(0.7854) q[6];
cx q[4], q[6];

// Layer 1: Mixer
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];
rx(1.5708) q[9];

// Layer 2: Problem-specific entangling gates
cx q[0], q[1];
rz(1.1781) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(1.1781) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(1.1781) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(1.1781) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(1.1781) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(1.1781) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(1.1781) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(1.1781) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(1.1781) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(1.1781) q[6];
cx q[4], q[6];

// Layer 2: Mixer
rx(2.3562) q[0];
rx(2.3562) q[1];
rx(2.3562) q[2];
rx(2.3562) q[3];
rx(2.3562) q[4];
rx(2.3562) q[5];
rx(2.3562) q[6];
rx(2.3562) q[7];
rx(2.3562) q[8];
rx(2.3562) q[9];

// Layer 3: Problem-specific entangling gates
cx q[0], q[1];
rz(1.5708) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(1.5708) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(1.5708) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(1.5708) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(1.5708) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(1.5708) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(1.5708) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(1.5708) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(1.5708) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(1.5708) q[6];
cx q[4], q[6];

// Layer 3: Mixer
rx(3.1416) q[0];
rx(3.1416) q[1];
rx(3.1416) q[2];
rx(3.1416) q[3];
rx(3.1416) q[4];
rx(3.1416) q[5];
rx(3.1416) q[6];
rx(3.1416) q[7];
rx(3.1416) q[8];
rx(3.1416) q[9];

// Layer 4: Problem-specific entangling gates
cx q[0], q[1];
rz(1.9635) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(1.9635) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(1.9635) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(1.9635) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(1.9635) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(1.9635) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(1.9635) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(1.9635) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(1.9635) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(1.9635) q[6];
cx q[4], q[6];

// Layer 4: Mixer
rx(3.9270) q[0];
rx(3.9270) q[1];
rx(3.9270) q[2];
rx(3.9270) q[3];
rx(3.9270) q[4];
rx(3.9270) q[5];
rx(3.9270) q[6];
rx(3.9270) q[7];
rx(3.9270) q[8];
rx(3.9270) q[9];

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