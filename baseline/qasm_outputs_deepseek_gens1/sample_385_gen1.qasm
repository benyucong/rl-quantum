OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

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

// Edge interactions with optimal parameters
// Edge (0,1): capacity 2
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (0,5): capacity 2
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];

// Edge (0,6): capacity 1
cx q[0], q[6];
rz(0.3927) q[6];
cx q[0], q[6];

// Edge (1,3): capacity 2
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

// Edge (1,5): capacity 4
cx q[1], q[5];
rz(1.5708) q[5];
cx q[1], q[5];

// Edge (2,4): capacity 3
cx q[2], q[4];
rz(1.1781) q[4];
cx q[2], q[4];

// Edge (3,5): capacity 2
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];

// Edge (3,6): capacity 4
cx q[3], q[6];
rz(1.5708) q[6];
cx q[3], q[6];

// Edge (3,7): capacity 2
cx q[3], q[7];
rz(0.7854) q[7];
cx q[3], q[7];

// Edge (4,2): capacity 2
cx q[4], q[2];
rz(0.7854) q[2];
cx q[4], q[2];

// Edge (4,3): capacity 4
cx q[4], q[3];
rz(1.5708) q[3];
cx q[4], q[3];

// Edge (4,5): capacity 2
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Edge (4,7): capacity 3
cx q[4], q[7];
rz(1.1781) q[7];
cx q[4], q[7];

// Edge (5,4): capacity 2
cx q[5], q[4];
rz(0.7854) q[4];
cx q[5], q[4];

// Edge (6,2): capacity 3
cx q[6], q[2];
rz(1.1781) q[2];
cx q[6], q[2];

// Edge (6,5): capacity 2
cx q[6], q[5];
rz(0.7854) q[5];
cx q[6], q[5];

// Edge (6,8): capacity 3
cx q[6], q[8];
rz(1.1781) q[8];
cx q[6], q[8];

// Layer 2: Mixing and optimization
h q[0];
rz(0.5236) q[0];
h q[0];
h q[1];
rz(0.5236) q[1];
h q[1];
h q[2];
rz(0.5236) q[2];
h q[2];
h q[3];
rz(0.5236) q[3];
h q[3];
h q[4];
rz(0.5236) q[4];
h q[4];
h q[5];
rz(0.5236) q[5];
h q[5];
h q[6];
rz(0.5236) q[6];
h q[6];
h q[7];
rz(0.5236) q[7];
h q[7];
h q[8];
rz(0.5236) q[8];
h q[8];

// Layer 3: Final optimization and measurement
h q[0];
rz(0.2618) q[0];
h q[0];
h q[1];
rz(0.2618) q[1];
h q[1];
h q[2];
rz(0.2618) q[2];
h q[2];
h q[3];
rz(0.2618) q[3];
h q[3];
h q[4];
rz(0.2618) q[4];
h q[4];
h q[5];
rz(0.2618) q[5];
h q[5];
h q[6];
rz(0.2618) q[6];
h q[6];
h q[7];
rz(0.2618) q[7];
h q[7];
h q[8];
rz(0.2618) q[8];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];