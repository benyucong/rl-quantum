OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Initialize qubits with Hadamard gates for superposition
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

// First layer - flow constraints and capacity encoding
// Source node 0 constraints
rz(0.7854) q[0];
rz(0.3927) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];

// Sink node 5 constraints
rz(0.7854) q[4];
rz(0.3927) q[5];
rz(1.1781) q[6];

// Edge capacity constraints
// Edge 0->2 (capacity 1)
cx q[0], q[7];
rz(-0.5236) q[7];
cx q[0], q[7];

// Edge 0->3 (capacity 1)
cx q[1], q[8];
rz(-0.5236) q[8];
cx q[1], q[8];

// Edge 0->4 (capacity 2)
cx q[2], q[9];
rz(-1.0472) q[9];
cx q[2], q[9];

// Edge 0->5 (capacity 2)
cx q[3], q[10];
rz(-1.0472) q[10];
cx q[3], q[10];

// Edge 2->3 (capacity 1)
cx q[4], q[11];
rz(-0.5236) q[11];
cx q[4], q[11];

// Edge 2->5 (capacity 2)
cx q[5], q[12];
rz(-1.0472) q[12];
cx q[5], q[12];

// Second layer - flow conservation and optimization
// Node 1 flow conservation
cx q[6], q[7];
rz(0.3491) q[7];
cx q[6], q[7];

// Node 2 flow conservation
cx q[0], q[8];
cx q[4], q[8];
rz(0.5236) q[8];
cx q[4], q[8];
cx q[0], q[8];

// Node 3 flow conservation
cx q[1], q[9];
cx q[5], q[9];
rz(0.5236) q[9];
cx q[5], q[9];
cx q[1], q[9];

// Node 4 flow conservation
cx q[2], q[10];
rz(0.3491) q[10];
cx q[2], q[10];

// Maximize flow from source to sink
cx q[3], q[11];
cx q[5], q[11];
rz(0.7854) q[11];
cx q[5], q[11];
cx q[3], q[11];

// Final optimization layer
rz(0.1963) q[0];
rz(0.0982) q[1];
rz(0.2945) q[2];
rz(0.2945) q[3];
rz(0.1963) q[4];
rz(0.0982) q[5];
rz(0.2945) q[6];
rz(0.0873) q[7];
rz(0.1309) q[8];
rz(0.1309) q[9];
rz(0.0873) q[10];
rz(0.1963) q[11];
rz(0.1309) q[12];

// Measurements
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