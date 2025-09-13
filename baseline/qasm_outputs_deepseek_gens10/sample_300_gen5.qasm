OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Edge 0-3 (weight 4)
rz(0.6283) q[0];
rz(0.6283) q[3];
cx q[0], q[3];
rz(0.6283) q[3];
cx q[0], q[3];

// Edge 0-7 (weight 12)
rz(1.8850) q[0];
rz(1.8850) q[7];
cx q[0], q[7];
rz(1.8850) q[7];
cx q[0], q[7];

// Edge 0-6 (weight 20)
rz(3.1416) q[0];
rz(3.1416) q[6];
cx q[0], q[6];
rz(3.1416) q[6];
cx q[0], q[6];

// Edge 0-4 (weight 15)
rz(2.3562) q[0];
rz(2.3562) q[4];
cx q[0], q[4];
rz(2.3562) q[4];
cx q[0], q[4];

// Edge 1-4 (weight 1)
rz(0.1571) q[1];
rz(0.1571) q[4];
cx q[1], q[4];
rz(0.1571) q[4];
cx q[1], q[4];

// Edge 1-7 (weight 12)
rz(1.8850) q[1];
rz(1.8850) q[7];
cx q[1], q[7];
rz(1.8850) q[7];
cx q[1], q[7];

// Edge 1-6 (weight 13)
rz(2.0420) q[1];
rz(2.0420) q[6];
cx q[1], q[6];
rz(2.0420) q[6];
cx q[1], q[6];

// Edge 2-5 (weight 7)
rz(1.0996) q[2];
rz(1.0996) q[5];
cx q[2], q[5];
rz(1.0996) q[5];
cx q[2], q[5];

// Layer 2: Mixing and optimization
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Layer 3: Problem re-encoding with optimized weights
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

rz(2.3562) q[0];
rz(2.3562) q[7];
cx q[0], q[7];
rz(2.3562) q[7];
cx q[0], q[7];

rz(3.9270) q[0];
rz(3.9270) q[6];
cx q[0], q[6];
rz(3.9270) q[6];
cx q[0], q[6];

rz(2.7489) q[0];
rz(2.7489) q[4];
cx q[0], q[4];
rz(2.7489) q[4];
cx q[0], q[4];

rz(0.1963) q[1];
rz(0.1963) q[4];
cx q[1], q[4];
rz(0.1963) q[4];
cx q[1], q[4];

rz(2.3562) q[1];
rz(2.3562) q[7];
cx q[1], q[7];
rz(2.3562) q[7];
cx q[1], q[7];

rz(2.5525) q[1];
rz(2.5525) q[6];
cx q[1], q[6];
rz(2.5525) q[6];
cx q[1], q[6];

rz(1.3745) q[2];
rz(1.3745) q[5];
cx q[2], q[5];
rz(1.3745) q[5];
cx q[2], q[5];

// Layer 4: Final mixing and measurement preparation
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];