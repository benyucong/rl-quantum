OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard and problem encoding
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

// Edge interactions with optimal parameters
// Edge (0,5) weight 4
cx q[0], q[5];
rz(0.628) q[5];
cx q[0], q[5];

// Edge (0,10) weight 14 - mapped to q[0] and q[6] (10-4=6)
cx q[0], q[6];
rz(2.199) q[6];
cx q[0], q[6];

// Edge (1,6) weight 4 - mapped to q[1] and q[2] (6-4=2)
cx q[1], q[2];
rz(0.628) q[2];
cx q[1], q[2];

// Edge (1,5) weight 14 - mapped to q[1] and q[1] (5-4=1)
cx q[1], q[1];
rz(2.199) q[1];
cx q[1], q[1];

// Edge (2,7) weight 4 - mapped to q[2] and q[3] (7-4=3)
cx q[2], q[3];
rz(0.628) q[3];
cx q[2], q[3];

// Edge (2,10) weight 13 - mapped to q[2] and q[6] (10-4=6)
cx q[2], q[6];
rz(2.042) q[6];
cx q[2], q[6];

// Edge (3,8) weight 4 - mapped to q[3] and q[4] (8-4=4)
cx q[3], q[4];
rz(0.628) q[4];
cx q[3], q[4];

// Edge (3,10) weight 11 - mapped to q[3] and q[6] (10-4=6)
cx q[3], q[6];
rz(1.728) q[6];
cx q[3], q[6];

// Edge (4,9) weight 7 - mapped to q[4] and q[5] (9-4=5)
cx q[4], q[5];
rz(1.099) q[5];
cx q[4], q[5];

// Edge (4,5) weight 15 - mapped to q[4] and q[1] (5-4=1)
cx q[4], q[1];
rz(2.356) q[1];
cx q[4], q[1];

// Layer 2: Mixing and optimization
h q[0];
rz(0.942) q[0];
h q[0];
h q[1];
rz(1.256) q[1];
h q[1];
h q[2];
rz(0.785) q[2];
h q[2];
h q[3];
rz(0.628) q[3];
h q[3];
h q[4];
rz(1.099) q[4];
h q[4];
h q[5];
rz(1.571) q[5];
h q[5];
h q[6];
rz(1.885) q[6];
h q[6];
h q[7];
rz(0.314) q[7];
h q[7];
h q[8];
rz(0.471) q[8];
h q[8];
h q[9];
rz(0.785) q[9];
h q[9];

// Layer 3: Additional optimization
rz(0.392) q[0];
rz(0.523) q[1];
rz(0.654) q[2];
rz(0.785) q[3];
rz(0.916) q[4];
rz(1.047) q[5];
rz(1.178) q[6];
rz(1.309) q[7];
rz(1.440) q[8];
rz(1.571) q[9];

// Layer 4: Final optimization and measurement preparation
h q[0];
rz(0.785) q[0];
h q[0];
h q[1];
rz(0.942) q[1];
h q[1];
h q[2];
rz(1.099) q[2];
h q[2];
h q[3];
rz(1.256) q[3];
h q[3];
h q[4];
rz(1.413) q[4];
h q[4];
h q[5];
rz(1.570) q[5];
h q[5];
h q[6];
rz(1.727) q[6];
h q[6];
h q[7];
rz(1.884) q[7];
h q[7];
h q[8];
rz(2.041) q[8];
h q[8];
h q[9];
rz(2.198) q[9];
h q[9];

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