OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1: Apply controlled rotations for edges
cx q[0], q[4];
ry(1.234) q[4];
cx q[0], q[4];

cx q[1], q[4];
ry(1.567) q[4];
cx q[1], q[4];

cx q[2], q[4];
ry(1.890) q[4];
cx q[2], q[4];

cx q[3], q[4];
ry(2.345) q[4];
cx q[3], q[4];

// Layer 2: Additional entangling gates
cx q[0], q[1];
rz(0.123) q[1];
cx q[0], q[1];

cx q[1], q[2];
rz(0.456) q[2];
cx q[1], q[2];

cx q[2], q[3];
rz(0.789) q[3];
cx q[2], q[3];

// Layer 3: More controlled operations
cx q[3], q[4];
rz(0.147) q[4];
cx q[3], q[4];

cx q[0], q[2];
rz(0.258) q[2];
cx q[0], q[2];

// Layer 4: Finalize with measurements and cleanup
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];