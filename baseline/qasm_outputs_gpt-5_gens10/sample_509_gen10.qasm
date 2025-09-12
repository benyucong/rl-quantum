OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialization and Entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];

// Layer 2: Applying Rotations
rz(0.25) q[0];
rz(0.2) q[1];
rz(0.15) q[2];
rz(0.1) q[3];
rz(0.05) q[4];
rx(0.3) q[0];
rx(0.25) q[1];
rx(0.2) q[2];
rx(0.15) q[3];
rx(0.1) q[4];

// Layer 3: More Entanglement and Final Measurements
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];