OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
// Layer 1: Initialization and flow constraints
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Edge constraints with optimal parameters
// Edge 0->3 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(-0.3927) q[3];
cx q[0], q[3];
// Edge 1->6 (capacity 2)
rz(1.1781) q[1];
rz(1.1781) q[6];
cx q[1], q[6];
rz(-0.5890) q[6];
cx q[1], q[6];
// Edge 2->4 (capacity 1)
rz(0.7854) q[2];
rz(0.7854) q[4];
cx q[2], q[4];
rz(-0.3927) q[4];
cx q[2], q[4];
// Edge 2->6 (capacity 1)
rz(0.7854) q[2];
rz(0.7854) q[6];
cx q[2], q[6];
rz(-0.3927) q[6];
cx q[2], q[6];
// Edge 3->1 (capacity 1)
rz(0.7854) q[3];
rz(0.7854) q[1];
cx q[3], q[1];
rz(-0.3927) q[1];
cx q[3], q[1];
// Edge 3->6 (capacity 1)
rz(0.7854) q[3];
rz(0.7854) q[6];
cx q[3], q[6];
rz(-0.3927) q[6];
cx q[3], q[6];
// Edge 5->3 (capacity 2)
rz(1.1781) q[5];
rz(1.1781) q[3];
cx q[5], q[3];
rz(-0.5890) q[3];
cx q[5], q[3];
// Layer 2: Flow conservation and optimization
// Source node 0 constraint
rz(1.5708) q[0];
// Sink node 6 constraint
rz(1.5708) q[6];
// Intermediate nodes conservation
// Node 1: in-degree 1, out-degree 1
rz(0.7854) q[1];
// Node 2: in-degree 0, out-degree 2
rz(1.5708) q[2];
// Node 3: in-degree 2, out-degree 2
rz(1.5708) q[3];
// Node 4: in-degree 1, out-degree 0
rz(0.7854) q[4];
// Node 5: in-degree 0, out-degree 1
rz(0.7854) q[5];
// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];