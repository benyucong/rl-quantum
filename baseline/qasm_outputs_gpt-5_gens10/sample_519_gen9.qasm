OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

rx(1.2991) q[0];
rz(0.0150) q[0];
rx(1.4003) q[1];
rz(0.0200) q[1];
rx(1.5000) q[2];
rz(0.0450) q[2];
rx(1.6991) q[3];
rz(0.0020) q[3];
rx(1.3005) q[4];
rz(0.0320) q[4];
rx(1.4509) q[5];
rz(0.0250) q[5];
rx(1.5503) q[6];
rz(0.0060) q[6];
rx(1.6100) q[7];
rz(0.0300) q[7];
rx(1.4305) q[8];
rz(0.0200) q[8];

// Apply CX gates based on the edges defined in the min-cut graph
cx q[0], q[4];
cx q[0], q[5];
cx q[0], q[8];
cx q[1], q[2];
cx q[2], q[3];
cx q[2], q[4];
cx q[2], q[5];
cx q[2], q[7];
cx q[3], q[4];
cx q[3], q[5];
cx q[3], q[7];
cx q[4], q[5];
cx q[6], q[2];
cx q[6], q[4];
cx q[7], q[5];
cx q[7], q[8];

// Layer 2
h q[0];
rz(0.0764) q[0];
h q[0];
h q[1];
rz(0.0764) q[1];
h q[1];
h q[2];
rz(0.0764) q[2];
h q[2];
h q[3];
rz(0.0764) q[3];
h q[3];
h q[4];
rz(0.0764) q[4];
h q[4];
h q[5];
rz(0.0764) q[5];
h q[5];
h q[6];
rz(0.0764) q[6];
h q[6];
h q[7];
rz(0.0764) q[7];
h q[7];
h q[8];
rz(0.0764) q[8];
h q[8];

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