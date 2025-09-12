OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled gates based on edges and weights
cx q[0], q[4]; // Weight 10
rz(0.0) q[4]; 
cx q[0], q[7]; // Weight 20
rz(0.0) q[7]; 
cx q[1], q[5]; // Weight 10
rz(0.0) q[5]; 
cx q[1], q[4]; // Weight 20
rz(0.0) q[4]; 
cx q[1], q[7]; // Weight 14
rz(0.0) q[7]; 
cx q[2], q[6]; // Weight 1
rz(0.0) q[6]; 
cx q[2], q[7]; // Weight 18
rz(0.0) q[7]; 
cx q[2], q[4]; // Weight 14
rz(0.0) q[4]; 
cx q[3], q[7]; // Weight 5
rz(0.0) q[7]; 

// Layer 3: Finalize with measurements
h q[0];
h q[1];
h q[2];
h q[3];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];