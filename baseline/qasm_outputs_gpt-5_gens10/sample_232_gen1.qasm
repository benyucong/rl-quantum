OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Entanglement
cx q[0], q[1];
rz(1.2345) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(1.2345) q[2];
cx q[1], q[2];
cx q[2], q[3];
rz(1.2345) q[3];
cx q[2], q[3];
cx q[0], q[4];
rz(1.2345) q[4];
cx q[0], q[4];
cx q[3], q[5];
rz(1.2345) q[5];
cx q[3], q[5];
cx q[2], q[6];
rz(1.2345) q[6];
cx q[2], q[6];
cx q[4], q[7];
rz(1.2345) q[7];
cx q[4], q[7];

// Layer 3: Finalize
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];