OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialize qubits in state |0> (can be omitted as default state is |0>)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Insert controlled rotations based on the edge capacities
// Mapping the edges and their capacities
cx q[0], q[1]; // 0 -> 1
rz(-0.4328) q[1]; // capacity 3
cx q[0], q[1];

cx q[0], q[2]; // 0 -> 2
rz(-0.7330) q[2]; // capacity 2
cx q[0], q[2];

cx q[0], q[4]; // 0 -> 4
rz(-0.5272) q[4]; // capacity 4
cx q[0], q[4];

cx q[0], q[6]; // 0 -> 6
rz(-0.4357) q[6]; // capacity 3
cx q[0], q[6];

cx q[0], q[8]; // 0 -> 8
rz(-0.6754) q[8]; // capacity 3
cx q[0], q[8];

cx q[1], q[2]; // 1 -> 2
rz(-0.8348) q[2]; // capacity 1
cx q[1], q[2];

cx q[1], q[4]; // 1 -> 4
rz(-0.4922) q[4]; // capacity 2
cx q[1], q[4];

cx q[1], q[5]; // 1 -> 5
rz(-0.6330) q[5]; // capacity 5
cx q[1], q[5];

cx q[1], q[7]; // 1 -> 7
rz(-0.4441) q[7]; // capacity 5
cx q[1], q[7];

cx q[2], q[4]; // 2 -> 4
rz(-0.6781) q[4]; // capacity 2
cx q[2], q[4];

// More connections
cx q[3], q[1]; // 3 -> 1
rz(-0.4955) q[1]; // capacity 2
cx q[3], q[1];

cx q[4], q[1]; // 4 -> 1
rz(-0.4513) q[1]; // capacity 3
cx q[4], q[1];

cx q[4], q[3]; // 4 -> 3
rz(-0.5345) q[3]; // capacity 5
cx q[4], q[3];

cx q[4], q[6]; // 4 -> 6
rz(-0.4638) q[6]; // capacity 2
cx q[4], q[6];

cx q[5], q[4]; // 5 -> 4
rz(-0.4321) q[4]; // capacity 4
cx q[5], q[4];

cx q[5], q[6]; // 5 -> 6
rz(-0.5765) q[6]; // capacity 2
cx q[5], q[6];

cx q[6], q[2]; // 6 -> 2
rz(-0.8483) q[2]; // capacity 1
cx q[6], q[2];

cx q[6], q[3]; // 6 -> 3
rz(-0.7328) q[3]; // capacity 6
cx q[6], q[3];

cx q[6], q[7]; // 6 -> 7
rz(-0.8914) q[7]; // capacity 6
cx q[6], q[7];

cx q[7], q[1]; // 7 -> 1
rz(-0.3327) q[1]; // capacity 6
cx q[7], q[1];

cx q[7], q[2]; // 7 -> 2
rz(-0.6472) q[2]; // capacity 2
cx q[7], q[2];

cx q[7], q[5]; // 7 -> 5
rz(-0.5028) q[5]; // capacity 2
cx q[7], q[5];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];