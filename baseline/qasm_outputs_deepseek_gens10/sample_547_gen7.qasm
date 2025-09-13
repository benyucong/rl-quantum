OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and problem encoding
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

// Capacity-weighted edges from source (0) and to sink (11)
rz(0.7854) q[0];  // Source node rotation
rz(1.5708) q[11]; // Sink node rotation

// Edge interactions (capacity-weighted)
// Edge 0→6 (capacity 4)
cx q[0], q[6];
rz(1.5708) q[6];
cx q[0], q[6];

// Edge 6→11 (capacity 1)
cx q[6], q[11];
rz(0.3927) q[11];
cx q[6], q[11];

// Layer 2: Additional mixing and constraint enforcement
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

// Additional edge constraints
// Edge 6→1 (capacity 4)
cx q[6], q[1];
rz(1.5708) q[1];
cx q[6], q[1];

// Edge 10→1 (capacity 3)
cx q[10], q[1];
rz(1.1781) q[1];
cx q[10], q[1];

// Edge 6→4 (capacity 1)
cx q[6], q[4];
rz(0.3927) q[4];
cx q[6], q[4];

// Edge 10→4 (capacity 2)
cx q[10], q[4];
rz(0.7854) q[4];
cx q[10], q[4];

// Layer 3: Further optimization
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

// Additional capacity constraints
// Edge 3→8 (capacity 2)
cx q[3], q[8];
rz(0.7854) q[8];
cx q[3], q[8];

// Edge 4→8 (capacity 4)
cx q[4], q[8];
rz(1.5708) q[8];
cx q[4], q[8];

// Edge 8→5 (capacity 2)
cx q[8], q[5];
rz(0.7854) q[5];
cx q[8], q[5];

// Edge 5→10 (capacity 2)
cx q[5], q[10];
rz(0.7854) q[10];
cx q[5], q[10];

// Layer 4: Final optimization and measurement preparation
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

// Final edge constraints and sink connections
// Edge 6→2 (capacity 2)
cx q[6], q[2];
rz(0.7854) q[2];
cx q[6], q[2];

// Edge 6→9 (capacity 2)
cx q[6], q[9];
rz(0.7854) q[9];
cx q[6], q[9];

// Edge 9→6 (capacity 2)
cx q[9], q[6];
rz(0.7854) q[6];
cx q[9], q[6];

// Edge 7→9 (capacity 1)
cx q[7], q[9];
rz(0.3927) q[9];
cx q[7], q[9];

// Edge 10→8 (capacity 1)
cx q[10], q[8];
rz(0.3927) q[8];
cx q[10], q[8];

// Final rotations for measurement
rz(0.7854) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.7854) q[6];
rz(0.3927) q[7];
rz(0.3927) q[8];
rz(0.3927) q[9];
rz(0.3927) q[10];
rz(1.5708) q[11];

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