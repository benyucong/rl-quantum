OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// First layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Entanglements based on the edges with corresponding weights
cx q[0], q[1]; // edge (0, 1)
rz(-0.1848) q[1];
cx q[0], q[1];

cx q[0], q[7]; // edge (0, 7)
rz(-0.3747) q[7];
cx q[0], q[7];

cx q[1], q[4]; // edge (1, 4)
rz(-0.2731) q[4];
cx q[1], q[4];

cx q[1], q[7]; // edge (1, 7)
rz(-0.3692) q[7];
cx q[1], q[7];

cx q[2], q[3]; // edge (2, 3)
rz(-0.2298) q[3];
cx q[2], q[3];

cx q[2], q[4]; // edge (2, 4)
rz(-0.2693) q[4];
cx q[2], q[4];

cx q[3], q[5]; // edge (3, 5)
rz(-0.3722) q[5];
cx q[3], q[5];

cx q[4], q[5]; // edge (4, 5)
rz(-0.2454) q[5];
cx q[4], q[5];

cx q[6], q[7]; // edge (6, 7)
rz(-0.2671) q[7];
cx q[6], q[7];

// Second layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

rz(0.1537) q[0];
rz(0.1512) q[1];
rz(0.1599) q[2];
rz(0.1575) q[3];
rz(0.1624) q[4];
rz(0.1549) q[5];
rz(0.1596) q[6];
rz(0.1657) q[7];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];