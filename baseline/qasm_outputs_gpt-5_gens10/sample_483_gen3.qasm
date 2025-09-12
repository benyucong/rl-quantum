OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Apply rotations for initialization
rx(1.22) q[0];
rx(1.15) q[1];
rx(0.87) q[2];
rx(1.08) q[3];
rx(0.75) q[4];
rx(1.33) q[5];

// Apply entangling gates based on edges
cx q[0], q[2]; // Edge (0, 2)
cx q[0], q[3]; // Edge (0, 3)
cx q[1], q[2]; // Edge (1, 2)
cx q[1], q[3]; // Edge (1, 3)
cx q[1], q[4]; // Edge (1, 4)
cx q[1], q[5]; // Edge (1, 5)
cx q[2], q[3]; // Edge (2, 3)
cx q[2], q[5]; // Edge (2, 5)

// Layer 2: Apply final rotations for output state
rz(-0.63) q[0];
rz(-0.49) q[1];
rz(0.20) q[2];
rz(-0.45) q[3];
rz(0.11) q[4];
rz(-0.30) q[5];

// Measure qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];