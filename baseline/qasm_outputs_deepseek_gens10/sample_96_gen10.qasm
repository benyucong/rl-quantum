OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1 - Edge interactions
rz(0.314) q[0];
rz(0.628) q[1];
rz(0.471) q[2];
rz(0.392) q[3];
rz(0.549) q[4];
rz(0.706) q[5];
rz(0.235) q[6];
rz(0.863) q[7];

cx q[0], q[4];
rz(0.157) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.314) q[5];
cx q[0], q[5];

cx q[1], q[3];
rz(0.157) q[3];
cx q[1], q[3];

cx q[1], q[5];
rz(0.235) q[5];
cx q[1], q[5];

cx q[1], q[7];
rz(0.078) q[7];
cx q[1], q[7];

cx q[2], q[1];
rz(0.078) q[1];
cx q[2], q[1];

cx q[2], q[6];
rz(0.157) q[6];
cx q[2], q[6];

// Layer 2 - Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

rz(0.471) q[0];
rz(0.392) q[1];
rz(0.549) q[2];
rz(0.314) q[3];
rz(0.706) q[4];
rz(0.863) q[5];
rz(0.235) q[6];
rz(0.628) q[7];

cx q[3], q[1];
rz(0.157) q[1];
cx q[3], q[1];

cx q[3], q[5];
rz(0.078) q[5];
cx q[3], q[5];

cx q[4], q[1];
rz(0.157) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(0.157) q[2];
cx q[4], q[2];

cx q[4], q[3];
rz(0.235) q[3];
cx q[4], q[3];

cx q[4], q[5];
rz(0.078) q[5];
cx q[4], q[5];

// Layer 3 - Additional optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

rz(0.549) q[0];
rz(0.471) q[1];
rz(0.392) q[2];
rz(0.706) q[3];
rz(0.628) q[4];
rz(0.863) q[5];
rz(0.314) q[6];
rz(0.235) q[7];

cx q[5], q[7];
rz(0.235) q[7];
cx q[5], q[7];

cx q[6], q[5];
rz(0.157) q[5];
cx q[6], q[5];

// Layer 4 - Final optimization and measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

rz(0.706) q[0];
rz(0.628) q[1];
rz(0.549) q[2];
rz(0.863) q[3];
rz(0.471) q[4];
rz(0.392) q[5];
rz(0.706) q[6];
rz(0.314) q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];