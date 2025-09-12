OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Prepare superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2: Entangling gates based on the graph's weights
cx q[0], q[1]; // weight 2
rz(-1.3382) q[1]; 
cx q[0], q[1];

cx q[0], q[2]; // weight 15
rz(-1.7014) q[2]; 
cx q[0], q[2];

cx q[0], q[8]; // weight 11
rz(-1.6447) q[8]; 
cx q[0], q[8];

cx q[2], q[3]; // weight 9
rz(-0.9505) q[3]; 
cx q[2], q[3];

cx q[3], q[4]; // weight 11
rz(-1.2935) q[4]; 
cx q[3], q[4];

cx q[4], q[5]; // weight 2
rz(-0.6387) q[5]; 
cx q[4], q[5];

cx q[4], q[6]; // weight 12
rz(-1.3214) q[6]; 
cx q[4], q[6];

cx q[5], q[7]; // weight 18
rz(-2.0457) q[7]; 
cx q[5], q[7];

cx q[6], q[7]; // weight 5
rz(-0.8038) q[7]; 
cx q[6], q[7];

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