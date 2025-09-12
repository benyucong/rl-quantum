OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Entangling qubits based on maximum bipartite graph edges
cx q[0], q[7]; // 0 -> 7
cx q[0], q[10]; // 0 -> 10
cx q[1], q[8]; // 1 -> 8
cx q[2], q[9]; // 2 -> 9
cx q[2], q[12]; // 2 -> 12
cx q[3], q[10]; // 3 -> 10
cx q[3], q[9]; // 3 -> 9
cx q[3], q[12]; // 3 -> 12
cx q[4], q[11]; // 4 -> 11
cx q[5], q[12]; // 5 -> 12
cx q[6], q[7]; // 6 -> 7

// Inversion of input
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2 - Applying rotations based on weights
rz(-0.1432) q[0]; // Weight of edges
rz(-0.4650) q[0]; // Weight of edges
rz(-0.0866) q[1];
rz(-0.1502) q[2];
rz(-0.2390) q[3];
rz(-0.0349) q[4];
rz(-0.1186) q[5];
rz(-0.1892) q[6];

// Finalize with measurements
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];