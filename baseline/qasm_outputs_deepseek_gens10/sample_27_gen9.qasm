OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

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
h q[11];

rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2256) q[2];
rz(0.2031) q[3];
rz(0.1923) q[4];
rz(0.2198) q[5];
rz(0.2076) q[6];
rz(0.1854) q[7];
rz(0.2119) q[8];
rz(0.1968) q[9];
rz(0.2234) q[10];
rz(0.1892) q[11];

// Layer 1: Problem-specific entangling gates (edge cover constraints)
// Edge (0,1)
cx q[0], q[1];
rz(0.0873) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(0.0915) q[4];
cx q[0], q[4];

// Edge (0,6)
cx q[0], q[6];
rz(0.0942) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.0826) q[4];
cx q[1], q[4];

// Edge (1,6)
cx q[1], q[6];
rz(0.0897) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.0789) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.0851) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.0924) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.0813) q[4];
cx q[3], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.0885) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.0837) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.0902) q[6];
cx q[5], q[6];

// Layer 2: Mixer and additional parameterized rotations
rz(0.1567) q[0];
rz(0.1423) q[1];
rz(0.1689) q[2];
rz(0.1482) q[3];
rz(0.1384) q[4];
rz(0.1652) q[5];
rz(0.1528) q[6];
rz(0.1326) q[7];
rz(0.1594) q[8];
rz(0.1441) q[9];
rz(0.1718) q[10];
rz(0.1369) q[11];

// Layer 2: Additional entangling for better convergence
cx q[0], q[7];
rz(0.0758) q[7];
cx q[0], q[7];

cx q[1], q[8];
rz(0.0732) q[8];
cx q[1], q[8];

cx q[2], q[9];
rz(0.0769) q[9];
cx q[2], q[9];

cx q[3], q[10];
rz(0.0745) q[10];
cx q[3], q[10];

cx q[4], q[11];
rz(0.0728) q[11];
cx q[4], q[11];

// Layer 3: Final parameterized rotations
rz(0.1189) q[0];
rz(0.1056) q[1];
rz(0.1267) q[2];
rz(0.1084) q[3];
rz(0.0987) q[4];
rz(0.1238) q[5];
rz(0.1125) q[6];
rz(0.0942) q[7];
rz(0.1196) q[8];
rz(0.1068) q[9];
rz(0.1283) q[10];
rz(0.1013) q[11];

// Final measurements
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