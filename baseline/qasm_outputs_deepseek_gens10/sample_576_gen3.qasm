OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Problem-specific entangling gates
cx q[0], q[2];
rz(0.314) q[2];
cx q[0], q[2];
cx q[0], q[4];
rz(0.271) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(0.289) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(0.302) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.328) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.295) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.311) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.283) q[4];
cx q[3], q[4];
cx q[3], q[5];
rz(0.267) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(0.276) q[5];
cx q[4], q[5];

// Layer 2: Mixer layer
rx(0.157) q[0];
rx(0.142) q[1];
rx(0.148) q[2];
rx(0.164) q[3];
rx(0.139) q[4];
rx(0.151) q[5];

// Layer 3: Problem-specific entangling gates
cx q[0], q[2];
rz(0.628) q[2];
cx q[0], q[2];
cx q[0], q[4];
rz(0.542) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(0.578) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(0.604) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.656) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.590) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.622) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.566) q[4];
cx q[3], q[4];
cx q[3], q[5];
rz(0.534) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(0.552) q[5];
cx q[4], q[5];

// Layer 4: Final mixer layer
rx(0.314) q[0];
rx(0.284) q[1];
rx(0.296) q[2];
rx(0.328) q[3];
rx(0.278) q[4];
rx(0.302) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];