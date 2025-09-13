OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialization and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1: Problem Hamiltonian (max flow constraints)
// Edge constraints with capacities
rz(0.7854) q[0];  // Edge 0->3 (capacity 1)
rz(1.5708) q[1];  // Edge 1->6 (capacity 2)
rz(0.7854) q[2];  // Edge 2->4 (capacity 1)
rz(0.7854) q[3];  // Edge 2->6 (capacity 1)
rz(0.7854) q[4];  // Edge 3->1 (capacity 1)
rz(0.7854) q[5];  // Edge 3->6 (capacity 1)
rz(1.5708) q[6];  // Edge 5->3 (capacity 2)

// Flow conservation constraints
cx q[0], q[7];  // Source constraint (node 0)
rz(-0.3927) q[7];
cx q[0], q[7];

cx q[1], q[8];  // Sink constraint (node 6)
rz(0.3927) q[8];
cx q[1], q[8];

// Layer 2: Mixing Hamiltonian
h q[0];
rz(1.1781) q[0];
h q[0];
h q[1];
rz(1.1781) q[1];
h q[1];
h q[2];
rz(1.1781) q[2];
h q[2];
h q[3];
rz(1.1781) q[3];
h q[3];
h q[4];
rz(1.1781) q[4];
h q[4];
h q[5];
rz(1.1781) q[5];
h q[5];
h q[6];
rz(1.1781) q[6];
h q[6];
h q[7];
rz(1.1781) q[7];
h q[7];
h q[8];
rz(1.1781) q[8];
h q[8];

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