OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of entangling gates based on the problem structure
cx q[0], q[3];
rz(-0.1045) q[3];
cx q[0], q[3];

cx q[0], q[6];
rz(-0.1223) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(-0.0927) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(-0.2731) q[4];
cx q[1], q[4];

cx q[1], q[6];
rz(-0.1245) q[6];
cx q[1], q[6];

cx q[2], q[5];
rz(-0.0547) q[5];
cx q[2], q[5];

cx q[2], q[3];
rz(-0.1451) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(-0.1752) q[4];
cx q[2], q[4];

// Second layer of entangling gates
cx q[0], q[4];
rz(-0.0594) q[4];
cx q[0], q[4];

cx q[1], q[5];
rz(-0.3462) q[5];
cx q[1], q[5];

cx q[2], q[3];
rz(-0.0745) q[3];
cx q[2], q[3];

cx q[3], q[4];
rz(-0.0845) q[4];
cx q[3], q[4];

cx q[5], q[6];
rz(-0.0621) q[6];
cx q[5], q[6];

cx q[6], q[7];
rz(-0.1171) q[7];
cx q[6], q[7];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];