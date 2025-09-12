OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2
cx q[0], q[1];
rz(-0.321) q[1];
cx q[0], q[1];

cx q[1], q[2];
rz(-0.283) q[2];
cx q[1], q[2];

cx q[1], q[5];
rz(-0.214) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(-0.263) q[6];
cx q[1], q[6];

// Layer 3
cx q[2], q[5];
rz(-0.194) q[5];
cx q[2], q[5];

cx q[3], q[4];
rz(-0.311) q[4];
cx q[3], q[4];

cx q[3], q[6];
rz(-0.271) q[6];
cx q[3], q[6];

// Layer 4
h q[0];
rz(0.456) q[0];
h q[0];

h q[1];
rz(0.569) q[1];
h q[1];

h q[2];
rz(0.389) q[2];
h q[2];

h q[3];
rz(0.433) q[3];
h q[3];

h q[4];
rz(0.514) q[4];
h q[4];

h q[5];
rz(0.403) q[5];
h q[5];

h q[6];
rz(0.494) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];