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
rz(0.2251) q[2];
rz(0.2033) q[3];
rz(0.1928) q[4];
rz(0.2196) q[5];
rz(0.2082) q[6];
rz(0.1974) q[7];
rz(0.2119) q[8];
rz(0.2057) q[9];
rz(0.1893) q[10];
rz(0.2168) q[11];

// Layer 1: Problem-specific entangling gates
// Edge (0,1)
cx q[0], q[1];
rz(0.0873) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(0.0912) q[4];
cx q[0], q[4];

// Edge (0,6)
cx q[0], q[6];
rz(0.0856) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.0894) q[4];
cx q[1], q[4];

// Edge (1,6)
cx q[1], q[6];
rz(0.0839) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.0941) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.0887) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.0925) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.0869) q[4];
cx q[3], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.0908) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.0952) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.0821) q[6];
cx q[5], q[6];

// Layer 2: Mixer and parameterized rotations
h q[0];
rz(0.1567) q[0];
h q[0];
h q[1];
rz(0.1623) q[1];
h q[1];
h q[2];
rz(0.1519) q[2];
h q[2];
h q[3];
rz(0.1648) q[3];
h q[3];
h q[4];
rz(0.1582) q[4];
h q[4];
h q[5];
rz(0.1534) q[5];
h q[5];
h q[6];
rz(0.1605) q[6];
h q[6];
h q[7];
rz(0.1578) q[7];
h q[7];
h q[8];
rz(0.1619) q[8];
h q[8];
h q[9];
rz(0.1552) q[9];
h q[9];
h q[10];
rz(0.1636) q[10];
h q[10];
h q[11];
rz(0.1528) q[11];
h q[11];

// Layer 2: Problem-specific entangling gates
// Edge (0,1)
cx q[0], q[1];
rz(0.0738) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(0.0769) q[4];
cx q[0], q[4];

// Edge (0,6)
cx q[0], q[6];
rz(0.0721) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.0754) q[4];
cx q[1], q[4];

// Edge (1,6)
cx q[1], q[6];
rz(0.0708) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.0792) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.0747) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.0779) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.0732) q[4];
cx q[3], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.0764) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.0801) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.0692) q[6];
cx q[5], q[6];

// Layer 3: Final mixer and parameterized rotations
h q[0];
rz(0.1289) q[0];
h q[0];
h q[1];
rz(0.1332) q[1];
h q[1];
h q[2];
rz(0.1247) q[2];
h q[2];
h q[3];
rz(0.1354) q[3];
h q[3];
h q[4];
rz(0.1301) q[4];
h q[4];
h q[5];
rz(0.1263) q[5];
h q[5];
h q[6];
rz(0.1318) q[6];
h q[6];
h q[7];
rz(0.1296) q[7];
h q[7];
h q[8];
rz(0.1329) q[8];
h q[8];
h q[9];
rz(0.1275) q[9];
h q[9];
h q[10];
rz(0.1343) q[10];
h q[10];
h q[11];
rz(0.1254) q[11];
h q[11];

// Layer 3: Final problem-specific entangling gates
// Edge (0,1)
cx q[0], q[1];
rz(0.0607) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(0.0632) q[4];
cx q[0], q[4];

// Edge (0,6)
cx q[0], q[6];
rz(0.0593) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.0620) q[4];
cx q[1], q[4];

// Edge (1,6)
cx q[1], q[6];
rz(0.0582) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.0651) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.0614) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.0640) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.0602) q[4];
cx q[3], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.0628) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.0658) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.0569) q[6];
cx q[5], q[6];

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