OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Initialize qubits in |0> state
h q[0]; // Source qubit
h q[1]; // Node qubit 1
h q[2]; // Node qubit 2
h q[3]; // Node qubit 3
h q[4]; // Node qubit 4
h q[5]; // Sink qubit

// Layer 1
cx q[0], q[5]; // Source to sink
cx q[2], q[3]; // Node 2 to Node 3
rx(1.0507) q[3]; // Rotation for Node 3
rz(-0.9423) q[3]; // Rotation for Node 3
cx q[3], q[1]; // Node 3 to Node 1
rx(-0.7854) q[1]; // Rotation for Node 1
rz(0.5236) q[1]; // Rotation for Node 1

// Layer 2
cx q[3], q[2]; // Node 3 to Node 2
cx q[3], q[5]; // Node 3 to Sink
rx(1.1371) q[5]; // Rotation for Sink
rz(0.7652) q[5]; // Rotation for Sink
cx q[4], q[2]; // Node 4 to Node 2
cx q[2], q[3]; // Node 2 to Node 3

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rz(0.2764) q[0];
rz(0.1846) q[1];
rz(-0.0142) q[2];
rz(0.1102) q[3];
rz(0.2309) q[4];
rz(0.3468) q[5];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

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