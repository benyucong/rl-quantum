OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// First layer: Preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Entanglement: applying CNOT and RX gates based on edges
cx q[0], q[1]; 
rx(1.2345) q[1];
cx q[1], q[2]; 
rx(1.2345) q[2];
cx q[0], q[3]; 
rx(1.2345) q[3];
cx q[1], q[3];
rx(1.2345) q[3];
cx q[1], q[5]; 
rx(1.2345) q[5];
cx q[2], q[3]; 
rx(1.2345) q[3];
cx q[2], q[4]; 
rx(1.2345) q[4];
cx q[3], q[5]; 
rx(1.2345) q[5];

// Second layer: Additional phases
rz(0.12345) q[0]; 
rz(0.12345) q[1]; 
rz(0.12345) q[2]; 
rz(0.12345) q[3]; 
rz(0.12345) q[4]; 
rz(0.12345) q[5]; 

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];