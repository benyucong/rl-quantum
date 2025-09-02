OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// First layer of operations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

rx(2.4441) q[0];
rx(2.1338) q[1];
rx(0.9572) q[2];
rx(2.8336) q[3];
rx(0.5231) q[4];
rx(1.7536) q[5];
rx(1.9023) q[6];
rx(0.6874) q[7];
rx(1.3079) q[8];

// Entanglement layer through controlled X gates
cx q[0], q[2];
cx q[0], q[5];
cx q[0], q[8];
cx q[1], q[4];
cx q[1], q[5];
cx q[1], q[7];
cx q[2], q[1];
cx q[2], q[4];
cx q[2], q[5];
cx q[2], q[6];
cx q[2], q[7];
cx q[3], q[4];
cx q[3], q[5];
cx q[3], q[6];
cx q[3], q[7];
cx q[3], q[8];
cx q[4], q[5];
cx q[5], q[3];
cx q[5], q[6];
cx q[5], q[7];
cx q[6], q[7];
cx q[7], q[8];

// Final layer of operations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

rz(0.2262) q[0];
rz(0.8565) q[1];
rz(0.4931) q[2];
rz(0.7854) q[3];
rz(1.1872) q[4];
rz(0.3471) q[5];
rz(0.9781) q[6];
rz(1.5710) q[7];
rz(0.6234) q[8];

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