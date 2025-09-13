OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
// Layer 1: Initialization and flow encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
// Edge constraints and capacity encoding
// Edge 0->3 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(-0.3927) q[3];
cx q[0], q[3];
// Edge 0->4 (capacity 2)
rz(1.0472) q[0];
rz(1.0472) q[4];
cx q[0], q[4];
rz(-0.5236) q[4];
cx q[0], q[4];
// Edge 1->2 (capacity 2)
rz(1.0472) q[1];
rz(1.0472) q[2];
cx q[1], q[2];
rz(-0.5236) q[2];
cx q[1], q[2];
// Edge 1->3 (capacity 1)
rz(0.7854) q[1];
rz(0.7854) q[3];
cx q[1], q[3];
rz(-0.3927) q[3];
cx q[1], q[3];
// Edge 2->1 (capacity 1)
rz(0.7854) q[2];
rz(0.7854) q[1];
cx q[2], q[1];
rz(-0.3927) q[1];
cx q[2], q[1];
// Edge 2->4 (capacity 2)
rz(1.0472) q[2];
rz(1.0472) q[4];
cx q[2], q[4];
rz(-0.5236) q[4];
cx q[2], q[4];
// Edge 3->1 (capacity 1)
rz(0.7854) q[3];
rz(0.7854) q[1];
cx q[3], q[1];
rz(-0.3927) q[1];
cx q[3], q[1];
// Layer 2: Flow conservation and optimization
// Source node 0 flow conservation
rz(1.5708) q[0];
rz(-0.7854) q[3];
rz(-1.0472) q[4];
// Sink node 4 flow conservation
rz(1.0472) q[0];
rz(1.0472) q[2];
rz(-2.0944) q[4];
// Node 1 flow conservation
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(-0.7854) q[1];
rz(-0.7854) q[1];
// Node 2 flow conservation
rz(1.0472) q[1];
rz(-1.0472) q[2];
rz(-1.0472) q[4];
// Node 3 flow conservation
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(-0.7854) q[3];
rz(-0.7854) q[1];
// Final optimization phase
rz(0.5236) q[0];
rz(0.3927) q[1];
rz(0.5236) q[2];
rz(0.3927) q[3];
rz(0.7854) q[4];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];