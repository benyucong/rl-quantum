OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
// Layer 1: Initialization and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge constraints with optimal parameters
// Edge 0->4 (capacity 1)
cx q[0], q[4];
rz(-0.2145) q[4];
cx q[0], q[4];
// Edge 1->4 (capacity 2)
cx q[1], q[4];
rz(-0.4289) q[4];
cx q[1], q[4];
// Edge 2->3 (capacity 1)
cx q[2], q[3];
rz(-0.2145) q[3];
cx q[2], q[3];
// Edge 2->4 (capacity 1)
cx q[2], q[4];
rz(-0.2145) q[4];
cx q[2], q[4];
// Edge 2->5 (capacity 2)
cx q[2], q[5];
rz(-0.4289) q[5];
cx q[2], q[5];
// Edge 3->2 (capacity 1)
cx q[3], q[2];
rz(-0.2145) q[2];
cx q[3], q[2];
// Edge 4->5 (capacity 2)
cx q[4], q[5];
rz(-0.4289) q[5];
cx q[4], q[5];
// Layer 2: Mixing and optimization
h q[0];
rz(0.8578) q[0];
h q[0];
h q[1];
rz(0.8578) q[1];
h q[1];
h q[2];
rz(0.8578) q[2];
h q[2];
h q[3];
rz(0.8578) q[3];
h q[3];
h q[4];
rz(0.8578) q[4];
h q[4];
h q[5];
rz(0.8578) q[5];
h q[5];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];