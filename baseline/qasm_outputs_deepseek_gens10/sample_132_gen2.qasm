OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;
// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// First QAOA layer - phase separator
// Clique constraints for k=4: need 4 connected vertices
// Check triangle (0,1,2,3) - fully connected
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
// Mixer layer
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
// Second QAOA layer - phase separator
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
// Final mixer layer
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];