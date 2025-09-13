OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialization and first parameterized rotations
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

// First layer parameterized rotations
rz(0.7854) q[0];
rz(1.0472) q[1];
rz(0.5236) q[2];
rz(0.3927) q[3];
rz(0.2618) q[4];
rz(0.6545) q[5];
rz(0.4363) q[6];
rz(0.3491) q[7];
rz(0.5236) q[8];
rz(0.7854) q[9];
rz(0.6109) q[10];
rz(0.4363) q[11];

// First layer entangling gates (flow conservation constraints)
cx q[0], q[1];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[1];
cx q[2], q[3];

// Layer 2: Second parameterized rotations
rz(0.6981) q[0];
rz(0.8727) q[1];
rz(0.4363) q[2];
rz(0.3272) q[3];
rz(0.2182) q[4];
rz(0.5455) q[5];
rz(0.3636) q[6];
rz(0.2909) q[7];
rz(0.4363) q[8];
rz(0.6545) q[9];
rz(0.5091) q[10];
rz(0.3636) q[11];

// Second layer entangling gates (capacity constraints)
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[6];
cx q[1], q[7];
cx q[2], q[8];
cx q[2], q[9];
cx q[3], q[10];
cx q[3], q[11];

// Layer 3: Final parameterized rotations
rz(0.6109) q[0];
rz(0.6981) q[1];
rz(0.3491) q[2];
rz(0.2618) q[3];
rz(0.1745) q[4];
rz(0.4363) q[5];
rz(0.2909) q[6];
rz(0.2327) q[7];
rz(0.3491) q[8];
rz(0.5236) q[9];
rz(0.4073) q[10];
rz(0.2909) q[11];

// Final entangling gates (flow optimization)
cx q[4], q[5];
cx q[6], q[7];
cx q[8], q[9];
cx q[10], q[11];
cx q[0], q[4];
cx q[1], q[6];
cx q[2], q[8];
cx q[3], q[10];

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