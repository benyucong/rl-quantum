OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialization and first parameterized rotations
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
h q[11];

// Edge 0→1 (capacity 5)
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-0.3927) q[1];
cx q[0], q[1];

// Edge 0→3 (capacity 2)
rz(0.3142) q[0];
rz(0.3142) q[3];
cx q[0], q[3];
rz(-0.1571) q[3];
cx q[0], q[3];

// Edge 1→2 (capacity 3)
rz(0.4712) q[1];
rz(0.4712) q[2];
cx q[1], q[2];
rz(-0.2356) q[2];
cx q[1], q[2];

// Edge 1→3 (capacity 1)
rz(0.1571) q[1];
rz(0.1571) q[3];
cx q[1], q[3];
rz(-0.0785) q[3];
cx q[1], q[3];

// Edge 2→1 (capacity 2)
rz(0.3142) q[2];
rz(0.3142) q[1];
cx q[2], q[1];
rz(-0.1571) q[1];
cx q[2], q[1];

// Edge 2→3 (capacity 3)
rz(0.4712) q[2];
rz(0.4712) q[3];
cx q[2], q[3];
rz(-0.2356) q[3];
cx q[2], q[3];

// Layer 2: Mixing and flow conservation constraints
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
h q[11];

// Source constraint (node 0)
cx q[0], q[4];
rz(0.6283) q[4];
cx q[0], q[4];

// Sink constraint (node 3)
cx q[3], q[5];
rz(0.6283) q[5];
cx q[3], q[5];

// Flow conservation constraints
// Node 1
cx q[1], q[6];
rz(0.3142) q[6];
cx q[1], q[6];

// Node 2
cx q[2], q[7];
rz(0.3142) q[7];
cx q[2], q[7];

// Layer 3: Final optimization and measurement preparation
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
h q[11];

// Final parameterized rotations for optimal flow
rz(0.3927) q[0];
rz(0.2356) q[1];
rz(0.1571) q[2];
rz(0.3142) q[3];
rz(0.1963) q[4];
rz(0.1963) q[5];
rz(0.0982) q[6];
rz(0.0982) q[7];

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