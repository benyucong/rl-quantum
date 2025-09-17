OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.295) q[2];
rz(0.283) q[3];
rz(0.302) q[4];
rz(0.157) q[5];
rz(0.192) q[6];
rz(0.125) q[7];

// Layer 2: Problem-specific entangling gates for k=5 clique
// Edges in the potential 5-clique (0,1,2,3,4)
cx q[0], q[1];
rz(-0.042) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(-0.042) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(-0.042) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(-0.042) q[4];
cx q[0], q[4];
cx q[1], q[2];
rz(-0.042) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(-0.042) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(-0.042) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(-0.042) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(-0.042) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-0.042) q[4];
cx q[3], q[4];

// Layer 3: Additional mixing and parameterized rotations
h q[0];
rz(0.084) q[0];
h q[0];
h q[1];
rz(0.084) q[1];
h q[1];
h q[2];
rz(0.084) q[2];
h q[2];
h q[3];
rz(0.084) q[3];
h q[3];
h q[4];
rz(0.084) q[4];
h q[4];
h q[5];
rz(0.084) q[5];
h q[5];
h q[6];
rz(0.084) q[6];
h q[6];
h q[7];
rz(0.084) q[7];
h q[7];

// Layer 4: Final parameterized rotations and measurement
rz(0.218) q[0];
rz(0.189) q[1];
rz(0.206) q[2];
rz(0.197) q[3];
rz(0.211) q[4];
rz(0.109) q[5];
rz(0.134) q[6];
rz(0.087) q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];