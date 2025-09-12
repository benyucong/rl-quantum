OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1
h q[0]; // Initialize source qubit
h q[1]; 
h q[2]; 
h q[3]; 
h q[4]; 
h q[5]; 

// Layer 2 (First set of entangling gates)
cx q[0], q[5]; // Connect source to sink
rz(1.5708) q[0]; // Control phase

cx q[2], q[3]; // Interconnecting the middle nodes
rz(1.5708) q[2];

cx q[3], q[1]; // Connect middle node 3 to the target
rz(1.5708) q[3];

cx q[3], q[2]; // Cross connect
rz(1.5708) q[3];

cx q[3], q[5]; // Add direct connection from middle node to sink
rz(1.5708) q[3];

// Layer 3 (Second set of entangling gates)
cx q[4], q[2]; // Connect from node 4 to 2
rz(1.5708) q[4];

cx q[2], q[3]; // Reinforce middle nodes connection
rz(1.5708) q[2];

cx q[0], q[3]; // Source to middle node 3
rz(1.5708) q[0];

// Layer 4 (Final adjustments and measurements)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];