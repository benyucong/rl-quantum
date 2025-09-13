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
rz(0.159) q[5];
rz(0.168) q[6];
rz(0.154) q[7];

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edges within the potential 5-clique (0,1,2,3,4)
cx q[0], q[1];
rz(-0.042) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(-0.038) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(-0.041) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(-0.039) q[4];
cx q[0], q[4];
cx q[1], q[2];
rz(-0.043) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(-0.040) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(-0.044) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(-0.045) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(-0.042) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-0.046) q[4];
cx q[3], q[4];

// Layer 3: Additional mixing and parameterized rotations
rx(0.628) q[0];
rx(0.542) q[1];
rx(0.590) q[2];
rx(0.566) q[3];
rx(0.604) q[4];
rx(0.318) q[5];
rx(0.336) q[6];
rx(0.308) q[7];
rz(0.471) q[0];
rz(0.407) q[1];
rz(0.443) q[2];
rz(0.425) q[3];
rz(0.453) q[4];
rz(0.239) q[5];
rz(0.252) q[6];
rz(0.231) q[7];

// Layer 4: Final mixing and measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.785) q[0];
rz(0.678) q[1];
rz(0.738) q[2];
rz(0.708) q[3];
rz(0.755) q[4];
rz(0.398) q[5];
rz(0.420) q[6];
rz(0.385) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];