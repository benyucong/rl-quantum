OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
rx(1.234) q[0];
rx(0.987) q[1];
rx(1.567) q[2];
rx(0.654) q[3];
rx(1.789) q[4];
rx(0.321) q[5];

// Entangling layer 1
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[4];
cx q[4], q[5];

// Layer 2
rx(0.876) q[0];
rx(1.543) q[1];
rx(0.765) q[2];
rx(1.234) q[3];
rx(0.987) q[4];
rx(1.654) q[5];

// Entangling layer 2
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[4];
cx q[4], q[5];

// Layer 3
rx(1.111) q[0];
rx(0.999) q[1];
rx(1.222) q[2];
rx(0.888) q[3];
rx(1.333) q[4];
rx(0.777) q[5];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];