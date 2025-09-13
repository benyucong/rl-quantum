OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.592) q[2];
rz(0.157) q[3];
rz(0.471) q[4];
rz(0.549) q[5];
rz(0.118) q[6];

// Edge interactions
cx q[0], q[2];
rz(0.086) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.064) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.092) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(0.078) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.101) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.095) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(0.089) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(0.071) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(0.083) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(0.053) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
rx(0.942) q[0];
rx(0.876) q[1];
rx(1.257) q[2];
rx(0.785) q[3];
rx(1.099) q[4];
rx(1.178) q[5];
rx(0.628) q[6];

// Layer 3: Problem unitary
rz(0.471) q[0];
rz(0.406) q[1];
rz(0.888) q[2];
rz(0.236) q[3];
rz(0.706) q[4];
rz(0.824) q[5];
rz(0.177) q[6];

// Edge interactions
cx q[0], q[2];
rz(0.129) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.096) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.138) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(0.117) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.152) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.143) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(0.134) q[5];
cx q[2], q[5];
cx q[3], q[4];
rz(0.107) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(0.125) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(0.080) q[6];
cx q[5], q[6];

// Layer 4: Final mixer unitary
rx(1.413) q[0];
rx(1.314) q[1];
rx(1.885) q[2];
rx(1.178) q[3];
rx(1.649) q[4];
rx(1.767) q[5];
rx(0.942) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];