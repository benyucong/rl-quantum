OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Prepare the initial state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply entangling and rotational gates, optimized
cx q[0], q[1];
rx(1.2345) q[2];
rz(-0.5236) q[2];
cx q[1], q[3];
rx(0.8765) q[4];
rz(0.3217) q[4];
cx q[3], q[5];
rx(1.5678) q[5];
rz(-0.7654) q[5];
cx q[0], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];