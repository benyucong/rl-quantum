OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits to superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of gates
rx(1.5708) q[0]; // Prepare qubit for source node 0
cx q[0], q[1];   // Connect to node 1
rz(0.2462) q[1]; // Adjust phase for node 1
rx(1.5708) q[2]; // Prepare qubit for source node 0 to node 2
cx q[0], q[2];   // Connect to node 2
rz(0.1850) q[2]; // Adjust phase for node 2
cx q[1], q[6];   // Connect node 1 to node 6
rz(0.1354) q[6]; // Phase adjustment for node 6
cx q[2], q[5];   // Connect node 2 to node 5
rz(0.1761) q[5]; // Phase adjustment for node 5

// Second layer of gates
h q[3];           // Prepare node 3
h q[4];           // Prepare node 4
h q[5];           // Prepare node 5
h q[6];           // Prepare node 6
h q[7];           // Prepare sink node 7

cx q[5], q[3];   // Connect node 5 to node 3
rz(0.0753) q[3]; // Phase adjustment for node 3
cx q[3], q[7];   // Connect node 3 to sink node 7
rz(0.0642) q[7]; // Phase adjustment for sink node 7
cx q[5], q[4];   // Connect node 5 to node 4
rz(0.0701) q[4]; // Phase adjustment for node 4
cx q[6], q[1];   // Connect node 6 to node 1
rz(0.0737) q[1]; // Phase adjustment for node 1
cx q[6], q[5];   // Connect node 6 to node 5
rz(0.0599) q[5]; // Adjust phase for node 5

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];