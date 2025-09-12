OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2 - Encoding the edges based on capacities
cx q[0], q[1]; // source -> 1
rz(-0.7854) q[1]; // tuning phase
cx q[0], q[5]; // source -> 5
rz(-0.7854) q[5]; // tuning phase
cx q[0], q[6]; // source -> 6
rz(-0.5236) q[6]; // tuning phase
cx q[1], q[3]; // 1 -> 3
rz(-0.7854) q[3]; // tuning phase
cx q[1], q[5]; // 1 -> 5
rz(-1.5708) q[5]; // tuning phase
cx q[3], q[5]; // 3 -> 5
rz(-0.5236) q[5]; // tuning phase
cx q[3], q[6]; // 3 -> 6
rz(-0.5236) q[6]; // tuning phase
cx q[3], q[7]; // 3 -> 7
rz(-0.7854) q[7]; // tuning phase
cx q[2], q[4]; // 2 -> 4
rz(-0.7854) q[4]; // tuning phase
cx q[4], q[5]; // 4 -> 5
rz(-0.7854) q[5]; // tuning phase
cx q[4], q[7]; // 4 -> 7
rz(-0.7854) q[7]; // tuning phase
cx q[6], q[2]; // 6 -> 2
rz(-0.7854) q[2]; // tuning phase
cx q[6], q[5]; // 6 -> 5
rz(-0.7854) q[5]; // tuning phase
cx q[6], q[8]; // 6 -> sink
rz(-0.7854) q[8]; // tuning phase

// Layer 3 - Ending measurements
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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