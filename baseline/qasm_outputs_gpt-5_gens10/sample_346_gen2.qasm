OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply controlled-phase gates based on edge weights
// Edges: (0,1), (2,3), (2,4), (2,6), (4,5), (4,6), (5,6), (5,7), (6,7)
rz(3.0) q[0];
rz(3.0) q[1];
cx q[0], q[1];

rz(1.0) q[2];
rz(1.0) q[3];
cx q[2], q[3];

rz(18.0) q[2];
rz(18.0) q[6];
cx q[2], q[6];

rz(17.0) q[2];
rz(17.0) q[4];
cx q[2], q[4];

rz(5.0) q[4];
rz(5.0) q[5];
cx q[4], q[5];

rz(15.0) q[4];
rz(15.0) q[6];
cx q[4], q[6];

rz(15.0) q[5];
rz(15.0) q[6];
cx q[5], q[6];

rz(13.0) q[5];
rz(13.0) q[7];
cx q[5], q[7];

rz(1.0) q[6];
rz(1.0) q[7];
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