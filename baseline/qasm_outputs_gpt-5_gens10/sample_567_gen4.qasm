OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Initialization Layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First Layer of Rotations and Entangling
rz(2.256) q[0];
cx q[0], q[7];
rz(1.982) q[1];
cx q[1], q[7];
cx q[1], q[8];
rz(1.145) q[2];
cx q[2], q[9];
rz(2.191) q[3];
cx q[3], q[10];
rz(0.876) q[4];
cx q[4], q[11];
rz(1.034) q[5];
cx q[5], q[11];
rz(1.874) q[6];
cx q[6], q[12];

// Second Layer of Entangling and Rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

rz(0.763) q[0];
cx q[0], q[8];
rz(1.196) q[1];
cx q[1], q[9];
cx q[1], q[8];
rz(1.957) q[2];
cx q[2], q[10];
rz(0.643) q[3];
cx q[3], q[11];
rz(1.505) q[4];
cx q[4], q[9];
rz(2.425) q[5];
cx q[5], q[9];

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