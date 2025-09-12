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
cx q[0], q[5];
cx q[0], q[6];
cx q[1], q[6];
cx q[1], q[7];
cx q[2], q[7];
cx q[3], q[8];
cx q[3], q[7];
cx q[4], q[5];
cx q[4], q[6];

// Layer 2
rx(1.0472) q[5];
rx(0.9273) q[6];
rx(1.1874) q[7];
rx(1.1506) q[8];
cx q[0], q[5];
cx q[1], q[6];
cx q[2], q[7];
cx q[3], q[8];

// Layer 3
rz(0.2235) q[5];
rz(0.1123) q[6];
rz(0.4561) q[7];
rz(0.7654) q[8];
cx q[0], q[5];
cx q[1], q[6];
cx q[2], q[7];
cx q[3], q[8];

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