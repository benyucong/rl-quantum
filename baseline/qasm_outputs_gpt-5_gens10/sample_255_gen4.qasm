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

// First layer of entangling gates
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[7];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[3];
cx q[2], q[4];
cx q[3], q[4];
cx q[6], q[5];
cx q[5], q[7];

// Apply rotation parameters
rz(0.7632) q[0];
rz(0.5431) q[1];
rz(0.6345) q[2];
rz(0.4722) q[3];
rz(0.3427) q[4];
rz(0.8813) q[5];
rz(0.2914) q[6];
rz(0.9035) q[7];

// Second layer of entangling gates
cx q[1], q[0];
cx q[2], q[1];
cx q[3], q[2];
cx q[4], q[3];
cx q[5], q[4];
cx q[7], q[6];
cx q[5], q[1];
cx q[3], q[0];

// Third layer of measurement preparations
rz(0.5724) q[0];
rz(0.6843) q[1];
rz(0.2134) q[2];
rz(0.5641) q[3];
rz(0.2145) q[4];
rz(0.6578) q[5];
rz(0.2033) q[6];
rz(0.8937) q[7];

// Post-rotation entangling gates
cx q[0], q[5];
cx q[1], q[6];
cx q[2], q[7];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];