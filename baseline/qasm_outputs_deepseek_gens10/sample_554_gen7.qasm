OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and parameterized rotations
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
h q[10];
rz(0.7854) q[0];
rz(1.0472) q[1];
rz(0.5236) q[2];
rz(0.3927) q[3];
rz(0.6283) q[4];
rz(0.3491) q[5];
rz(0.7854) q[6];
rz(1.0472) q[7];
rz(0.5236) q[8];
rz(0.3927) q[9];
rz(0.6283) q[10];

// Layer 2: Entangling gates for bipartite matching
// Edge (0,6) weight 9
cx q[0], q[6];
rz(-0.1414) q[6];
cx q[0], q[6];
// Edge (0,7) weight 17
cx q[0], q[7];
rz(-0.2670) q[7];
cx q[0], q[7];
// Edge (1,7) weight 2
cx q[1], q[7];
rz(-0.0314) q[7];
cx q[1], q[7];
// Edge (1,11) weight 18
cx q[1], q[10];
rz(-0.2827) q[10];
cx q[1], q[10];
// Edge (2,8) weight 10
cx q[2], q[8];
rz(-0.1571) q[8];
cx q[2], q[8];
// Edge (2,9) weight 17
cx q[2], q[9];
rz(-0.2670) q[9];
cx q[2], q[9];
// Edge (3,9) weight 6
cx q[3], q[9];
rz(-0.0942) q[9];
cx q[3], q[9];
// Edge (4,10) weight 5
cx q[4], q[10];
rz(-0.0785) q[10];
cx q[4], q[10];
// Edge (4,7) weight 13
cx q[4], q[7];
rz(-0.2042) q[7];
cx q[4], q[7];
// Edge (5,11) weight 6
cx q[5], q[10];
rz(-0.0942) q[10];
cx q[5], q[10];
// Edge (5,8) weight 18
cx q[5], q[8];
rz(-0.2827) q[8];
cx q[5], q[8];

// Layer 3: Additional parameterized rotations
rz(0.5236) q[0];
rz(0.7854) q[1];
rz(0.3491) q[2];
rz(0.2618) q[3];
rz(0.4189) q[4];
rz(0.2327) q[5];
rz(0.5236) q[6];
rz(0.7854) q[7];
rz(0.3491) q[8];
rz(0.2618) q[9];
rz(0.4189) q[10];

// Layer 4: Final mixing and measurement preparation
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
h q[10];
rz(0.3927) q[0];
rz(0.6283) q[1];
rz(0.2618) q[2];
rz(0.1963) q[3];
rz(0.3142) q[4];
rz(0.1745) q[5];
rz(0.3927) q[6];
rz(0.6283) q[7];
rz(0.2618) q[8];
rz(0.1963) q[9];
rz(0.3142) q[10];

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
c[10] = measure q[10];