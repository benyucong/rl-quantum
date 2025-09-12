OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer: apply controlled unitary operations based on matching weights
cx q[0], q[3]; // Edge (0,3)
rz(0.1785) q[3];
cx q[0], q[3];

cx q[0], q[4]; // Edge (0,4)
rz(0.4495) q[4];
cx q[0], q[4];

cx q[0], q[5]; // Edge (0,5)
rz(0.2150) q[5];
cx q[0], q[5];

cx q[0], q[6]; // Edge (0,6)
rz(0.2918) q[6];
cx q[0], q[6];

cx q[0], q[7]; // Edge (0,7)
rz(0.3562) q[7];
cx q[0], q[7];

cx q[1], q[4]; // Edge (1,4)
rz(0.2457) q[4];
cx q[1], q[4];

cx q[1], q[7]; // Edge (1,7)
rz(0.3771) q[7];
cx q[1], q[7];

cx q[2], q[5]; // Edge (2,5)
rz(0.1678) q[5];
cx q[2], q[5];

// Second layer: applying another set of controlled operations
cx q[0], q[3];
rz(0.1785) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(0.4495) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.2150) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.2918) q[6];
cx q[0], q[6];

cx q[0], q[7];
rz(0.3562) q[7];
cx q[0], q[7];

cx q[1], q[4];
rz(0.2457) q[4];
cx q[1], q[4];

cx q[1], q[7];
rz(0.3771) q[7];
cx q[1], q[7];

cx q[2], q[5];
rz(0.1678) q[5];
cx q[2], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];