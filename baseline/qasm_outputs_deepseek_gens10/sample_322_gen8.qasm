OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
// Layer 1: Initialization and Hadamard gates
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
// Layer 2: Flow constraints and capacity encoding
// Source constraint (node 0)
rz(0.7854) q[0];
// Sink constraint (node 5)
rz(1.0472) q[5];
// Edge capacity constraints
rz(0.5236) q[6];  // Edge 0->5 (capacity 2)
rz(0.5236) q[7];  // Edge 2->3 (capacity 2)
rz(0.7854) q[8];  // Edge 3->1 (capacity 3)
rz(0.2618) q[9];  // Edge 3->2 (capacity 1)
rz(0.7854) q[10]; // Edge 3->5 (capacity 3)
rz(0.5236) q[11]; // Edge 4->2 (capacity 2)
// Layer 3: Flow conservation constraints
// Node 1 conservation
cx q[8], q[1];
rz(-0.3927) q[1];
cx q[8], q[1];
// Node 2 conservation
cx q[7], q[2];
cx q[9], q[2];
cx q[11], q[2];
rz(-0.5236) q[2];
cx q[11], q[2];
cx q[9], q[2];
cx q[7], q[2];
// Node 3 conservation
cx q[7], q[3];
cx q[8], q[3];
cx q[9], q[3];
cx q[10], q[3];
rz(-0.6545) q[3];
cx q[10], q[3];
cx q[9], q[3];
cx q[8], q[3];
cx q[7], q[3];
// Node 4 conservation
cx q[11], q[4];
rz(-0.2618) q[4];
cx q[11], q[4];
// Layer 4: Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
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