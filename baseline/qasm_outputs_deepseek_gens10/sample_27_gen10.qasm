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

// Edge interactions - Layer 1
// Edge 0-1
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge 0-4
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];

// Edge 0-6
cx q[0], q[6];
rz(0.2251) q[6];
cx q[0], q[6];

// Edge 1-4
cx q[1], q[4];
rz(0.1832) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.2076) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.1924) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.2058) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.2189) q[6];
cx q[2], q[6];

// Edge 3-4
cx q[3], q[4];
rz(0.1765) q[4];
cx q[3], q[4];

// Edge 3-6
cx q[3], q[6];
rz(0.2013) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.1897) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.2132) q[6];
cx q[5], q[6];

// Layer 2: Mixer and parameterized rotations
rz(0.1247) q[0];
rz(0.1328) q[1];
rz(0.1189) q[2];
rz(0.1276) q[3];
rz(0.1412) q[4];
rz(0.1354) q[5];
rz(0.1498) q[6];
rz(0.1215) q[7];
rz(0.1293) q[8];
rz(0.1167) q[9];
rz(0.1384) q[10];
rz(0.1426) q[11];

// Edge interactions - Layer 2
// Edge 0-1
cx q[0], q[1];
rz(0.1089) q[1];
cx q[0], q[1];

// Edge 0-4
cx q[0], q[4];
rz(0.1012) q[4];
cx q[0], q[4];

// Edge 0-6
cx q[0], q[6];
rz(0.1145) q[6];
cx q[0], q[6];

// Edge 1-4
cx q[1], q[4];
rz(0.0934) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.1057) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.0981) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.1048) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.1114) q[6];
cx q[2], q[6];

// Edge 3-4
cx q[3], q[4];
rz(0.0899) q[4];
cx q[3], q[4];

// Edge 3-6
cx q[3], q[6];
rz(0.1025) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.0966) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.1085) q[6];
cx q[5], q[6];

// Layer 3: Final mixer and parameterized rotations
rz(0.0638) q[0];
rz(0.0679) q[1];
rz(0.0608) q[2];
rz(0.0652) q[3];
rz(0.0721) q[4];
rz(0.0692) q[5];
rz(0.0765) q[6];
rz(0.0621) q[7];
rz(0.0661) q[8];
rz(0.0596) q[9];
rz(0.0707) q[10];
rz(0.0729) q[11];

// Edge interactions - Layer 3
// Edge 0-1
cx q[0], q[1];
rz(0.0556) q[1];
cx q[0], q[1];

// Edge 0-4
cx q[0], q[4];
rz(0.0517) q[4];
cx q[0], q[4];

// Edge 0-6
cx q[0], q[6];
rz(0.0584) q[6];
cx q[0], q[6];

// Edge 1-4
cx q[1], q[4];
rz(0.0477) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.0540) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.0501) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.0535) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.0569) q[6];
cx q[2], q[6];

// Edge 3-4
cx q[3], q[4];
rz(0.0459) q[4];
cx q[3], q[4];

// Edge 3-6
cx q[3], q[6];
rz(0.0523) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.0493) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.0554) q[6];
cx q[5], q[6];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];