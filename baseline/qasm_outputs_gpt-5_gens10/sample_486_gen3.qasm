OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Applying pairs of controlled rotations based on matching edges
// Match node 0 to 5 and 8
cx q[0], q[5];
rz(0.1863) q[5];
cx q[0], q[5];

cx q[0], q[8];
rz(0.1863) q[8];
cx q[0], q[8];

// Match node 1 to 6
cx q[1], q[6];
rz(0.1209) q[6];
cx q[1], q[6];

// Match node 2 to 7 and 12
cx q[2], q[7];
rz(0.1869) q[7];
cx q[2], q[7];

cx q[2], q[12];
rz(0.1869) q[12];
cx q[2], q[12];

// Match node 3 to 5 and 8
cx q[3], q[5];
rz(0.1357) q[5];
cx q[3], q[5];

cx q[3], q[8];
rz(0.1357) q[8];
cx q[3], q[8];

// Match node 4 to 9 and 5 and 8
cx q[4], q[9];
rz(0.1325) q[9];
cx q[4], q[9];

cx q[4], q[5];
rz(0.1958) q[5];
cx q[4], q[5];

cx q[4], q[8];
rz(0.1958) q[8];
cx q[4], q[8];

// Layer 2: Entanglement and further rotation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

cx q[0], q[5];
rz(-0.1478) q[5];
cx q[0], q[5];

cx q[1], q[6];
rz(-0.1453) q[6];
cx q[1], q[6];

cx q[2], q[7];
rz(-0.1625) q[7];
cx q[2], q[7];

cx q[3], q[8];
rz(-0.1453) q[8];
cx q[3], q[8];

cx q[4], q[9];
rz(-0.1256) q[9];
cx q[4], q[9];

// Layer 3: Measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

cx q[0], q[5];
rz(0.1863) q[5];
cx q[0], q[5];

cx q[1], q[6];
rz(0.1209) q[6];
cx q[1], q[6];

cx q[2], q[7];
rz(0.1869) q[7];
cx q[2], q[7];

cx q[3], q[8];
rz(0.1357) q[8];
cx q[3], q[8];

cx q[4], q[9];
rz(0.1325) q[9];
cx q[4], q[9];

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