OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of entangling gates based on the min-cut graph structure
cx q[0], q[1];
rz(-0.5880) q[1];  // weight from 0 to 1
cx q[0], q[1];

cx q[0], q[4];
rz(-0.7880) q[4];  // weight from 0 to 4
cx q[0], q[4];

cx q[0], q[5];
rz(-0.5880) q[5];  // weight from 0 to 5
cx q[0], q[5];

cx q[0], q[6];
rz(-0.9330) q[6];  // weight from 0 to 6
cx q[0], q[6];

cx q[1], q[2];
rz(-0.4500) q[2];  // weight from 1 to 2
cx q[1], q[2];

cx q[1], q[3];
rz(-0.6700) q[3];  // weight from 1 to 3
cx q[1], q[3];

cx q[1], q[5];
rz(-0.4800) q[5];  // weight from 1 to 5
cx q[1], q[5];

cx q[2], q[4];
rz(-0.5500) q[4];  // weight from 2 to 4
cx q[2], q[4];

cx q[3], q[4];
rz(-0.8700) q[4];  // weight from 3 to 4
cx q[3], q[4];

// Second layer of entangling gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

cx q[3], q[7];    // connecting to sink
rz(-0.8500) q[7]; 
cx q[3], q[7];

cx q[4], q[7];
rz(-0.6700) q[7]; 
cx q[4], q[7];

cx q[5], q[7];
rz(-0.5800) q[7]; 
cx q[5], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];