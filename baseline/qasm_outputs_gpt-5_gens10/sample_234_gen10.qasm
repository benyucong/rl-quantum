OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of operations to create entanglement
cx q[0], q[1];
rx(1.23) q[1];
cx q[0], q[1];

cx q[0], q[2];
rx(2.07) q[2];
cx q[0], q[2];

cx q[1], q[6];
rx(1.58) q[6];
cx q[1], q[6];

cx q[5], q[2];
rx(2.34) q[5];
cx q[5], q[2];

cx q[4], q[3];
rx(1.45) q[3];
cx q[4], q[3];

cx q[3], q[7];
rx(2.05) q[7];
cx q[3], q[7];

// Second layer of operations
cx q[1], q[5];
rx(1.12) q[5];
cx q[1], q[5];

cx q[2], q[3];
rx(2.18) q[3];
cx q[2], q[3];

cx q[0], q[6];
rx(1.34) q[6];
cx q[0], q[6];

cx q[4], q[1];
rx(1.63) q[1];
cx q[4], q[1];

cx q[5], q[6];
rx(2.25) q[6];
cx q[5], q[6];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];