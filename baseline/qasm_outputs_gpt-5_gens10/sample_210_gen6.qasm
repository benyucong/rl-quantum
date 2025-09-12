OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1 - Initializing qubits
h q[0]; // Source qubit
h q[1]; // Additional qubit
h q[2]; // Additional qubit
h q[3]; // Additional qubit
h q[4]; // Node 4 qubit
h q[5]; // Node 5 qubit
h q[6]; // Sink qubit

// Layer 2 - Encoding edges with CX gates based on capacities
cx q[0], q[4]; // Edge 0 -> 4
cx q[0], q[5]; // Edge 0 -> 5
cx q[1], q[2]; // Edge 1 -> 2
cx q[2], q[3]; // Edge 2 -> 3
cx q[3], q[5]; // Edge 3 -> 5
cx q[4], q[2]; // Edge 4 -> 2
cx q[4], q[6]; // Edge 4 -> 6
cx q[5], q[2]; // Edge 5 -> 2
cx q[5], q[3]; // Edge 5 -> 3

// Layer 3 - Applying rotations for capacity representation
rz(1.5708) q[0]; // Rotation for source
rz(1.1708) q[1]; // Rotation for qubit 1
rz(1.5708) q[2]; // Rotation for qubit 2
rz(1.5708) q[3]; // Rotation for qubit 3
rz(1.3708) q[4]; // Rotation for qubit 4
rz(1.5708) q[5]; // Rotation for qubit 5
rz(1.5708) q[6]; // Rotation for sink

// Layer 4 - Finalizing and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];