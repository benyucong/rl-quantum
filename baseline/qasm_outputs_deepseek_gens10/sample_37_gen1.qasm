OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and parameterized rotations
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

rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2256) q[2];
rz(0.2031) q[3];
rz(0.1923) q[4];
rz(0.2089) q[5];
rz(0.2217) q[6];
rz(0.1974) q[7];
rz(0.2132) q[8];
rz(0.2068) q[9];
rz(0.2195) q[10];

// Layer 2: Edge constraint mixers
// Edge (0,4)
cx q[0], q[4];
rz(-0.0873) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(-0.0912) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(-0.0836) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(-0.0859) q[3];
cx q[1], q[3];

// Edge (2,3)
cx q[2], q[3];
rz(-0.0794) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(-0.0821) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(-0.0847) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(-0.0883) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(-0.0809) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(-0.0832) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(-0.0867) q[6];
cx q[3], q[6];

// Layer 3: Final parameterized rotations and measurements
rz(0.1078) q[0];
rz(0.0993) q[1];
rz(0.1128) q[2];
rz(0.1016) q[3];
rz(0.0962) q[4];
rz(0.1045) q[5];
rz(0.1109) q[6];
rz(0.0987) q[7];
rz(0.1066) q[8];
rz(0.1034) q[9];
rz(0.1098) q[10];

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