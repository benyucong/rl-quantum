OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply RZZ gates for edge constraints with optimal parameters
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(-1.5708) q[3];
cx q[0], q[3];

rz(1.8849) q[0];
rz(1.8849) q[10];
cx q[0], q[10];
rz(-3.7698) q[10];
cx q[0], q[10];

rz(3.1416) q[0];
rz(3.1416) q[5];
cx q[0], q[5];
rz(-6.2832) q[5];
cx q[0], q[5];

rz(0.1571) q[1];
rz(0.1571) q[4];
cx q[1], q[4];
rz(-0.3142) q[4];
cx q[1], q[4];

rz(2.3562) q[1];
rz(2.3562) q[3];
cx q[1], q[3];
rz(-4.7124) q[3];
cx q[1], q[3];

rz(2.3562) q[1];
rz(2.3562) q[7];
cx q[1], q[7];
rz(-4.7124) q[7];
cx q[1], q[7];

rz(0.7854) q[2];
rz(0.7854) q[5];
cx q[2], q[5];
rz(-1.5708) q[5];
cx q[2], q[5];

rz(2.1991) q[2];
rz(2.1991) q[6];
cx q[2], q[6];
rz(-4.3982) q[6];
cx q[2], q[6];

// Layer 2: Mixing and optimization
h q[0];
rz(0.3927) q[0];
h q[0];

h q[1];
rz(0.7854) q[1];
h q[1];

h q[2];
rz(0.5236) q[2];
h q[2];

h q[3];
rz(0.6545) q[3];
h q[3];

h q[4];
rz(0.2618) q[4];
h q[4];

h q[5];
rz(0.9163) q[5];
h q[5];

h q[6];
rz(0.4363) q[6];
h q[6];

h q[7];
rz(0.3491) q[7];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];