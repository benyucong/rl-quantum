OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
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
// Hyperedge [9,2,5,6]
ccx q[9], q[2], q[5];
rz(0.7854) q[5];
ccx q[9], q[2], q[5];
ccx q[9], q[2], q[6];
rz(0.7854) q[6];
ccx q[9], q[2], q[6];
// Hyperedge [3,5]
cx q[3], q[5];
rz(1.5708) q[5];
cx q[3], q[5];
// Hyperedge [9,2,6,7]
ccx q[9], q[2], q[6];
rz(0.7854) q[6];
ccx q[9], q[2], q[6];
ccx q[9], q[2], q[7];
rz(0.7854) q[7];
ccx q[9], q[2], q[7];
// Hyperedge [4,5,6,7]
ccx q[4], q[5], q[6];
rz(0.7854) q[6];
ccx q[4], q[5], q[6];
ccx q[4], q[5], q[7];
rz(0.7854) q[7];
ccx q[4], q[5], q[7];
// Hyperedge [9,2,4,5]
ccx q[9], q[2], q[4];
rz(0.7854) q[4];
ccx q[9], q[2], q[4];
ccx q[9], q[2], q[5];
rz(0.7854) q[5];
ccx q[9], q[2], q[5];
// Mixer layer
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];
rx(1.5708) q[9];
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