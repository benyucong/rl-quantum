OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Mixing Hamiltonian
// Edge 0-1 (capacity 1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge 0-3 (capacity 1)
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Edge 0-4 (capacity 2)
cx q[0], q[4];
rz(1.5708) q[4];
cx q[0], q[4];

// Edge 0-6 (capacity 1)
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];

// Edge 1-3 (capacity 1)
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

// Edge 1-4 (capacity 1)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Edge 1-5 (capacity 2)
cx q[1], q[5];
rz(1.5708) q[5];
cx q[1], q[5];

// Edge 2-5 (capacity 2)
cx q[2], q[5];
rz(1.5708) q[5];
cx q[2], q[5];

// Edge 2-6 (capacity 2)
cx q[2], q[6];
rz(1.5708) q[6];
cx q[2], q[6];

// Edge 3-2 (capacity 1)
cx q[3], q[2];
rz(0.7854) q[2];
cx q[3], q[2];

// Edge 5-3 (capacity 1)
cx q[5], q[3];
rz(0.7854) q[3];
cx q[5], q[3];

// Layer 2 - Cost Hamiltonian
// Source constraint (node 0)
rz(0.5236) q[0];

// Sink constraint (node 6)
rz(-0.5236) q[6];

// Layer 3 - Final mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];