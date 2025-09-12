OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Apply controlled gates based on the graph connectivity
cx q[0], q[1];  // Edge (0, 1)
cx q[0], q[2];  // Edge (0, 2)
cx q[0], q[3];  // Edge (0, 3)
cx q[1], q[2];  // Edge (1, 2)
cx q[1], q[3];  // Edge (1, 3)
cx q[2], q[3];  // Edge (2, 3)
cx q[3], q[4];  // Edge (3, 4)
cx q[3], q[5];  // Edge (3, 5)

// Layer 2: Apply rotation gates for mixing
rz(0.12) q[0];
rz(0.12) q[1];
rz(0.12) q[2];
rz(0.12) q[3];
rz(0.12) q[4];
rz(0.12) q[5];

// Layer 3: Apply another set of controlled gates for final entanglement
cx q[0], q[1];  
cx q[0], q[2];  
cx q[0], q[3];  
cx q[1], q[2];  
cx q[1], q[3];  
cx q[2], q[3];  
cx q[3], q[4];  
cx q[3], q[5];  

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];