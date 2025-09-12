OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2 (Creating entanglement between left and right nodes)
cz q[0], q[6];
cz q[0], q[7];
cz q[1], q[7];
cz q[2], q[8];
cz q[2], q[7];
cz q[3], q[6];
cz q[3], q[7];
cz q[5], q[7];

// Layer 3 (Applying rotation gates)
rx(1.2) q[0];
ry(0.5) q[1];
rz(0.3) q[2];
rx(1.1) q[3];
ry(0.4) q[4];
rz(1.7) q[5];
rx(0.6) q[6];
ry(0.9) q[7];

// Layer 4 (Measurement preparation)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measuring qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];