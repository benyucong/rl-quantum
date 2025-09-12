OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
  
cx q[0], q[5]; // Connect first edge (0,5)
cx q[1], q[6]; // Connect second edge (1,6)
cx q[1], q[8]; // Connect third edge (1,8)
cx q[1], q[9]; // Connect fourth edge (1,9)
cx q[2], q[7]; // Connect fifth edge (2,7)
cx q[2], q[10]; // Connect sixth edge (2,10)
cx q[3], q[8]; // Connect seventh edge (3,8)
cx q[4], q[9]; // Connect eighth edge (4,9)
cx q[4], q[5]; // Connect ninth edge (4,5)
cx q[4], q[7]; // Connect tenth edge (4,7)

// Layer 2
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];

// Apply RZ rotation based on weights
rz(2.0) q[5]; // Weight for edge (0,5)
rz(9.0) q[6]; // Weight for edge (1,6)
rz(14.0) q[8]; // Weight for edges (1,9) and (1,8)
rz(2.0) q[7]; // Weight for edge (2,7)
rz(14.0) q[10]; // Weight for edge (2,10)
rz(1.0) q[8]; // Weight for edge (3,8)
rz(9.0) q[9]; // Weight for edge (4,9)
rz(18.0) q[5]; // Weight for edge (4,5)
rz(13.0) q[7]; // Weight for edge (4,7)

// Layer 3
h q[0]; 
h q[1]; 
h q[2]; 
h q[3]; 
h q[4];

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