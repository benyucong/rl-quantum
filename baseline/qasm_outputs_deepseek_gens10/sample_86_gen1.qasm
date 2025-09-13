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
rz(0.2312) q[2];
rz(0.2056) q[3];
rz(0.1893) q[4];
rz(0.2238) q[5];
rz(0.2174) q[6];
rz(0.1921) q[7];
rz(0.2089) q[8];
rz(0.2256) q[9];
rz(0.2013) q[10];

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,4)
cx q[0], q[4];
rz(-0.1278) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(-0.1342) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(-0.1416) q[6];
cx q[0], q[6];

// Edge (1,2)
cx q[1], q[2];
rz(-0.1189) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(-0.1253) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(-0.1327) q[4];
cx q[1], q[4];

// Edge (2,4)
cx q[2], q[4];
rz(-0.1294) q[4];
cx q[2], q[4];

// Edge (2,6)
cx q[2], q[6];
rz(-0.1368) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(-0.1315) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(-0.1379) q[5];
cx q[3], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(-0.1442) q[6];
cx q[5], q[6];

// Layer 3: Final parameterized rotations
rz(0.3124) q[0];
rz(0.2987) q[1];
rz(0.3241) q[2];
rz(0.3015) q[3];
rz(0.2872) q[4];
rz(0.3186) q[5];
rz(0.3158) q[6];
rz(0.2914) q[7];
rz(0.3082) q[8];
rz(0.3219) q[9];
rz(0.2976) q[10];

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