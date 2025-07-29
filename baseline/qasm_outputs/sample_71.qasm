OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
// Initialization
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
// Phase separation (min-cut cost function)
// Edge 0-1
cx q[0], q[1];
rz(5.0) q[1];
cx q[0], q[1];
// Edge 0-5
cx q[0], q[5];
rz(7.0) q[5];
cx q[0], q[5];
// Edge 0-10
cx q[0], q[10];
rz(1.0) q[10];
cx q[0], q[10];
// Edge 1-8
cx q[1], q[8];
rz(4.0) q[8];
cx q[1], q[8];
// Edge 3-10
cx q[3], q[10];
rz(3.0) q[10];
cx q[3], q[10];
// Edge 4-6
cx q[4], q[6];
rz(1.0) q[6];
cx q[4], q[6];
// Edge 5-6
cx q[5], q[6];
rz(7.0) q[6];
cx q[5], q[6];
// Edge 5-8
cx q[5], q[8];
rz(6.0) q[8];
cx q[5], q[8];
// Edge 5-9
cx q[5], q[9];
rz(5.0) q[9];
cx q[5], q[9];
// Edge 6-3
cx q[6], q[3];
rz(5.0) q[3];
cx q[6], q[3];
// Edge 6-4
cx q[6], q[4];
rz(5.0) q[4];
cx q[6], q[4];
// Edge 6-8
cx q[6], q[8];
rz(5.0) q[8];
cx q[6], q[8];
// Edge 6-10
cx q[6], q[10];
rz(2.0) q[10];
cx q[6], q[10];
// Edge 7-1
cx q[7], q[1];
rz(7.0) q[1];
cx q[7], q[1];
// Edge 7-6
cx q[7], q[6];
rz(4.0) q[6];
cx q[7], q[6];
// Edge 8-5
cx q[8], q[5];
rz(1.0) q[5];
cx q[8], q[5];
// Edge 8-7
cx q[8], q[7];
rz(7.0) q[7];
cx q[8], q[7];
// Edge 9-1
cx q[9], q[1];
rz(7.0) q[1];
cx q[9], q[1];
// Edge 9-2
cx q[9], q[2];
rz(6.0) q[2];
cx q[9], q[2];
// Mixer layer
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