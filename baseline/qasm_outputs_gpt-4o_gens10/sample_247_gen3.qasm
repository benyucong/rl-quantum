OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];

// Layer 2: Entanglement
cx q[0], q[1];
cx q[1], q[2];
rz(0.5) q[1];
cx q[0], q[2];

// Layer 3: Rotation
rx(1.2) q[0];
rz(0.3) q[0];
rx(1.5) q[1];
rz(0.4) q[1];
rx(1.1) q[2];
rz(0.2) q[2];

// Layer 4: Final entanglement and measurement preparation
cx q[0], q[1];
cx q[1], q[2];
h q[0];
h q[1];
h q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];