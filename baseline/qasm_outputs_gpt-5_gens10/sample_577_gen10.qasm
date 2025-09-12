OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits to the zero state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Create entanglement
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[3];
cx q[2], q[5];

// Layer 2: Apply rotation gates
rz(1.047) q[0]; // π/3
rz(1.047) q[1]; // π/3
rz(1.047) q[2]; // π/3
rz(1.047) q[3]; // π/3
rz(1.047) q[4]; // π/3
rz(1.047) q[5]; // π/3

// Layer 3: More entanglement
cx q[0], q[4];
cx q[1], q[5];
cx q[2], q[4];
cx q[3], q[5];

// Layer 4: Final rotation gates
rz(-1.047) q[0];
rz(-1.047) q[1];
rz(-1.047) q[2];
rz(-1.047) q[3];
rz(-1.047) q[4];
rz(-1.047) q[5];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];