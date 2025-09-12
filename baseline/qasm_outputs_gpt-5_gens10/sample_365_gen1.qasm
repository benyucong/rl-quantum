OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
cx q[0], q[3]; // edge (0, 3)
cx q[1], q[3]; // edge (1, 3)
cx q[1], q[5]; // edge (1, 5)
cx q[2], q[6]; // edge (2, 6)
cx q[3], q[8]; // edge (3, 8)
cx q[4], q[7]; // edge (4, 7)
cx q[5], q[1]; // edge (5, 1)
cx q[5], q[4]; // edge (5, 4)
cx q[7], q[2]; // edge (7, 2)
cx q[7], q[6]; // edge (7, 6)
cx q[7], q[8]; // edge (7, 8)
u3(1.5708, 0, 0) q[0]; // A rotation to introduce a phase
u3(1.5708, 0, 0) q[1]; // A rotation to introduce a phase
u3(1.5708, 0, 0) q[2]; // A rotation to introduce a phase
u3(1.5708, 0, 0) q[3]; // A rotation to introduce a phase
u3(1.5708, 0, 0) q[4]; // A rotation to introduce a phase
u3(1.5708, 0, 0) q[5]; // A rotation to introduce a phase
u3(1.5708, 0, 0) q[6]; // A rotation to introduce a phase
u3(1.5708, 0, 0) q[7]; // A rotation to introduce a phase
u3(1.5708, 0, 0) q[8]; // A rotation to introduce a phase
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];