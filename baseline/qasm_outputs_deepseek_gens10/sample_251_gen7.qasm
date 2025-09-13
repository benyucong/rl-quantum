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
rz(0.314) q[0];
rz(0.628) q[1];
rz(0.942) q[2];
rz(1.256) q[3];
rz(1.570) q[4];
rz(1.884) q[5];
rz(2.198) q[6];
rz(2.512) q[7];
rz(2.826) q[8];
rz(3.140) q[9];
rz(3.454) q[10];

// Layer 2: Entangling gates based on bipartite matching constraints
// Left node 0 connections
cx q[0], q[5];
rz(-0.785) q[5];
cx q[0], q[5];

// Left node 1 connections
cx q[1], q[6];
rz(-1.047) q[6];
cx q[1], q[6];
cx q[1], q[9];
rz(-1.047) q[9];
cx q[1], q[9];
cx q[1], q[8];
rz(-1.047) q[8];
cx q[1], q[8];

// Left node 2 connections
cx q[2], q[7];
rz(-0.785) q[7];
cx q[2], q[7];
cx q[2], q[10];
rz(-1.047) q[10];
cx q[2], q[10];

// Left node 3 connections
cx q[3], q[8];
rz(-0.524) q[8];
cx q[3], q[8];

// Left node 4 connections
cx q[4], q[9];
rz(-1.047) q[9];
cx q[4], q[9];
cx q[4], q[5];
rz(-1.309) q[5];
cx q[4], q[5];
cx q[4], q[7];
rz(-1.222) q[7];
cx q[4], q[7];

// Layer 3: Additional parameterized rotations
rz(0.471) q[0];
rz(0.942) q[1];
rz(1.413) q[2];
rz(1.884) q[3];
rz(2.355) q[4];
rz(2.826) q[5];
rz(3.297) q[6];
rz(3.768) q[7];
rz(4.239) q[8];
rz(4.710) q[9];
rz(5.181) q[10];

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
rz(0.157) q[0];
rz(0.314) q[1];
rz(0.471) q[2];
rz(0.628) q[3];
rz(0.785) q[4];
rz(0.942) q[5];
rz(1.099) q[6];
rz(1.256) q[7];
rz(1.413) q[8];
rz(1.570) q[9];
rz(1.727) q[10];

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