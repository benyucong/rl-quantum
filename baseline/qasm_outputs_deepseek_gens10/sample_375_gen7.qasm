OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Edge interactions with optimal parameters
rz(0.314) q[0];
rz(0.314) q[5];
cx q[0], q[5];
rz(-0.628) q[5];
cx q[0], q[5];

rz(0.039) q[1];
rz(0.039) q[6];
cx q[1], q[6];
rz(-0.078) q[6];
cx q[1], q[6];

rz(0.589) q[1];
rz(0.589) q[5];
cx q[1], q[5];
rz(-1.178) q[5];
cx q[1], q[5];

rz(0.275) q[2];
rz(0.275) q[7];
cx q[2], q[7];
rz(-0.550) q[7];
cx q[2], q[7];

rz(0.550) q[2];
rz(0.550) q[8];
cx q[2], q[8];
rz(-1.100) q[8];
cx q[2], q[8];

rz(0.667) q[2];
rz(0.667) q[6];
cx q[2], q[6];
rz(-1.334) q[6];
cx q[2], q[6];

rz(0.039) q[3];
rz(0.039) q[8];
cx q[3], q[8];
rz(-0.078) q[8];
cx q[3], q[8];

rz(0.745) q[3];
rz(0.745) q[7];
cx q[3], q[7];
rz(-1.490) q[7];
cx q[3], q[7];

rz(0.431) q[3];
rz(0.431) q[5];
cx q[3], q[5];
rz(-0.862) q[5];
cx q[3], q[5];

// Layer 2: Mixing and optimization
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];
rx(0.785) q[8];

// Layer 3: Final optimization and measurement preparation
rz(0.942) q[0];
rz(0.942) q[5];
cx q[0], q[5];
rz(-1.884) q[5];
cx q[0], q[5];

rz(0.118) q[1];
rz(0.118) q[6];
cx q[1], q[6];
rz(-0.236) q[6];
cx q[1], q[6];

rz(1.767) q[1];
rz(1.767) q[5];
cx q[1], q[5];
rz(-3.534) q[5];
cx q[1], q[5];

rz(0.825) q[2];
rz(0.825) q[7];
cx q[2], q[7];
rz(-1.650) q[7];
cx q[2], q[7];

rz(1.650) q[2];
rz(1.650) q[8];
cx q[2], q[8];
rz(-3.300) q[8];
cx q[2], q[8];

rz(2.001) q[2];
rz(2.001) q[6];
cx q[2], q[6];
rz(-4.002) q[6];
cx q[2], q[6];

rz(0.118) q[3];
rz(0.118) q[8];
cx q[3], q[8];
rz(-0.236) q[8];
cx q[3], q[8];

rz(2.235) q[3];
rz(2.235) q[7];
cx q[3], q[7];
rz(-4.470) q[7];
cx q[3], q[7];

rz(1.293) q[3];
rz(1.293) q[5];
cx q[3], q[5];
rz(-2.586) q[5];
cx q[3], q[5];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];