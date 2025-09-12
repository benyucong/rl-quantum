OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
hx(q[0]);
hx(q[1]);
cx(q[0], q[2]);
cx(q[1], q[3]);
cx(q[2], q[4]);
cx(q[3], q[5]);
cx(q[4], q[6]);
cx(q[5], q[7]);
cx(q[6], q[8]);

// Layer 2
rx(1.2034) q[0];
rz(0.9023) q[0];
rx(1.1345) q[1];
rz(0.7832) q[1];
ry(0.4567) q[2];
rz(0.3214) q[2];
ry(1.0193) q[3];
rz(0.4561) q[3];
ry(0.8965) q[4];
rz(0.1235) q[4];
ry(1.0321) q[5];
rz(0.9874) q[5];
ry(0.5412) q[6];
rz(0.7654) q[6];
ry(1.0123) q[7];
rz(0.4312) q[7];
ry(0.7742) q[8];
rz(0.6421) q[8];

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