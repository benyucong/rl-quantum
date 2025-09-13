OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
// Edge 0-2 (capacity 5)
cx q[0], q[2];
rz(0.6283) q[2];
cx q[0], q[2];
// Edge 0-3 (capacity 1)
cx q[0], q[3];
rz(0.1257) q[3];
cx q[0], q[3];
// Edge 1-2 (capacity 1)
cx q[1], q[2];
rz(0.1257) q[2];
cx q[1], q[2];
// Edge 1-3 (capacity 6)
cx q[1], q[3];
rz(0.7540) q[3];
cx q[1], q[3];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
// Edge 0-2 (capacity 5)
cx q[0], q[2];
rz(0.6283) q[2];
cx q[0], q[2];
// Edge 0-3 (capacity 1)
cx q[0], q[3];
rz(0.1257) q[3];
cx q[0], q[3];
// Edge 1-2 (capacity 1)
cx q[1], q[2];
rz(0.1257) q[2];
cx q[1], q[2];
// Edge 1-3 (capacity 6)
cx q[1], q[3];
rz(0.7540) q[3];
cx q[1], q[3];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];