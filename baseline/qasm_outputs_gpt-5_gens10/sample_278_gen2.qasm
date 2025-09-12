OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0]; // Initialize source qubit
h q[1]; // Prepare other qubits
h q[2];
h q[3]; 
h q[4]; 
h q[5]; 
h q[6];
h q[7];

// Apply controlled rotations based on edge capacities
cx q[0], q[1]; // Capacity 1 from 0 to 1
rz(1.0) q[1];
cx q[0], q[2]; // Capacity 1 from 0 to 2
rz(1.0) q[2];
cx q[0], q[7]; // Capacity 6 from 0 to 7
rz(0.5) q[7];

cx q[1], q[3]; // Capacity 2 from 1 to 3
rz(1.5) q[3];
cx q[1], q[5]; // Capacity 2 from 1 to 5
rz(1.5) q[5];
cx q[1], q[7]; // Capacity 6 from 1 to 7
rz(0.5) q[7];

cx q[3], q[1]; // Feedback edge to enforce risk
rz(1.2) q[1];
cx q[3], q[2]; // Capacity 2 from 3 to 2
rz(1.2) q[2];

cx q[5], q[1]; // Capacity 4 from 5 to 1
rz(2.5) q[1];
cx q[5], q[2]; // Capacity 7 from 5 to 2
rz(2.5) q[2];
cx q[5], q[6]; // Capacity 7 from 5 to 6
rz(2.5) q[6];

cx q[6], q[1]; // Capacity 2 from 6 to 1
rz(1.5) q[1];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3]; 
h q[4]; 
h q[5]; 
h q[6];
h q[7];

// Apply controlled rotations based on results
cx q[1], q[3]; // Enforce capacity decisions
rz(1.5) q[3];
cx q[1], q[5]; // Further connections
rz(1.5) q[5];

cx q[3], q[7]; // Min cut impact
rz(0.5) q[7];

h q[0]; // Final rotations
rz(1.0) q[0];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];