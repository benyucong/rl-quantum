OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer of the circuit
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[2], q[4];
cx q[3], q[5];

// Second layer of the circuit
rz(0.3) q[0];
rz(0.2) q[1];
rz(0.4) q[2];
rz(0.1) q[3];
rz(0.5) q[4];
rz(0.3) q[5];

// Third layer of the circuit
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[4];
cx q[3], q[5];

// Fourth layer of the circuit
rz(-0.3) q[0];
rz(-0.2) q[1];
rz(-0.4) q[2];
rz(-0.1) q[3];
rz(-0.5) q[4];
rz(-0.3) q[5];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];