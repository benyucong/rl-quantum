OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1 - Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2 - Apply controlled rotations based on the graph edges
cx q[0], q[3];  // edge (0,3)
rz(0.2) q[3];
cx q[0], q[3];

cx q[0], q[4];  // edge (0,4)
rz(0.2) q[4];
cx q[0], q[4];

cx q[1], q[4];  // edge (1,4)
rz(0.2) q[4];
cx q[1], q[4];

cx q[2], q[4];  // edge (2,4)
rz(0.2) q[4];
cx q[2], q[4];

cx q[3], q[4];  // edge (3,4)
rz(0.2) q[4];
cx q[3], q[4];

// Layer 3 - Finalize state with more rotations
rz(-0.1) q[0];
rz(-0.1) q[1];
rz(-0.1) q[2];
rz(-0.1) q[3];
rz(-0.1) q[4];

// Layer 4 - Hadamard transform again
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];