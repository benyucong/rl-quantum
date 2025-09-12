OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Initialize qubits to |+⟩ state
h q[0];
h q[1];
h q[2];
h q[3];

// Apply entangling gates
cx q[0], q[2];
cx q[1], q[2];
cx q[1], q[3];

// Apply rotation gates for optimal parameters
rx(1.2345) q[0];
ry(0.5678) q[1];
rz(0.1234) q[2];
ry(1.6789) q[3];

// Apply entangling gates again
cx q[2], q[0];
cx q[3], q[1];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];