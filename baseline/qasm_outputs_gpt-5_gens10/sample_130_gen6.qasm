OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0]; // Prepare source node
h q[1]; // Prepare intermediate nodes
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7]; // Prepare sink node

// Apply controlled operations to propagate the flow of capacity
cx q[0], q[2]; // 0 -> 2
rz(0.4545) q[2];
cx q[0], q[7]; // 0 -> 7
rz(0.1234) q[7];
cx q[2], q[4]; // 2 -> 4
rz(0.3456) q[4];
cx q[4], q[1]; // 4 -> 1
rz(0.2568) q[1];
cx q[4], q[3]; // 4 -> 3
rz(0.5678) q[3];
cx q[4], q[5]; // 4 -> 5
rz(0.6789) q[5];
cx q[4], q[6]; // 4 -> 6
rz(0.7890) q[6];
cx q[4], q[7]; // 4 -> 7
rz(0.8901) q[7];

// Layer 2
h q[0]; // Prepare source node again
h q[1]; // Prepare intermediate nodes again
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7]; // Prepare sink node again

// Apply controlled operations to incorporate decisions
cx q[0], q[2]; // 0 -> 2
rz(-0.1234) q[2];
cx q[0], q[7]; // 0 -> 7
rz(-0.5678) q[7];
cx q[2], q[4]; // 2 -> 4
rz(-0.4567) q[4];
cx q[4], q[1]; // 4 -> 1
rz(-0.2345) q[1];
cx q[4], q[3]; // 4 -> 3
rz(-0.6789) q[3];
cx q[4], q[5]; // 4 -> 5
rz(-0.0987) q[5];
cx q[4], q[6]; // 4 -> 6
rz(-0.7890) q[6];
cx q[4], q[7]; // 4 -> 7
rz(-0.3456) q[7];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];