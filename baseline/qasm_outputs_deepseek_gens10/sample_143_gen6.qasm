OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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
rz(0.314) q[0];
rz(0.628) q[1];
rz(0.942) q[2];
rz(1.256) q[3];
rz(1.570) q[4];
rz(1.884) q[5];
rz(2.198) q[6];
rz(2.512) q[7];
rz(2.826) q[8];
rz(3.140) q[9];

// Layer 2: Flow conservation constraints and capacity interactions
// Edge 0→4 (capacity 1)
cx q[0], q[4];
rz(0.785) q[4];
cx q[0], q[4];

// Edge 1→4 (capacity 2)
cx q[1], q[4];
rz(1.256) q[4];
cx q[1], q[4];

// Edge 2→3 (capacity 1)
cx q[2], q[3];
rz(0.785) q[3];
cx q[2], q[3];

// Edge 2→4 (capacity 1)
cx q[2], q[4];
rz(0.785) q[4];
cx q[2], q[4];

// Edge 2→5 (capacity 2)
cx q[2], q[5];
rz(1.256) q[5];
cx q[2], q[5];

// Edge 3→2 (capacity 1)
cx q[3], q[2];
rz(0.785) q[2];
cx q[3], q[2];

// Edge 4→5 (capacity 2)
cx q[4], q[5];
rz(1.256) q[5];
cx q[4], q[5];

// Layer 3: Source and sink constraints with parameterized rotations
// Source node 0 constraint
rz(2.356) q[0];
// Sink node 5 constraint
rz(2.356) q[5];
// Intermediate nodes
rz(1.570) q[1];
rz(1.570) q[2];
rz(1.570) q[3];
rz(1.570) q[4];

// Layer 4: Final optimization and measurement preparation
// Final parameterized rotations
rz(0.392) q[0];
rz(0.392) q[1];
rz(0.392) q[2];
rz(0.392) q[3];
rz(0.392) q[4];
rz(0.392) q[5];
rz(0.392) q[6];
rz(0.392) q[7];
rz(0.392) q[8];
rz(0.392) q[9];

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