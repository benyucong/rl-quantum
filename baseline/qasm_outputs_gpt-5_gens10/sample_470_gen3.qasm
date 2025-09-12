OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialize qubits
h q;
rx(0.5) q[0];
rx(0.5) q[1];
rx(0.5) q[2];
rx(0.5) q[3];
rx(0.5) q[4];
rx(0.5) q[5];
rx(0.5) q[6];
rx(0.5) q[7];
rx(0.5) q[8];

// First Layer (Entanglement and Oracle Implementation)
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[5];
cx q[1], q[7];
cx q[2], q[4];
cx q[3], q[8];
cx q[5], q[6];

// Second Layer (Rotation based on optimisation)
rz(0.1) q[0];
rz(0.1) q[1];
rz(0.2) q[2];
rz(0.2) q[3];
rz(0.1) q[4];
rz(0.1) q[5];
rz(0.2) q[6];
rz(0.2) q[7];
rz(0.1) q[8];

// Third Layer (Final Entanglement)
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[5];
cx q[1], q[7];
cx q[2], q[4];
cx q[3], q[8];
cx q[5], q[6];

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