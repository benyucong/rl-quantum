OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer entangling gates corresponding to edges
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[2], q[5];
cx q[4], q[5];

// Second layer
h q[0];
rx(1.234) q[0];
h q[0];

h q[1];
rx(1.576) q[1];
h q[1];

h q[2];
rx(0.943) q[2];
h q[2];

h q[3];
rx(1.879) q[3];
h q[3];

h q[4];
rx(1.415) q[4];
h q[4];

h q[5];
rx(3.045) q[5];
h q[5];

// Third layer applying controlled operations to combine results
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[5];

// Measure the output
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];