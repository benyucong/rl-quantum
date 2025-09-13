OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];

// Edge capacity encoding rotations
rz(0.7854) q[0];  // Edge 0→1 (capacity 1)
rz(0.7854) q[1];  // Edge 0→2 (capacity 1)
rz(1.1107) q[2];  // Edge 0→4 (capacity 2)
rz(0.7854) q[3];  // Edge 1→6 (capacity 1)
rz(1.1107) q[4];  // Edge 2→1 (capacity 2)
rz(0.7854) q[5];  // Edge 2→4 (capacity 1)
rz(0.7854) q[6];  // Edge 3→5 (capacity 1)
rz(1.1107) q[7];  // Edge 4→2 (capacity 2)
rz(0.7854) q[8];  // Edge 4→6 (capacity 1)
rz(0.7854) q[9];  // Edge 5→1 (capacity 1)
rz(0.7854) q[10]; // Edge 5→3 (capacity 1)

// Flow conservation constraints
cx q[0], q[11];   // Source node 0 constraint
cx q[1], q[11];
cx q[2], q[11];
cx q[3], q[12];   // Sink node 6 constraint
cx q[8], q[12];
cx q[4], q[13];   // Node 1 conservation
cx q[9], q[13];
cx q[0], q[13];
rz(0.5236) q[11];
rz(0.5236) q[12];
rz(0.5236) q[13];

// Layer 2: Mixing and optimization
// Reverse flow conservation constraints
cx q[0], q[11];
cx q[1], q[11];
cx q[2], q[11];
cx q[3], q[12];
cx q[8], q[12];
cx q[4], q[13];
cx q[9], q[13];
cx q[0], q[13];

// Mixing Hamiltonian
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];
rx(1.0472) q[8];
rx(1.0472) q[9];
rx(1.0472) q[10];
rx(0.7854) q[11];
rx(0.7854) q[12];
rx(0.7854) q[13];

// Layer 3: Final optimization and measurement
// Re-apply capacity constraints with optimal parameters
rz(0.6545) q[0];
rz(0.6545) q[1];
rz(0.9273) q[2];
rz(0.6545) q[3];
rz(0.9273) q[4];
rz(0.6545) q[5];
rz(0.6545) q[6];
rz(0.9273) q[7];
rz(0.6545) q[8];
rz(0.6545) q[9];
rz(0.6545) q[10];

// Final flow conservation
cx q[0], q[11];
cx q[1], q[11];
cx q[2], q[11];
cx q[3], q[12];
cx q[8], q[12];
cx q[4], q[13];
cx q[9], q[13];
cx q[0], q[13];
rz(0.4363) q[11];
rz(0.4363) q[12];
rz(0.4363) q[13];

// Measurement
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