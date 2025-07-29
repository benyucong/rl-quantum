OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
rx(1.234) q[0];
rx(0.567) q[1];
rx(1.891) q[2];
rx(0.345) q[3];
rx(1.678) q[4];
rx(0.912) q[5];

// Entangling layer 1
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[5];
cx q[3], q[4];
cx q[3], q[5];
cx q[4], q[5];

// Layer 2
rx(0.789) q[0];
rx(1.234) q[1];
rx(0.456) q[2];
rx(1.789) q[3];
rx(0.123) q[4];
rx(1.456) q[5];

// Entangling layer 2
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[5];
cx q[3], q[4];
cx q[3], q[5];
cx q[4], q[5];

// Layer 3
rx(1.567) q[0];
rx(0.891) q[1];
rx(1.234) q[2];
rx(0.678) q[3];
rx(1.901) q[4];
rx(0.234) q[5];

// Entangling layer 3
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[5];
cx q[3], q[4];
cx q[3], q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];