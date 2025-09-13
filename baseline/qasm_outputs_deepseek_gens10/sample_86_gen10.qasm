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
rz(0.2176) q[6];
rz(0.1924) q[7];
rz(0.2089) q[8];
rz(0.2251) q[9];
rz(0.2013) q[10];

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,4)
cx q[0], q[4];
rz(-0.1247) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(-0.1189) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(-0.1324) q[6];
cx q[0], q[6];

// Edge (1,2)
cx q[1], q[2];
rz(-0.1083) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(-0.1156) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(-0.1278) q[4];
cx q[1], q[4];

// Edge (2,4)
cx q[2], q[4];
rz(-0.1215) q[4];
cx q[2], q[4];

// Edge (2,6)
cx q[2], q[6];
rz(-0.1192) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(-0.1137) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(-0.1264) q[5];
cx q[3], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(-0.1341) q[6];
cx q[5], q[6];

// Layer 3: Final mixing layer with optimal parameters
h q[0];
rz(0.2876) q[0];
h q[0];

h q[1];
rz(0.2658) q[1];
h q[1];

h q[2];
rz(0.2983) q[2];
h q[2];

h q[3];
rz(0.2719) q[3];
h q[3];

h q[4];
rz(0.2542) q[4];
h q[4];

h q[5];
rz(0.2891) q[5];
h q[5];

h q[6];
rz(0.2824) q[6];
h q[6];

h q[7];
rz(0.2579) q[7];
h q[7];

h q[8];
rz(0.2742) q[8];
h q[8];

h q[9];
rz(0.2906) q[9];
h q[9];

h q[10];
rz(0.2678) q[10];
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