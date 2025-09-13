OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard gates
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

// Layer 1: Problem-specific phase rotations
rz(0.3142) q[0];
rz(0.2718) q[1];
rz(0.2856) q[2];
rz(0.3298) q[3];
rz(0.3024) q[4];
rz(0.2917) q[5];
rz(0.2763) q[6];
rz(0.3089) q[7];
rz(0.2971) q[8];
rz(0.2835) q[9];

// Layer 2: Entangling gates for edge constraints
cx q[0], q[1];
rz(-0.1257) q[1];
cx q[0], q[1];
cx q[0], q[3];
rz(-0.1189) q[3];
cx q[0], q[3];
cx q[0], q[5];
rz(-0.1324) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(-0.1073) q[2];
cx q[1], q[2];
cx q[1], q[6];
rz(-0.1416) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(-0.1138) q[3];
cx q[2], q[3];
cx q[3], q[4];
rz(-0.1295) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(-0.1217) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(-0.1352) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(-0.1384) q[6];
cx q[5], q[6];

// Layer 3: Mixer layer with optimal parameters
rx(0.8472) q[0];
rx(0.8926) q[1];
rx(0.8763) q[2];
rx(0.8319) q[3];
rx(0.8594) q[4];
rx(0.8702) q[5];
rx(0.8856) q[6];
rx(0.8530) q[7];
rx(0.8648) q[8];
rx(0.8784) q[9];

// Layer 4: Final optimization layer
rz(0.4189) q[0];
rz(0.3624) q[1];
rz(0.3808) q[2];
rz(0.4396) q[3];
rz(0.4032) q[4];
rz(0.3889) q[5];
rz(0.3684) q[6];
rz(0.4119) q[7];
rz(0.3961) q[8];
rz(0.3780) q[9];

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