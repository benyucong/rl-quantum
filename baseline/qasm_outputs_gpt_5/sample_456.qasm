OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[1]; // Encodes capacity from 0 to 1
rz(1.0472) q[1]; // Adjusts amplitude regarding edge capacities
cx q[1], q[3]; // Encodes capacity from 1 to 3
rz(0.7854) q[3]; // Adjusts amplitude regarding edge capacities

cx q[0], q[4]; // Encodes capacity from 0 to 4
rz(0.5236) q[4]; // Adjusts amplitude regarding edge capacities
cx q[0], q[5]; // Encodes capacity from 0 to 5
rz(1.5708) q[5]; // Adjusts amplitude regarding edge capacities

// Layer 2
cx q[1], q[3]; // Further connections from layer 1
rz(0.7854) q[3]; 
cx q[1], q[4]; // Further connections from layer 1
rz(1.0472) q[4]; 

cx q[3], q[2]; // Bridge to sink from intermediate nodes
rz(0.7854) q[2]; 
cx q[4], q[5]; // Further connections to sink
rz(1.0472) q[5]; 

// Layer 3
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