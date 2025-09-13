OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.295) q[2];
rz(0.283) q[3];
rz(0.327) q[4];
rz(0.302) q[5];

// Layer 1: Problem-specific entangling gates (edge cover constraints)
cx q[0], q[4];
rz(-0.042) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.038) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(-0.036) q[2];
cx q[1], q[2];
cx q[2], q[4];
rz(-0.041) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(-0.039) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(-0.043) q[4];
cx q[3], q[4];

// Layer 2: Mixer and parameterized rotations
h q[0];
rz(0.628) q[0];
h q[0];
h q[1];
rz(0.542) q[1];
h q[1];
h q[2];
rz(0.590) q[2];
h q[2];
h q[3];
rz(0.566) q[3];
h q[3];
h q[4];
rz(0.654) q[4];
h q[4];
h q[5];
rz(0.604) q[5];
h q[5];

// Layer 2: Problem-specific entangling gates
cx q[0], q[4];
rz(-0.084) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.076) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(-0.072) q[2];
cx q[1], q[2];
cx q[2], q[4];
rz(-0.082) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(-0.078) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(-0.086) q[4];
cx q[3], q[4];

// Layer 3: Mixer and parameterized rotations
h q[0];
rz(0.942) q[0];
h q[0];
h q[1];
rz(0.813) q[1];
h q[1];
h q[2];
rz(0.885) q[2];
h q[2];
h q[3];
rz(0.849) q[3];
h q[3];
h q[4];
rz(0.981) q[4];
h q[4];
h q[5];
rz(0.906) q[5];
h q[5];

// Layer 3: Problem-specific entangling gates
cx q[0], q[4];
rz(-0.126) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.114) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(-0.108) q[2];
cx q[1], q[2];
cx q[2], q[4];
rz(-0.123) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(-0.117) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(-0.129) q[4];
cx q[3], q[4];

// Layer 4: Final mixer and parameterized rotations
h q[0];
rz(1.256) q[0];
h q[0];
h q[1];
rz(1.084) q[1];
h q[1];
h q[2];
rz(1.180) q[2];
h q[2];
h q[3];
rz(1.132) q[3];
h q[3];
h q[4];
rz(1.308) q[4];
h q[4];
h q[5];
rz(1.208) q[5];
h q[5];

// Layer 4: Final problem-specific entangling gates
cx q[0], q[4];
rz(-0.168) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.152) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(-0.144) q[2];
cx q[1], q[2];
cx q[2], q[4];
rz(-0.164) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(-0.156) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(-0.172) q[4];
cx q[3], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];