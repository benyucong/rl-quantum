OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize states
h q[0]; // Superposition on source
h q[1]; // Superposition on node 1
h q[2]; // Superposition on node 2
h q[3]; // Superposition on node 3
h q[4]; // Superposition on node 4
h q[5]; // Superposition on sink

// Layer 2: Apply controlled rotations based on edges (weighted by capacity)
rx(0.5) q[0]; // Encoding edge weights starting from source
cx q[0], q[1]; // Source to node 1
rz(0.3) q[1]; // Capacity based rotation
cx q[0], q[3]; // Source to node 3
rz(0.2) q[3]; // Capacity based rotation
cx q[0], q[4]; // Source to node 4
rz(0.2) q[4]; // Capacity based rotation
cx q[0], q[5]; // Source to sink 
rz(0.4) q[5]; // Capacity based rotation

// Layer 3: Final entangling operations to consolidate states
cx q[1], q[3]; // Node 1 to Node 3
rz(0.1) q[3]; // Capacity based rotation
cx q[1], q[4]; // Node 1 to Node 4
rz(0.1) q[4]; // Capacity based rotation
cx q[3], q[5]; // Consolidate with the sink
rz(0.3) q[5]; // Final adjustment towards sink

// Measure the qubits to read the final configuration of the min cut
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];