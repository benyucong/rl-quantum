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
rz(0.314) q[1];
cx q[0], q[1];
rz(-0.314) q[1];
cx q[0], q[1];

rz(0.524) q[2];
cx q[0], q[2];
rz(-0.524) q[2];
cx q[0], q[2];

rz(0.419) q[3];
cx q[0], q[3];
rz(-0.419) q[3];
cx q[0], q[3];

rz(0.209) q[4];
cx q[0], q[4];
rz(-0.209) q[4];
cx q[0], q[4];

rz(0.524) q[5];
cx q[1], q[5];
rz(-0.524) q[5];
cx q[1], q[5];

rz(0.209) q[6];
cx q[1], q[6];
rz(-0.209) q[6];
cx q[1], q[6];

rz(0.524) q[4];
cx q[2], q[4];
rz(-0.524) q[4];
cx q[2], q[4];

rz(0.419) q[5];
cx q[2], q[5];
rz(-0.419) q[5];
cx q[2], q[5];

rz(0.209) q[5];
cx q[3], q[5];
rz(-0.209) q[5];
cx q[3], q[5];

rz(0.524) q[6];
cx q[4], q[6];
rz(-0.524) q[6];
cx q[4], q[6];

rz(0.524) q[8];
cx q[4], q[8];
rz(-0.524) q[8];
cx q[4], q[8];

// Layer 2: Mixing and optimization
rz(0.157) q[0];
rz(0.262) q[1];
rz(0.209) q[2];
rz(0.314) q[3];
rz(0.262) q[4];
rz(0.314) q[5];
rz(0.209) q[6];
rz(0.157) q[7];
rz(0.262) q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 3: Final optimization and measurement preparation
rz(0.078) q[0];
rz(0.131) q[1];
rz(0.105) q[2];
rz(0.157) q[3];
rz(0.131) q[4];
rz(0.157) q[5];
rz(0.105) q[6];
rz(0.078) q[7];
rz(0.131) q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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