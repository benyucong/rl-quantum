OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];

// Layer 2: Apply entangling gates
cx q[0], q[2];
cx q[1], q[2];
rz(0.5) q[2];

// Layer 3: Finalize the state and measurement
h q[0];
h q[1];
h q[2];
cx q[0], q[1];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];