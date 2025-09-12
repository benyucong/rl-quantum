OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1 - Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2 - Apply controlled operations based on edges
cx q[0], q[1]; // Edge (0, 1)
cx q[1], q[2]; // Edge (1, 2)
cx q[1], q[3]; // Edge (1, 3)
cx q[1], q[4]; // Edge (1, 4)

// Layer 3 - Finalize with additional operations
rz(0.5) q[1]; // Optimize with Rz rotation
rz(0.3) q[2]; 
rz(0.2) q[3]; 
rz(0.4) q[4]; 

// Measure final states
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];