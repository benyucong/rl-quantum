OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Prepare initial states
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Encoding edges with controlled rotations based on capacities
// Edge: 0 -> 3 (capacity 1)
rx(1.5708) q[0]; // rotation based on capacity
cx q[0], q[3];

// Edge: 0 -> 4 (capacity 2)
rx(1.5708) q[0]; // rotation based on capacity
cx q[0], q[4];

// Edge: 1 -> 2 (capacity 2)
rx(1.5708) q[1]; // rotation based on capacity
cx q[1], q[2];

// Edge: 1 -> 3 (capacity 1)
rx(1.5708) q[1]; // rotation based on capacity
cx q[1], q[3];

// Edge: 2 -> 4 (capacity 2)
rx(1.5708) q[2]; // rotation based on capacity
cx q[2], q[4];

// Edge: 3 -> 1 (capacity 1)
rx(1.5708) q[3]; // rotation based on capacity
cx q[3], q[1];

// Layer 2: Apply entangling operations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Entangling the outputs
cx q[3], q[1];
cx q[2], q[4];

// Final rotations to measure the flow
rz(0.5) q[4]; 
rz(-0.5) q[3];

// Measure the final states
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];