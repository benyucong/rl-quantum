OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize the qubits
h q[0];  // Hadamard on qubit 0
h q[1];  // Hadamard on qubit 1
h q[2];  // Hadamard on qubit 2
h q[3];  // Hadamard on qubit 3

// Layer 2: Entangling operations
cx q[0], q[2];  // Control qubit 0, target qubit 2
cx q[1], q[3];  // Control qubit 1, target qubit 3
cx q[2], q[1];  // Control qubit 2, target qubit 1
cx q[2], q[3];  // Control qubit 2, target qubit 3

// Layer 3: Rotate and finalize
rz(0.5) q[0];  // Rotation on qubit 0
rz(1.0) q[1];  // Rotation on qubit 1
rz(1.5) q[2];  // Rotation on qubit 2
rz(2.0) q[3];  // Rotation on qubit 3

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];