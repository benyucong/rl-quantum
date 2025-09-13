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

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,5) - weight 4
cx q[0], q[5];
rz(0.628) q[5];
cx q[0], q[5];

// Edge (0,10) - weight 14 (represented as q[6] since we have 10 qubits)
cx q[0], q[6];
rz(2.199) q[6];
cx q[0], q[6];

// Edge (1,6) - weight 4
cx q[1], q[6];
rz(0.628) q[6];
cx q[1], q[6];

// Edge (1,5) - weight 14
cx q[1], q[5];
rz(2.199) q[5];
cx q[1], q[5];

// Edge (2,7) - weight 4
cx q[2], q[7];
rz(0.628) q[7];
cx q[2], q[7];

// Edge (2,10) - weight 13 (represented as q[6])
cx q[2], q[6];
rz(2.042) q[6];
cx q[2], q[6];

// Edge (3,8) - weight 4
cx q[3], q[8];
rz(0.628) q[8];
cx q[3], q[8];

// Edge (3,10) - weight 11 (represented as q[6])
cx q[3], q[6];
rz(1.728) q[6];
cx q[3], q[6];

// Edge (4,9) - weight 7
cx q[4], q[9];
rz(1.100) q[9];
cx q[4], q[9];

// Edge (4,5) - weight 15
cx q[4], q[5];
rz(2.356) q[5];
cx q[4], q[5];

// Layer 3: Mixer layer with optimal parameters
rx(1.571) q[0];
rx(1.571) q[1];
rx(1.571) q[2];
rx(1.571) q[3];
rx(1.571) q[4];
rx(1.571) q[5];
rx(1.571) q[6];
rx(1.571) q[7];
rx(1.571) q[8];
rx(1.571) q[9];

// Layer 4: Final optimization layer
// Repeat edge interactions with optimized parameters
cx q[0], q[5];
rz(0.942) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(3.298) q[6];
cx q[0], q[6];

cx q[1], q[6];
rz(0.942) q[6];
cx q[1], q[6];

cx q[1], q[5];
rz(3.298) q[5];
cx q[1], q[5];

cx q[2], q[7];
rz(0.942) q[7];
cx q[2], q[7];

cx q[2], q[6];
rz(3.063) q[6];
cx q[2], q[6];

cx q[3], q[8];
rz(0.942) q[8];
cx q[3], q[8];

cx q[3], q[6];
rz(2.592) q[6];
cx q[3], q[6];

cx q[4], q[9];
rz(1.650) q[9];
cx q[4], q[9];

cx q[4], q[5];
rz(3.534) q[5];
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
c[8] = measure q[8];
c[9] = measure q[9];