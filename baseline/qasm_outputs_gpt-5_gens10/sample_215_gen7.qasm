OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits to the + state
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 1: Preparing the graph state
cx q[0], q[1]; // edge between node 1 and 2
cx q[0], q[3]; // edge between node 1 and 3
cx q[1], q[3]; // edge between node 2 and 3
cx q[3], q[2]; // edge between node 0 and 3

// Layer 2: Apply rotations to encode the color information
rx(2.0944) q[0]; // rotation for color 1
rx(2.0944) q[1]; // rotation for color 1
rx(2.0944) q[2]; // rotation for color 1
rx(2.0944) q[3]; // rotation for color 1

// Layer 3: Entangling pairs for inter-color interactions
cx q[0], q[1]; 
cx q[2], q[3]; 
cx q[0], q[2]; 
cx q[1], q[3];

// Layer 4: Finalize encoding and prepare for measurement
h q[0];
h q[1];
h q[2];
h q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];

// Measure auxiliary qubits to validate the output state
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];

// Final output measures
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];