OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initialize qubits
h q[0]; // Source qubit
h q[1]; // Node 1
h q[2]; // Node 2
h q[3]; // Node 3
h q[4]; // Node 4
h q[5]; // Sink qubit
h q[6]; // Ancilla qubit 1
h q[7]; // Ancilla qubit 2
h q[8]; // Ancilla qubit 3
h q[9]; // Ancilla qubit 4

// First layer of operations
cx q[0], q[4]; // Source to Node 4
cx q[1], q[4]; // Node 1 to Node 4
cx q[2], q[3]; // Node 2 to Node 3
cx q[2], q[4]; // Node 2 to Node 4
cx q[2], q[5]; // Node 2 to Sink
cx q[3], q[2]; // Node 3 to Node 2
cx q[4], q[5]; // Node 4 to Sink

// Second layer of operations
rz(0.5236) q[0]; // Apply some rotation
rz(0.7854) q[1]; // Rotate Node 1
rz(1.0472) q[2]; // Rotate Node 2
rz(0.2618) q[3]; // Rotate Node 3
rz(0.5236) q[4]; // Rotate Node 4
rz(0.7854) q[5]; // Rotate Sink
rz(1.0472) q[6]; // Ancilla rotation 1
rz(0.2618) q[7]; // Ancilla rotation 2
rz(0.5236) q[8]; // Ancilla rotation 3
rz(0.7854) q[9]; // Ancilla rotation 4

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