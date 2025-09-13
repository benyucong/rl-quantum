OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

// Layer 2: Flow constraints and capacity encoding
// Edge 0→4 (capacity 1)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];

// Edge 1→4 (capacity 2)
cx q[1], q[4];
rz(1.1781) q[4];
cx q[1], q[4];

// Edge 2→3 (capacity 1)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Edge 2→4 (capacity 1)
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];

// Edge 2→5 (capacity 2)
cx q[2], q[5];
rz(1.1781) q[5];
cx q[2], q[5];

// Edge 3→2 (capacity 1)
cx q[3], q[2];
rz(0.7854) q[2];
cx q[3], q[2];

// Edge 4→5 (capacity 2)
cx q[4], q[5];
rz(1.1781) q[5];
cx q[4], q[5];

// Layer 3: Flow conservation constraints
// Node 0 (source)
rz(1.5708) q[0];

// Node 1
rz(1.5708) q[1];

// Node 2
rz(1.0472) q[2];

// Node 3
rz(1.0472) q[3];

// Node 4
rz(1.0472) q[4];

// Node 5 (sink)
rz(1.5708) q[5];

// Layer 4: Final mixing and measurement
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