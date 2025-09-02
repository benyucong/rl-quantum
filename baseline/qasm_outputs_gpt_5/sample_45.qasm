OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 1: Apply entangling gates
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];

// Layer 2: Apply rotation gates
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];

// Layer 3: Further entangling
cx q[3], q[0];
cx q[3], q[1];
cx q[2], q[3];

// Layer 4: Final rotations
rz(1.0) q[0];
rz(1.0) q[1];
rz(1.0) q[2];
rz(1.0) q[3];

// Measure qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];