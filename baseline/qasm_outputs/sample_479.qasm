OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
// Initialize superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Apply problem constraints (edges)
// Edge 0-2
cx q[0], q[2];
rz(2.0944) q[2];
cx q[0], q[2];
// Edge 2-1
cx q[2], q[1];
rz(2.0944) q[1];
cx q[2], q[1];
// Mixing layer
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];
rx(1.0472) q[8];
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