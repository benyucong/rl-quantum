OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initialize qubits to superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First layer of parameterized gates
rx(1.2345) q[0];
rz(0.1234) q[0];
rx(2.1456) q[1];
rz(0.2345) q[1];
rx(1.5678) q[2];
rz(0.3456) q[2];
rx(1.4567) q[3];
rz(0.4567) q[3];
rx(0.9876) q[4];
rz(0.5678) q[4];
rx(1.3456) q[5];
rz(0.6789) q[5];
rx(2.2345) q[6];
rz(0.7890) q[6];

// Second layer of controlled operations
cx q[0], q[1];
rz(-0.1234) q[1];
cx q[0], q[1];
cx q[2], q[4];
rz(-0.2345) q[4];
cx q[2], q[4];
cx q[4], q[5];
rz(-0.3456) q[5];
cx q[4], q[5];
cx q[3], q[5];
rz(-0.4567) q[5];
cx q[3], q[5];

// Third layer of more parameterized gates
rx(1.1212) q[0];
rz(0.1111) q[0];
rx(1.2121) q[1];
rz(0.2222) q[1];
rx(1.3232) q[2];
rz(0.3333) q[2];
rx(1.4343) q[3];
rz(0.4444) q[3];
rx(1.5454) q[4];
rz(0.5555) q[4];
rx(1.6565) q[5];
rz(0.6666) q[5];
rx(1.7676) q[6];
rz(0.7777) q[6];

// Measure qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];