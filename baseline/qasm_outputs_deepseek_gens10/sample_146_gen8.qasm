OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard on all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Problem-specific phase rotations based on edge weights
// Left partition: qubits 0,1,2; Right partition: qubits 3,4,5,6,7

// Qubit 0 connections: edges to 3 (weight=2), 6 (weight=20)
rz(0.3927) q[0];  // Phase based on weighted connections

// Qubit 1 connections: edges to 4 (weight=5), 6 (weight=20), 3 (weight=12)
rz(0.7854) q[1];  // Phase based on weighted connections

// Qubit 2 connections: edges to 5 (weight=2), 3 (weight=11), 4 (weight=13)
rz(0.6545) q[2];  // Phase based on weighted connections

// Right partition qubits get phase based on their connections
rz(0.5236) q[3];  // Connected to 0,1,2
rz(0.3491) q[4];  // Connected to 1,2
rz(0.0873) q[5];  // Connected to 2
rz(0.7854) q[6];  // Connected to 0,1
rz(0.0) q[7];     // No connections

// Layer 1: Mixer/entangling operations
cx q[0], q[3];
cx q[0], q[6];
cx q[1], q[4];
cx q[1], q[6];
cx q[1], q[3];
cx q[2], q[5];
cx q[2], q[3];
cx q[2], q[4];

// Layer 2: Second set of phase rotations
rz(0.2618) q[0];
rz(0.5236) q[1];
rz(0.4363) q[2];
rz(0.3491) q[3];
rz(0.2182) q[4];
rz(0.0873) q[5];
rz(0.5236) q[6];
rz(0.0) q[7];

// Layer 2: Final mixer/entangling operations
cx q[0], q[3];
cx q[0], q[6];
cx q[1], q[4];
cx q[1], q[6];
cx q[1], q[3];
cx q[2], q[5];
cx q[2], q[3];
cx q[2], q[4];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];