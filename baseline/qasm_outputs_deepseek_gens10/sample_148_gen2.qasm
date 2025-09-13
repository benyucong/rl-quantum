OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Edge 0-2 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-0.7854) q[2];
cx q[0], q[2];
// Edge 1-2 (capacity 4)
rz(1.5708) q[1];
rz(1.5708) q[2];
cx q[1], q[2];
rz(-1.5708) q[2];
cx q[1], q[2];
// Edge 2-4 (capacity 6)
rz(2.3562) q[2];
rz(2.3562) q[4];
cx q[2], q[4];
rz(-2.3562) q[4];
cx q[2], q[4];
// Edge 3-2 (capacity 2)
rz(1.1781) q[3];
rz(1.1781) q[2];
cx q[3], q[2];
rz(-1.1781) q[2];
cx q[3], q[2];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Edge 0-2 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-0.7854) q[2];
cx q[0], q[2];
// Edge 1-2 (capacity 4)
rz(1.5708) q[1];
rz(1.5708) q[2];
cx q[1], q[2];
rz(-1.5708) q[2];
cx q[1], q[2];
// Edge 2-4 (capacity 6)
rz(2.3562) q[2];
rz(2.3562) q[4];
cx q[2], q[4];
rz(-2.3562) q[4];
cx q[2], q[4];
// Edge 3-2 (capacity 2)
rz(1.1781) q[3];
rz(1.1781) q[2];
cx q[3], q[2];
rz(-1.1781) q[2];
cx q[3], q[2];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Edge 0-2 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-0.7854) q[2];
cx q[0], q[2];
// Edge 1-2 (capacity 4)
rz(1.5708) q[1];
rz(1.5708) q[2];
cx q[1], q[2];
rz(-1.5708) q[2];
cx q[1], q[2];
// Edge 2-4 (capacity 6)
rz(2.3562) q[2];
rz(2.3562) q[4];
cx q[2], q[4];
rz(-2.3562) q[4];
cx q[2], q[4];
// Edge 3-2 (capacity 2)
rz(1.1781) q[3];
rz(1.1781) q[2];
cx q[3], q[2];
rz(-1.1781) q[2];
cx q[3], q[2];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Edge 0-2 (capacity 1)
rz(0.7854) q[0];
rz(0.7854) q[2];
cx q[0], q[2];
rz(-0.7854) q[2];
cx q[0], q[2];
// Edge 1-2 (capacity 4)
rz(1.5708) q[1];
rz(1.5708) q[2];
cx q[1], q[2];
rz(-1.5708) q[2];
cx q[1], q[2];
// Edge 2-4 (capacity 6)
rz(2.3562) q[2];
rz(2.3562) q[4];
cx q[2], q[4];
rz(-2.3562) q[4];
cx q[2], q[4];
// Edge 3-2 (capacity 2)
rz(1.1781) q[3];
rz(1.1781) q[2];
cx q[3], q[2];
rz(-1.1781) q[2];
cx q[3], q[2];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];