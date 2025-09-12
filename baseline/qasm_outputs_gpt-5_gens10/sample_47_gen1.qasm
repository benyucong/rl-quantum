OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of entangling gates to create correlations based on community structure
cx q[0], q[2]; // Connecting node 0 to 2
cx q[1], q[2]; // Connecting node 1 to 2
cx q[1], q[3]; // Connecting node 1 to 3
cx q[2], q[3]; // Connecting node 2 to 3
cx q[2], q[4]; // Connecting node 2 to 4
cx q[3], q[5]; // Connecting node 3 to 5
cx q[3], q[7]; // Connecting node 3 to 7
cx q[4], q[5]; // Connecting node 4 to 5
cx q[4], q[6]; // Connecting node 4 to 6
cx q[5], q[6]; // Connecting node 5 to 6
cx q[5], q[7]; // Connecting node 5 to 7

// Optional rotation gates to optimize community detection encoding
rz(0.5) q[0]; 
rz(0.5) q[1]; 
rz(0.5) q[2]; 
rz(0.5) q[3]; 
rz(0.5) q[4]; 
rz(0.5) q[5]; 
rz(0.5) q[6]; 
rz(0.5) q[7]; 

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];