OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialization and entanglement
h q[0];  // Prepare source qubit in superposition
h q[1];  // Prepare qubit that connects to node 1
h q[2];  // Prepare qubit that connects to node 2
h q[3];  // Prepare qubit that connects to node 3
h q[4];  // Prepare qubit that connects to node 4
h q[5];  // Prepare qubit that connects to node 5
h q[6];  // Prepare qubit that connects to node 6
h q[7];  // Prepare sink qubit in superposition

// Entangling connections based on edges with capacity
cx q[0], q[1];  // Connect source to node 1
cx q[0], q[3];  // Connect source to node 3
cx q[0], q[5];  // Connect source to node 5
cx q[1], q[2];  // Node 1 to Node 2
cx q[3], q[4];  // Node 3 to Node 4
cx q[5], q[2];  // Node 5 to Node 2
cx q[5], q[3];  // Node 5 to Node 3
cx q[5], q[6];  // Node 5 to Node 6
cx q[5], q[7];  // Node 5 to sink
cx q[6], q[4];  // Node 6 to Node 4

// Layer 2: Apply parameterized rotations
rz(0.5) q[0];
rz(0.8) q[1];
rz(0.3) q[2];
rz(0.9) q[3];
rz(0.6) q[4];
rz(0.7) q[5];
rz(0.4) q[6];
rz(0.2) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];