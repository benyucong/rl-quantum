OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
h q[0];
h q[1];
h q[2];
h q[3];
// Layer 1 - Mixer
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(2.3562) q[3];
// Layer 1 - Problem
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(0.3927) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];
// Layer 2 - Mixer
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(2.3562) q[3];
// Layer 2 - Problem
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(0.3927) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];