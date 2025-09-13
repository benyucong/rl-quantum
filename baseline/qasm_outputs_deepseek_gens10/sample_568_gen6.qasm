OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initialize superposition
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

// First layer - Max Flow constraints
// Edge 0→5 (capacity 3)
rz(0.7854) q[0];
rz(0.7854) q[5];
cx q[0], q[5];
rz(-0.7854) q[5];
cx q[0], q[5];

// Edge 1→2 (capacity 3)
rz(0.7854) q[1];
rz(0.7854) q[2];
cx q[1], q[2];
rz(-0.7854) q[2];
cx q[1], q[2];

// Edge 1→5 (capacity 1)
rz(1.0472) q[1];
rz(1.0472) q[5];
cx q[1], q[5];
rz(-1.0472) q[5];
cx q[1], q[5];

// Edge 2→4 (capacity 1)
rz(1.0472) q[2];
rz(1.0472) q[4];
cx q[2], q[4];
rz(-1.0472) q[4];
cx q[2], q[4];

// Edge 3→2 (capacity 3)
rz(0.7854) q[3];
rz(0.7854) q[2];
cx q[3], q[2];
rz(-0.7854) q[2];
cx q[3], q[2];

// Edge 3→5 (capacity 2)
rz(0.9273) q[3];
rz(0.9273) q[5];
cx q[3], q[5];
rz(-0.9273) q[5];
cx q[3], q[5];

// Second layer - Flow conservation and optimization
// Source node 0 constraint
rz(0.5236) q[0];
rz(0.5236) q[5];
cx q[0], q[5];
rz(-0.5236) q[5];
cx q[0], q[5];

// Sink node 5 constraint
rz(0.5236) q[0];
rz(0.5236) q[1];
rz(0.5236) q[3];
rz(0.5236) q[5];
cx q[0], q[5];
cx q[1], q[5];
cx q[3], q[5];
rz(-0.5236) q[5];
cx q[3], q[5];
cx q[1], q[5];
cx q[0], q[5];

// Intermediate node constraints
// Node 1 flow conservation
rz(0.3491) q[1];
rz(0.3491) q[2];
rz(0.3491) q[5];
cx q[1], q[2];
cx q[1], q[5];
rz(-0.3491) q[5];
cx q[1], q[5];
cx q[1], q[2];

// Node 2 flow conservation
rz(0.3491) q[1];
rz(0.3491) q[2];
rz(0.3491) q[3];
rz(0.3491) q[4];
cx q[1], q[2];
cx q[3], q[2];
cx q[2], q[4];
rz(-0.3491) q[4];
cx q[2], q[4];
cx q[3], q[2];
cx q[1], q[2];

// Node 3 flow conservation
rz(0.3491) q[3];
rz(0.3491) q[2];
rz(0.3491) q[5];
cx q[3], q[2];
cx q[3], q[5];
rz(-0.3491) q[5];
cx q[3], q[5];
cx q[3], q[2];

// Final measurements
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