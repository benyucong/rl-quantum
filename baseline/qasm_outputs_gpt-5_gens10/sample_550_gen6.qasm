OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer: Applying controlled rotations based on edges with weights
rz(4 * 0.1) q[0]; // Edge (0, 3)
cz q[0], q[3];
rz(-4 * 0.1) q[0];

rz(14 * 0.1) q[0]; // Edge (0, 5)
cz q[0], q[5];
rz(-14 * 0.1) q[0];

rz(19 * 0.1) q[0]; // Edge (0, 6)
cz q[0], q[6];
rz(-19 * 0.1) q[0];

rz(14 * 0.1) q[0]; // Edge (0, 4)
cz q[0], q[4];
rz(-14 * 0.1) q[0];

rz(16 * 0.1) q[0]; // Edge (0, 7)
cz q[0], q[7];
rz(-16 * 0.1) q[0];

rz(7 * 0.1) q[1]; // Edge (1, 4)
cz q[1], q[4];
rz(-7 * 0.1) q[1];

rz(13 * 0.1) q[1]; // Edge (1, 7)
cz q[1], q[7];
rz(-13 * 0.1) q[1];

rz(6 * 0.1) q[2]; // Edge (2, 5)
cz q[2], q[5];
rz(-6 * 0.1) q[2];

// Second layer: Applying entangling gates
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[4];
cx q[1], q[7];
cx q[2], q[5];

cx q[0], q[5];
cx q[0], q[6];
cx q[0], q[7];
cx q[1], q[6];
cx q[2], q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];