OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
rx(1.234) q[0];
rx(0.567) q[1];
rx(1.891) q[2];
rx(0.432) q[3];
rx(1.654) q[4];
rx(0.789) q[5];
rx(1.321) q[6];

// Entangling layer 1
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[4];
cx q[3], q[6];
cx q[5], q[6];

// Layer 2
rx(0.876) q[0];
rx(1.543) q[1];
rx(0.987) q[2];
rx(1.210) q[3];
rx(0.654) q[4];
rx(1.098) q[5];
rx(0.765) q[6];

// Entangling layer 2
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[4];
cx q[3], q[6];
cx q[5], q[6];

// Layer 3
rx(1.111) q[0];
rx(0.222) q[1];
rx(1.333) q[2];
rx(0.444) q[3];
rx(1.555) q[4];
rx(0.666) q[5];
rx(1.777) q[6];

// Entangling layer 3
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[4];
cx q[3], q[6];
cx q[5], q[6];

// Layer 4
rx(0.999) q[0];
rx(1.888) q[1];
rx(0.777) q[2];
rx(1.666) q[3];
rx(0.555) q[4];
rx(1.444) q[5];
rx(0.333) q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];