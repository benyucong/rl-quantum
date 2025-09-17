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

// Edge (0,4) with weight 8
rz(0.1257) q[0];
rz(0.1257) q[4];
cx q[0], q[4];
rz(-0.2514) q[4];
cx q[0], q[4];

// Edge (1,5) with weight 10
rz(0.1571) q[1];
rz(0.1571) q[5];
cx q[1], q[5];
rz(-0.3142) q[5];
cx q[1], q[5];

// Edge (1,4) with weight 14
rz(0.2199) q[1];
rz(0.2199) q[4];
cx q[1], q[4];
rz(-0.4398) q[4];
cx q[1], q[4];

// Edge (2,6) with weight 4
rz(0.0628) q[2];
rz(0.0628) q[6];
cx q[2], q[6];
rz(-0.1256) q[6];
cx q[2], q[6];

// Edge (2,4) with weight 16
rz(0.2513) q[2];
rz(0.2513) q[4];
cx q[2], q[4];
rz(-0.5026) q[4];
cx q[2], q[4];

// Edge (2,5) with weight 17
rz(0.2670) q[2];
rz(0.2670) q[5];
cx q[2], q[5];
rz(-0.5340) q[5];
cx q[2], q[5];

// Edge (3,7) with weight 9
rz(0.1414) q[3];
rz(0.1414) q[7];
cx q[3], q[7];
rz(-0.2828) q[7];
cx q[3], q[7];

// Edge (3,6) with weight 13
rz(0.2042) q[3];
rz(0.2042) q[6];
cx q[3], q[6];
rz(-0.4084) q[6];
cx q[3], q[6];

// Edge (3,5) with weight 11
rz(0.1728) q[3];
rz(0.1728) q[5];
cx q[3], q[5];
rz(-0.3456) q[5];
cx q[3], q[5];

// Layer 2: Mixing and optimization
h q[0];
rz(0.7854) q[0];
h q[0];
h q[1];
rz(0.7854) q[1];
h q[1];
h q[2];
rz(0.7854) q[2];
h q[2];
h q[3];
rz(0.7854) q[3];
h q[3];
h q[4];
rz(0.7854) q[4];
h q[4];
h q[5];
rz(0.7854) q[5];
h q[5];
h q[6];
rz(0.7854) q[6];
h q[6];
h q[7];
rz(0.7854) q[7];
h q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];