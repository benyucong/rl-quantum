OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Applying Hadamard gates to the left bipartite nodes
h q[0];
h q[1];
h q[2];

// Layer 2: Entangling operations based on graph edges
cx q[0], q[3]; // Edge 0-3
rx(1.2) q[0]; 
cx q[0], q[4]; // Edge 0-4
rx(1.4) q[0]; 
cx q[0], q[5]; // Edge 0-5
rx(1.1) q[0];
cx q[1], q[4]; // Edge 1-4
rx(0.9) q[1];
cx q[2], q[5]; // Edge 2-5
rx(1.3) q[2];
cx q[2], q[4]; // Edge 2-4
rx(1.0) q[2];
cx q[2], q[3]; // Edge 2-3
rx(1.5) q[2];
cx q[2], q[7]; // Edge 2-7
rx(0.8) q[2];

// Layer 3: Final Hadamard gates on left nodes and measurements
h q[0];
h q[1];
h q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];