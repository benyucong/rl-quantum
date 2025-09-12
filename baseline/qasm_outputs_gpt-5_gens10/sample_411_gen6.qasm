OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

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
h q[9];
h q[10];

// Layer 2
cx q[0], q[2];
rz(0.7634) q[2];
cx q[0], q[2];

cx q[1], q[2];
rz(0.5321) q[2];
cx q[1], q[2];

cx q[2], q[5];
rz(0.8432) q[5];
cx q[2], q[5];

cx q[4], q[6];
rz(0.9213) q[6];
cx q[4], q[6];

// Layer 3
cx q[2], q[4];
rz(0.3014) q[4];
cx q[2], q[4];

cx q[3], q[1];
rz(0.4702) q[1];
cx q[3], q[1];

cx q[6], q[8];
rz(0.5123) q[8];
cx q[6], q[8];

cx q[5], q[9];
rz(0.1234) q[9];
cx q[5], q[9];

// Layer 4
cx q[0], q[10];
rz(0.7234) q[10];
cx q[0], q[10];

cx q[3], q[7];
rz(0.8121) q[7];
cx q[3], q[7];

cx q[8], q[9];
rz(0.5721) q[9];
cx q[8], q[9];

cx q[10], q[10];
rz(0.0000) q[10]; // Identity on the final qubit

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