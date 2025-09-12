OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;
h q[0];
h q[1];
h q[2];

// Layer 1: Apply parameterized rotations
rx(1.2345) q[0];
ry(0.5678) q[1];
rz(0.9101) q[2];

// Layer 2: Create entanglement
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[2];

// Layer 3: Final rotations
rx(0.3456) q[0];
ry(1.7890) q[1];
rz(0.1112) q[2];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];