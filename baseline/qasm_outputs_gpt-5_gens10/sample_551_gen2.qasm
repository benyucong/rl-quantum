OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialization and preprocessing
h q[0];  // Prepare qubit 0
h q[1];  // Prepare qubit 1
h q[2];  // Prepare qubit 2
h q[3];  // Prepare qubit 3
h q[4];  // Prepare qubit 4
h q[5];  // Prepare qubit 5

// Entanglement based on edges and capacities
cx q[0], q[5];  // Edge (0->5), capacity 4
rz(-0.1592) q[5];  // Phase shift for edge (0->5)

cx q[1], q[3];  // Edge (1->3), capacity 2
rz(-0.2513) q[3];  // Phase shift for edge (1->3)

cx q[2], q[4];  // Edge (2->4), capacity 2
rz(-0.2513) q[4];  // Phase shift for edge (2->4)

cx q[3], q[2];  // Edge (3->2), capacity 5
rz(-0.3880) q[2];  // Phase shift for edge (3->2)

cx q[3], q[5];  // Edge (3->5), capacity 1
rz(-0.4636) q[5];  // Phase shift for edge (3->5)

cx q[4], q[3];  // Edge (4->3), capacity 4
rz(-0.5390) q[3];  // Phase shift for edge (4->3)

// Layer 2: Final adjustments
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];