OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialization layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Entangling layer 1
cx q[0], q[2];
cx q[1], q[2];
cx q[3], q[4];

// Entangling layer 2
rz(0.5) q[2];
cx q[0], q[1];
cx q[4], q[3];

// Entangling layer 3
h q[2];
rz(0.3) q[4];
cx q[3], q[0];
h q[1];

// Entangling layer 4
cx q[0], q[3];
rz(0.1) q[1];
cx q[4], q[2];

// Measurement phase
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];