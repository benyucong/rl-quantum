OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// First Layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

rx(0.93) q[0];
rx(1.82) q[1];
rx(1.78) q[2];
rx(2.25) q[3];
rx(0.77) q[4];
rx(1.68) q[5];
rx(1.44) q[6];
rx(0.54) q[7];
rx(1.26) q[8];

// Entangling Operations
cx q[0], q[1];
cx q[2], q[3];
cx q[2], q[4];
cx q[5], q[6];
cx q[6], q[7];

// Second Layer
rz(0.35) q[0];
rz(0.15) q[1];
rz(1.25) q[2];
rz(1.22) q[3];
rz(0.85) q[4];
rz(0.67) q[5];
rz(1.12) q[6];
rz(0.47) q[7];
rz(0.99) q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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