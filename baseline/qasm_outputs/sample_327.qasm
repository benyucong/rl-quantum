OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
rx(1.234) q[0];
rx(0.567) q[1];
rx(1.891) q[2];
rx(0.345) q[3];
rx(1.678) q[4];
rx(0.912) q[5];
rx(1.456) q[6];

// Entangling operations for graph edges
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[6];
cx q[2], q[3];
cx q[2], q[5];
cx q[2], q[6];
cx q[4], q[5];
cx q[5], q[6];

// Layer 2
rz(0.123) q[0];
rz(0.456) q[1];
rz(0.789) q[2];
rz(0.234) q[3];
rz(0.567) q[4];
rz(0.891) q[5];
rz(0.345) q[6];

// Entangling operations for graph edges
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[6];
cx q[2], q[3];
cx q[2], q[5];
cx q[2], q[6];
cx q[4], q[5];
cx q[5], q[6];

// Layer 3
rx(0.678) q[0];
rx(0.912) q[1];
rx(1.234) q[2];
rx(0.567) q[3];
rx(1.891) q[4];
rx(0.345) q[5];
rx(1.678) q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];