OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2
cx q[0], q[2];  // source to node 2
rx(1.5708) q[2];
cx q[0], q[4];  // source to sink
rx(1.5708) q[4];
cx q[1], q[2];  // node 1 to 2
rx(1.5708) q[2];

// Layer 3
cx q[1], q[3];  // node 1 to 3
rx(1.5708) q[3]; 
cx q[2], q[1];  // node 2 to 1
rx(1.5708) q[1]; 
cx q[2], q[3];  // node 2 to node 3
rx(1.5708) q[3];

// Layer 4
cx q[3], q[1];  // node 3 to node 1
rx(1.5708) q[1];  
cx q[3], q[4];  // node 3 to sink
rx(1.5708) q[4];

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
c[10] = measure q[10];
c[11] = measure q[11];