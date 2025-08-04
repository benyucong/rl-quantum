OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer
// Edge 0-1
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge 0-2
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
// Edge 0-7
cx q[0], q[7];
rz(0.2618) q[7];
cx q[0], q[7];
// Edge 1-3
cx q[1], q[3];
rz(1.5708) q[3];
cx q[1], q[3];
// Edge 1-5
cx q[1], q[5];
rz(1.5708) q[5];
cx q[1], q[5];
// Edge 1-7
cx q[1], q[7];
rz(0.2618) q[7];
cx q[1], q[7];
// Edge 3-2
cx q[3], q[2];
rz(1.5708) q[2];
cx q[3], q[2];
// Edge 3-7
cx q[3], q[7];
rz(1.0472) q[7];
cx q[3], q[7];
// Edge 4-6
cx q[4], q[6];
rz(1.5708) q[6];
cx q[4], q[6];
// Edge 5-6
cx q[5], q[6];
rz(0.3927) q[6];
cx q[5], q[6];
// Edge 6-1
cx q[6], q[1];
rz(1.5708) q[1];
cx q[6], q[1];

// Second layer
// Edge 0-1
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge 0-2
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
// Edge 0-7
cx q[0], q[7];
rz(0.2618) q[7];
cx q[0], q[7];
// Edge 1-3
cx q[1], q[3];
rz(1.5708) q[3];
cx q[1], q[3];
// Edge 1-5
cx q[1], q[5];
rz(1.5708) q[5];
cx q[1], q[5];
// Edge 1-7
cx q[1], q[7];
rz(0.2618) q[7];
cx q[1], q[7];
// Edge 3-2
cx q[3], q[2];
rz(1.5708) q[2];
cx q[3], q[2];
// Edge 3-7
cx q[3], q[7];
rz(1.0472) q[7];
cx q[3], q[7];
// Edge 4-6
cx q[4], q[6];
rz(1.5708) q[6];
cx q[4], q[6];
// Edge 5-6
cx q[5], q[6];
rz(0.3927) q[6];
cx q[5], q[6];
// Edge 6-1
cx q[6], q[1];
rz(1.5708) q[1];
cx q[6], q[1];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];