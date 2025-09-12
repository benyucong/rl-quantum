OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

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

rx(1.2345) q[0];
ry(0.5678) q[1];
rz(0.9101) q[2];
rx(0.2233) q[3];
ry(1.4456) q[4];
rz(0.7788) q[5];
rx(1.1112) q[6];
ry(0.3334) q[7];
rz(1.5678) q[8];

// Entangle qubits
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[4];
cx q[4], q[5];
cx q[3], q[6];
cx q[2], q[7];

// Layer 2
h q[0];
rz(0.2345) q[0];
h q[0];

h q[1];
rz(0.6789) q[1];
h q[1];

h q[2];
rz(1.0123) q[2];
h q[2];

h q[3];
rz(0.4567) q[3];
h q[3];

h q[4];
rz(0.8910) q[4];
h q[4];

h q[5];
rz(1.1357) q[5];
h q[5];

h q[6];
rz(0.2468) q[6];
h q[6];

h q[7];
rz(1.3579) q[7];
h q[7];

h q[8];
rz(0.9876) q[8];
h q[8];

// Measure
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];