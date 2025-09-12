OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Encoding the edges of the graph
cx q[0], q[4]; // 0 to 4
rz(0.1582) q[4];
cx q[0], q[4];

cx q[1], q[4]; // 1 to 4
rz(0.1582) q[4];
cx q[1], q[4];

cx q[2], q[3]; // 2 to 3
rz(0.1582) q[3];
cx q[2], q[3];

cx q[2], q[4]; // 2 to 4
rz(0.1582) q[4];
cx q[2], q[4];

cx q[2], q[5]; // 2 to 5
rz(0.1582) q[5];
cx q[2], q[5];

cx q[3], q[2]; // 3 to 2
rz(0.1582) q[2];
cx q[3], q[2];

cx q[4], q[5]; // 4 to 5
rz(0.1582) q[5];
cx q[4], q[5];

// Layer 3: Rotation adjustments
rz(-0.0764) q[0];
rz(-0.0764) q[1];
rz(-0.0764) q[2];
rz(-0.0764) q[3];
rz(-0.0764) q[4];
rz(-0.0764) q[5];

// Layer 4: Final measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];