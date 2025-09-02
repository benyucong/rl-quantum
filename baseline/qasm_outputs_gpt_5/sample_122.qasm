OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Layer 1: Initialize qubits and apply initial gates
h q[0]; // Source node
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Encoding connections based on the network flow problem
cx q[0], q[2]; // Source to Node 2
cx q[1], q[5]; // Node 1 to Sink
cx q[2], q[5]; // Node 2 to Sink
cx q[4], q[1]; // Node 4 to Node 1
cx q[4], q[3]; // Node 4 to Node 3
cx q[4], q[5]; // Node 4 to Sink

// Layer 2: Phase rotation based on edge capacity
rz(0.2385) q[2]; // Capacity between Node 0 and Node 2
rz(0.3210) q[5]; // Capacity from Node 4 to Sink
rz(0.1763) q[1]; // Capacity from Node 4 to Node 1
rz(0.1532) q[3]; // Capacity from Node 4 to Node 3

// Additional entanglement
cx q[2], q[5]; // Source thru Node 2 to Sink
cx q[3], q[5]; // Node 3 to Sink

// Layer 3: Final entanglement and measurement preparation
h q[0]; // Reapply Hadamard to Source
h q[1]; 
h q[4]; 
h q[5]; 

// Final connections to reflect the flow calculations
cx q[0], q[1];
cx q[4], q[5];
cx q[1], q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];