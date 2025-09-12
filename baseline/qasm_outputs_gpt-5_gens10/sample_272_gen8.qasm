OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialize qubits for state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First Layer
cx q[0], q[4];
cx q[0], q[6];
rz(0.4876) q[4];
rz(0.1761) q[6];

cx q[1], q[5];
cx q[1], q[8];
rz(0.9139) q[5];
rz(0.3515) q[8];

cx q[2], q[4];
cx q[2], q[6];
rz(0.6633) q[4];
rz(0.2043) q[6];

cx q[3], q[7];
rz(0.4056) q[7];

// Second Layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[4];
cx q[1], q[5];
cx q[2], q[6];
cx q[3], q[7];
cx q[4], q[8];

// Third Layer
rz(0.6321) q[0];
rz(0.8732) q[1];
rz(0.4176) q[2];
rz(0.1903) q[3];
rz(0.5644) q[4];
rz(0.7635) q[5];
rz(0.2121) q[6];
rz(0.3148) q[7];
rz(0.4908) q[8];

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