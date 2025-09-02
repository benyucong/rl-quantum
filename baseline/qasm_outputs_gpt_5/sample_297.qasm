OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1
rx(1.2) q[0];
rz(0.7) q[0];
rx(1.5) q[1];
rz(0.5) q[1];
cx q[0], q[1];

// Layer 2
rx(0.6) q[2];
rz(1.0) q[2];
rx(1.9) q[3];
rz(0.3) q[3];
cx q[1], q[2];
cx q[2], q[3];

// Layer 3
rx(1.1) q[4];
rz(0.8) q[4];
cx q[0], q[3];
cx q[1], q[4];
cx q[2], q[4];

// Layer 4
rz(-0.5) q[0];
rz(-0.6) q[1];
rz(-0.2) q[2];
rz(-0.8) q[3];
rz(-0.9) q[4];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];