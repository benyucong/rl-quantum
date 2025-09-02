OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initialize state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Encoding edges with RZ rotations based on edge capacities
rz(0.4636) q[0]; // from source 0 to 2
rz(0.4636) q[0]; // from source 0 to 6
rz(0.4636) q[1]; // from node 1 to 3
rz(0.4636) q[2]; // from node 2 to 4
rz(0.4636) q[3]; // from node 3 to 1
rz(0.4636) q[3]; // from node 3 to 2
rz(0.4636) q[3]; // from node 3 to 4
rz(0.4636) q[5]; // from node 5 to 1

// Layer 2: Apply controlled rotations for edges
cx q[0], q[2];
cx q[0], q[6];
cx q[1], q[3];
cx q[2], q[4];
cx q[3], q[1];
cx q[3], q[2];
cx q[3], q[4];
cx q[5], q[1];

// Layer 3: Final rotations and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.0764) q[0];
rz(0.0764) q[1];
rz(0.0764) q[2];
rz(0.0764) q[3];
rz(0.0764) q[4];
rz(0.0764) q[5];
rz(0.0764) q[6];

// Measure the qubits to get final min-cut
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];