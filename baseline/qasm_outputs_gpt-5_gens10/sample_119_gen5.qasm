OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2
rx(0.5284) q[0];
rz(1.0419) q[0];
rx(0.6293) q[1];
rz(-0.43) q[1];
rx(1.1921) q[2];
rz(-0.3645) q[2];
rx(0.2582) q[3];
rz(0.7891) q[3];
rx(0.9478) q[4];
rz(0.2318) q[4];
rx(1.0062) q[5];
rz(-0.5072) q[5];
rx(0.6381) q[6];
rz(0.4299) q[6];
rx(1.1323) q[7];
rz(-0.0444) q[7];

// Layer 3
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];