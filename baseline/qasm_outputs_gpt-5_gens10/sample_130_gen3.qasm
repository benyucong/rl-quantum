OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Quantum operations to approximate the min cut
cx q[0], q[2];
rz(-0.3612) q[2];
cx q[0], q[2];

cx q[0], q[7];
rz(-0.9543) q[7];
cx q[0], q[7];

cx q[4], q[1];
rz(-0.2154) q[1];
cx q[4], q[1];

cx q[4], q[3];
rz(-0.1764) q[3];
cx q[4], q[3];

cx q[4], q[5];
rz(-0.8532) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(-0.6219) q[6];
cx q[4], q[6];

// Second Layer
h q[0];
rz(0.4521) q[0];
h q[0];

h q[1];
rz(0.1234) q[1];
h q[1];

h q[2];
rz(0.6543) q[2];
h q[2];

h q[3];
rz(0.9876) q[3];
h q[3];

h q[4];
rz(0.3456) q[4];
h q[4];

h q[5];
rz(0.4567) q[5];
h q[5];

h q[6];
rz(0.5678) q[6];
h q[6];

h q[7];
rz(0.6789) q[7];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];