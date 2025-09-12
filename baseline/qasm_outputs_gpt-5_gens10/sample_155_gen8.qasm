OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
cx q[0], q[6]; // source to node 6
cx q[0], q[8]; // source to sink
cx q[1], q[2]; // node 1 to node 2
cx q[1], q[3]; // node 1 to node 3
cx q[1], q[5]; // node 1 to node 5
cx q[2], q[7]; // node 2 to node 7
cx q[2], q[8]; // node 2 to sink
cx q[3], q[1]; // node 3 to node 1

// Layer 2
rx(1.2049) q[0];
rz(-0.5314) q[0];
rx(0.9177) q[1];
rz(0.5845) q[1];
rx(1.3013) q[2];
rz(0.3488) q[2];
rx(0.7689) q[3];
rz(-0.0523) q[3];
rx(1.1439) q[4];
rz(0.2042) q[4];
rx(1.7260) q[5];
rz(-0.3720) q[5];
rx(1.4501) q[6];
rz(0.5421) q[6];
rx(0.8655) q[7];
rz(-0.2301) q[7];
rx(1.2216) q[8];
rz(0.9150) q[8];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
cx q[6], q[2]; // edge connection
cx q[6], q[0]; // source to node 6 connection
cx q[8], q[1]; // sink to node 1 connection
cx q[2], q[7]; // node 2 to node 7 connection
cx q[3], q[1]; // node 3 back to node 1 connection

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