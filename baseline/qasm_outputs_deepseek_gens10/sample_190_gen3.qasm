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
rz(0.169) q[6];
rz(0.162) q[7];

// Layer 2: Problem-specific entangling gates with optimal parameters
// Clique constraints for k=5
cx q[0], q[1];
rz(-0.042) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(-0.045) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(-0.043) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(-0.044) q[4];
cx q[0], q[4];
cx q[1], q[2];
rz(-0.041) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(-0.039) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(-0.040) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(-0.038) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(-0.037) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-0.036) q[4];
cx q[3], q[4];

// Layer 3: Additional mixing and optimization
rz(0.128) q[0];
rz(0.135) q[1];
rz(0.142) q[2];
rz(0.139) q[3];
rz(0.145) q[4];
rz(0.082) q[5];
rz(0.078) q[6];
rz(0.085) q[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 4: Final parameterized rotations and measurement preparation
rz(0.067) q[0];
rz(0.071) q[1];
rz(0.074) q[2];
rz(0.069) q[3];
rz(0.076) q[4];
rz(0.041) q[5];
rz(0.038) q[6];
rz(0.044) q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];