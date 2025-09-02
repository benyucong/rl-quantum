OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];

// Layer 1
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[2], q[4];
cx q[2], q[5];
cx q[2], q[6];
cx q[3], q[4];
cx q[3], q[5];
cx q[3], q[6];

// Layer 2
ry(1.256) q[0];
ry(1.256) q[1];
ry(1.256) q[2];
ry(1.256) q[3];
ry(1.256) q[4];
ry(1.256) q[5];
ry(1.256) q[6];
ry(1.256) q[7];
ry(1.256) q[8];
ry(1.256) q[9];
ry(1.256) q[10];

// Layer 3
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[2], q[4];
cx q[2], q[5];
cx q[2], q[6];
cx q[3], q[4];
cx q[3], q[5];
cx q[3], q[6];

// Measure qubits
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