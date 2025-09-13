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

// Edge interaction terms (layer 1)
// Edge 0-1
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
// Edge 0-3
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
// Edge 0-4
cx q[0], q[9];
rz(0.2251) q[9];
cx q[0], q[9];
// Edge 0-5
cx q[0], q[10];
rz(0.2318) q[10];
cx q[0], q[10];
// Edge 0-6
cx q[0], q[1];
rz(0.2083) q[1];
cx q[0], q[1];
// Edge 1-2
cx q[1], q[2];
rz(0.1924) q[2];
cx q[1], q[2];
// Edge 1-4
cx q[1], q[4];
rz(0.2036) q[4];
cx q[1], q[4];
// Edge 2-3
cx q[2], q[3];
rz(0.1879) q[3];
cx q[2], q[3];
// Edge 2-5
cx q[2], q[5];
rz(0.2192) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.2115) q[6];
cx q[2], q[6];
// Edge 4-6
cx q[4], q[6];
rz(0.1972) q[6];
cx q[4], q[6];

// Layer 2: Mixer and additional parameterized rotations
rz(0.1543) q[0];
rz(0.1428) q[1];
rz(0.1387) q[2];
rz(0.1472) q[3];
rz(0.1519) q[4];
rz(0.1456) q[5];
rz(0.1491) q[6];
rz(0.1364) q[7];
rz(0.1412) q[8];
rz(0.1527) q[9];
rz(0.1485) q[10];

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

// Layer 3: Final parameterized rotations and measurement preparation
rz(0.1087) q[0];
rz(0.1024) q[1];
rz(0.0998) q[2];
rz(0.1053) q[3];
rz(0.1079) q[4];
rz(0.1037) q[5];
rz(0.1062) q[6];
rz(0.0982) q[7];
rz(0.1015) q[8];
rz(0.1081) q[9];
rz(0.1058) q[10];

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