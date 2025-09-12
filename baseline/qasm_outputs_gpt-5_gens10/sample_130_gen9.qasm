OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of gates - Prepare the input state
rz(0.36) q[0];
rz(0.29) q[1];
rz(0.45) q[2];
rz(0.51) q[3];
rz(0.36) q[4];
rz(0.29) q[5];
rz(0.45) q[6];
rz(0.51) q[7];

// Entangling operations
cx q[0], q[2];
cx q[2], q[4];
cx q[4], q[1];

cx q[1], q[7];
cx q[4], q[5];
cx q[5], q[6];

cx q[6], q[3];
cx q[3], q[7];

// Second layer of gates for uncomputation and re-preparation
rz(0.51) q[0];
rz(0.45) q[1];
rz(0.29) q[2];
rz(0.36) q[3];
rz(0.51) q[4];
rz(0.45) q[5];
rz(0.29) q[6];
rz(0.36) q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];