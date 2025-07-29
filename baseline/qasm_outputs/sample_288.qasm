OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
// Layer 2 - Entangle connected components
cx q[0], q[1];
cx q[2], q[3];
// Layer 3 - Parameterized rotations
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
// Layer 4 - Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];