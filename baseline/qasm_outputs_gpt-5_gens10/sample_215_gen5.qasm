OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Entangling gates based on graph edges
cx q[1], q[0]; // edge (1,2)
cx q[1], q[3]; // edge (1,3)
cx q[2], q[3]; // edge (2,3)
cx q[0], q[3]; // edge (0,3)

// Layer 3: Apply rotation for encoding colors
rz(1.0472) q[0]; // π/3 rotation for color 1
rz(2.0944) q[1]; // 2π/3 rotation for color 2
rz(3.1416) q[2]; // π rotation for color 3
rz(0) q[3]; // No rotation for default state

// Layer 4: Finalizing operations with additional entangling
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];