OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Hyperedge [2,6]
cx q[2], q[6];
rz(-0.1257) q[6];
cx q[2], q[6];
// Hyperedge [0,2,7]
cx q[0], q[2];
cx q[2], q[7];
rz(-0.0838) q[7];
cx q[2], q[7];
cx q[0], q[2];
// Hyperedge [8,2,3,4]
cx q[8], q[2];
cx q[2], q[3];
cx q[3], q[4];
rz(-0.0628) q[4];
cx q[3], q[4];
cx q[2], q[3];
cx q[8], q[2];
// Hyperedge [1,6]
cx q[1], q[6];
rz(-0.1257) q[6];
cx q[1], q[6];
// Hyperedge [3,7]
cx q[3], q[7];
rz(-0.1257) q[7];
cx q[3], q[7];
// Hyperedge [4,5,6]
cx q[4], q[5];
cx q[5], q[6];
rz(-0.0838) q[6];
cx q[5], q[6];
cx q[4], q[5];
// Hyperedge [4,5,7]
cx q[4], q[5];
cx q[5], q[7];
rz(-0.0838) q[7];
cx q[5], q[7];
cx q[4], q[5];
// Hyperedge [8,2,7]
cx q[8], q[2];
cx q[2], q[7];
rz(-0.0838) q[7];
cx q[2], q[7];
cx q[8], q[2];
// Hyperedge [6,7]
cx q[6], q[7];
rz(-0.1257) q[7];
cx q[6], q[7];
// Mixer layer
h q[0];
rz(0.2513) q[0];
h q[0];
h q[1];
rz(0.2513) q[1];
h q[1];
h q[2];
rz(0.2513) q[2];
h q[2];
h q[3];
rz(0.2513) q[3];
h q[3];
h q[4];
rz(0.2513) q[4];
h q[4];
h q[5];
rz(0.2513) q[5];
h q[5];
h q[6];
rz(0.2513) q[6];
h q[6];
h q[7];
rz(0.2513) q[7];
h q[7];
h q[8];
rz(0.2513) q[8];
h q[8];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];