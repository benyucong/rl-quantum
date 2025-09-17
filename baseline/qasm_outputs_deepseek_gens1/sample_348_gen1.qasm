OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];

// Layer 2: Problem-specific phase operations
// Edge (0,5) with capacity 2
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];

// Edge (2,3) with capacity 2
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Edge (3,1) with capacity 3
cx q[3], q[1];
rz(1.1781) q[1];
cx q[3], q[1];

// Edge (3,2) with capacity 1
cx q[3], q[2];
rz(0.3927) q[2];
cx q[3], q[2];

// Edge (3,5) with capacity 3
cx q[3], q[5];
rz(1.1781) q[5];
cx q[3], q[5];

// Edge (4,2) with capacity 2
cx q[4], q[2];
rz(0.7854) q[2];
cx q[4], q[2];

// Layer 3: Final mixing and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];

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