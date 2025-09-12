OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];

// First layer of gates
cz q[0], q[4];
cz q[1], q[5];
cz q[1], q[6];
cz q[2], q[6];
cz q[3], q[7];
cz q[3], q[9];

// Second layer of gates
rx(1.2534) q[0];
rz(0.2682) q[0];
rx(0.4761) q[1];
rz(0.4523) q[1];
ry(0.5542) q[2];
rz(0.3652) q[2];
rx(1.5697) q[3];
rz(0.2014) q[3];

// Third layer of gates
cz q[0], q[8];
cz q[1], q[9];
cz q[2], q[10];
cz q[3], q[11];

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