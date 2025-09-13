OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialization and first mixing
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
h q[10];
h q[11];

// Capacity constraints for edges (layer 1)
// Edge 0->3 (capacity 2)
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(-0.3927) q[3];
cx q[0], q[3];

// Edge 0->5 (capacity 1)
rz(0.5236) q[0];
rz(0.5236) q[5];
cx q[0], q[5];
rz(-0.2618) q[5];
cx q[0], q[5];

// Edge 1->2 (capacity 1)
rz(0.5236) q[1];
rz(0.5236) q[2];
cx q[1], q[2];
rz(-0.2618) q[2];
cx q[1], q[2];

// Edge 1->4 (capacity 1)
rz(0.5236) q[1];
rz(0.5236) q[4];
cx q[1], q[4];
rz(-0.2618) q[4];
cx q[1], q[4];

// Edge 3->1 (capacity 2)
rz(0.7854) q[3];
rz(0.7854) q[1];
cx q[3], q[1];
rz(-0.3927) q[1];
cx q[3], q[1];

// Edge 3->5 (capacity 2)
rz(0.7854) q[3];
rz(0.7854) q[5];
cx q[3], q[5];
rz(-0.3927) q[5];
cx q[3], q[5];

// Edge 4->1 (capacity 1)
rz(0.5236) q[4];
rz(0.5236) q[1];
cx q[4], q[1];
rz(-0.2618) q[1];
cx q[4], q[1];

// Edge 4->2 (capacity 2)
rz(0.7854) q[4];
rz(0.7854) q[2];
cx q[4], q[2];
rz(-0.3927) q[2];
cx q[4], q[2];

// Layer 2: Second mixing with flow conservation
// Source node 0 constraint
rz(1.0472) q[0];
h q[0];
rz(1.0472) q[0];
h q[0];

// Sink node 5 constraint
rz(1.0472) q[5];
h q[5];
rz(1.0472) q[5];
h q[5];

// Intermediate nodes flow conservation
// Node 1: in-degree 2, out-degree 2
rz(1.0472) q[1];
h q[1];
rz(1.0472) q[1];
h q[1];

// Node 2: in-degree 2, out-degree 0
rz(0.7854) q[2];
h q[2];
rz(0.7854) q[2];
h q[2];

// Node 3: in-degree 1, out-degree 2
rz(1.3089) q[3];
h q[3];
rz(1.3089) q[3];
h q[3];

// Node 4: in-degree 1, out-degree 2
rz(1.3089) q[4];
h q[4];
rz(1.3089) q[4];
h q[4];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];