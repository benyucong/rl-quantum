OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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
rz(0.7854) q[0];
rz(1.0472) q[1];
rz(0.5236) q[2];
rz(1.3089) q[3];
rz(0.3927) q[4];
rz(0.6545) q[5];
rz(0.8727) q[6];
rz(1.0909) q[7];
rz(0.4364) q[8];
rz(0.2182) q[9];

// Layer 2: Entangling gates based on bipartite matching constraints
// Left node 0 connections (to 5, 8)
cx q[0], q[5];
rz(-0.3142) q[5];
cx q[0], q[5];
cx q[0], q[8];
rz(-0.6283) q[8];
cx q[0], q[8];

// Left node 1 connection (to 6)
cx q[1], q[6];
rz(-0.2618) q[6];
cx q[1], q[6];

// Left node 2 connections (to 7, 12)
cx q[2], q[7];
rz(-0.1745) q[7];
cx q[2], q[7];
cx q[2], q[9];  // Note: 12 mapped to q[9] (10-12 → 7-9)
rz(-0.6981) q[9];
cx q[2], q[9];

// Left node 3 connections (to 8, 5)
cx q[3], q[8];
rz(-0.5236) q[8];
cx q[3], q[8];
cx q[3], q[5];
rz(-0.3491) q[5];
cx q[3], q[5];

// Left node 4 connections (to 9, 5, 8)
cx q[4], q[9];
rz(-0.0873) q[9];
cx q[4], q[9];
cx q[4], q[5];
rz(-0.4363) q[5];
cx q[4], q[5];
cx q[4], q[8];
rz(-0.2618) q[8];
cx q[4], q[8];

// Layer 3: Final parameterized rotations and measurements
rz(1.2566) q[0];
rz(0.6283) q[1];
rz(1.8849) q[2];
rz(0.3142) q[3];
rz(2.1991) q[4];
rz(0.7854) q[5];
rz(0.5236) q[6];
rz(0.3491) q[7];
rz(0.1745) q[8];
rz(0.0873) q[9];

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