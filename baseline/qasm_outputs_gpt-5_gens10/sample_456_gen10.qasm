OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Apply Hadamard to all qubits to create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled rotations to encode min-cut problem
rx(0.6589) q[0];
rx(1.214) q[1];
cx q[0], q[1];
rz(0.271) q[1];
cx q[0], q[1];

rx(0.982) q[2];
rx(1.078) q[3];
cx q[2], q[3];
rz(0.542) q[3];
cx q[2], q[3];

rx(1.109) q[4];
rx(0.581) q[5];
cx q[4], q[5];
rz(0.918) q[5];
cx q[4], q[5];

// Layer 3: Final rotation and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rx(0.955) q[0];
rz(0.364) q[0];
rx(1.236) q[1];
rz(0.111) q[1];
rx(0.724) q[2];
rz(0.598) q[2];
rx(1.054) q[3];
rz(0.312) q[3];
rx(0.892) q[4];
rz(0.246) q[4];
rx(1.102) q[5];
rz(0.473) q[5];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];