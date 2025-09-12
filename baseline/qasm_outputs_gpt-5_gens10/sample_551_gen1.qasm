OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Encoding the min-cut problem
cx q[0], q[5]; // Source to sink direct connection (capacity = 4)
rz(-0.2793) q[5]; // Phase adjustment for edge 

cx q[1], q[3]; // Channel 1 to node 3 (capacity = 2)
rz(0.8203) q[3]; // Phase adjustment   

cx q[2], q[4]; // Channel 2 to node 4 (capacity = 2)
rz(-0.3068) q[4]; // Phase adjustment

cx q[3], q[2]; // Backflow edge between nodes (capacity = 5)
rz(0.1112) q[2]; // Phase adjustment 

cx q[3], q[5]; // Channel from node 3 to sink (capacity = 1)
rz(-0.5942) q[5]; // Phase adjustment

cx q[4], q[3]; // Channel from node 4 back to 3 (capacity = 4)
rz(-0.7348) q[3]; // Phase adjustment 

// Layer 2: Apply Hadamard again to finish encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];