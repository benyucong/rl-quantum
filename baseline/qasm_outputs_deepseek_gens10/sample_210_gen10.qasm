OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

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
h q[12];

// Layer 2: Capacity constraints and flow conservation
// Edge 0->4 (capacity 3)
rz(0.7854) q[0];
rz(0.7854) q[4];
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];

// Edge 0->5 (capacity 2)
rz(0.5236) q[0];
rz(0.5236) q[5];
cx q[0], q[5];
rz(0.2618) q[5];
cx q[0], q[5];

// Edge 1->2 (capacity 1)
rz(1.0472) q[1];
rz(1.0472) q[2];
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];

// Edge 2->3 (capacity 1)
rz(1.0472) q[2];
rz(1.0472) q[3];
cx q[2], q[3];
rz(0.5236) q[3];
cx q[2], q[3];

// Edge 3->5 (capacity 1)
rz(1.0472) q[3];
rz(1.0472) q[5];
cx q[3], q[5];
rz(0.5236) q[5];
cx q[3], q[5];

// Edge 4->2 (capacity 3)
rz(0.7854) q[4];
rz(0.7854) q[2];
cx q[4], q[2];
rz(0.3927) q[2];
cx q[4], q[2];

// Edge 4->6 (capacity 1)
rz(1.0472) q[4];
rz(1.0472) q[6];
cx q[4], q[6];
rz(0.5236) q[6];
cx q[4], q[6];

// Edge 5->2 (capacity 1)
rz(1.0472) q[5];
rz(1.0472) q[2];
cx q[5], q[2];
rz(0.5236) q[2];
cx q[5], q[2];

// Edge 5->3 (capacity 2)
rz(0.5236) q[5];
rz(0.5236) q[3];
cx q[5], q[3];
rz(0.2618) q[3];
cx q[5], q[3];

// Layer 3: Flow conservation constraints
// Source node 0
rz(0.3491) q[0];
rz(0.3491) q[4];
rz(0.3491) q[5];
cx q[0], q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.1745) q[7];
cx q[5], q[7];
cx q[4], q[7];
cx q[0], q[7];

// Sink node 6
rz(0.3491) q[6];
cx q[6], q[8];
rz(0.1745) q[8];
cx q[6], q[8];

// Intermediate nodes
// Node 1
rz(0.3491) q[1];
rz(0.3491) q[2];
cx q[1], q[9];
cx q[2], q[9];
rz(0.1745) q[9];
cx q[2], q[9];
cx q[1], q[9];

// Node 2
rz(0.3491) q[2];
rz(0.3491) q[3];
rz(0.3491) q[4];
rz(0.3491) q[5];
cx q[2], q[10];
cx q[3], q[10];
cx q[4], q[10];
cx q[5], q[10];
rz(0.0873) q[10];
cx q[5], q[10];
cx q[4], q[10];
cx q[3], q[10];
cx q[2], q[10];

// Node 3
rz(0.3491) q[3];
rz(0.3491) q[5];
cx q[3], q[11];
cx q[5], q[11];
rz(0.1745) q[11];
cx q[5], q[11];
cx q[3], q[11];

// Node 4
rz(0.3491) q[4];
rz(0.3491) q[2];
rz(0.3491) q[6];
cx q[4], q[12];
cx q[2], q[12];
cx q[6], q[12];
rz(0.1163) q[12];
cx q[6], q[12];
cx q[2], q[12];
cx q[4], q[12];

// Layer 4: Final optimization and measurement
rz(0.5236) q[0];
rz(0.5236) q[1];
rz(0.5236) q[2];
rz(0.5236) q[3];
rz(0.5236) q[4];
rz(0.5236) q[5];
rz(0.5236) q[6];
rz(0.5236) q[7];
rz(0.5236) q[8];
rz(0.5236) q[9];
rz(0.5236) q[10];
rz(0.5236) q[11];
rz(0.5236) q[12];

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
c[12] = measure q[12];