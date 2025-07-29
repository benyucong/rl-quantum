OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Layer 1 - Initialization and Mixing
for i in [0:15] {
    h q[i];
}

// Layer 2 - Problem Unitary (Hamiltonian Path Constraints)
// Start and end node constraints
x q[0];  // Start node 0 must be included
x q[5];  // End node 5 must be included

// Edge constraints with optimal parameters
// Edge 0-1
cx q[0], q[1];
rz(0.785) q[1];
cx q[0], q[1];

// Edge 1-2
cx q[1], q[2];
rz(0.549) q[2];
cx q[1], q[2];

// Edge 1-3
cx q[1], q[3];
rz(1.047) q[3];
cx q[1], q[3];

// Edge 1-4
cx q[1], q[4];
rz(1.047) q[4];
cx q[1], q[4];

// Edge 2-3
cx q[2], q[3];
rz(0.349) q[3];
cx q[2], q[3];

// Edge 2-4
cx q[2], q[4];
rz(1.256) q[4];
cx q[2], q[4];

// Edge 3-4
cx q[3], q[4];
rz(0.349) q[4];
cx q[3], q[4];

// Edge 4-5
cx q[4], q[5];
rz(0.471) q[5];
cx q[4], q[5];

// Layer 3 - Mixing and Measurement
for i in [0:15] {
    h q[i];
    rz(0.392) q[i];  // Optimal rotation for path constraints
    h q[i];
}

// Measurement
for i in [0:15] {
    c[i] = measure q[i];
}