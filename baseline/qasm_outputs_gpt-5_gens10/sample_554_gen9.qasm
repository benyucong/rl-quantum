OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initialize qubits with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled rotations based on maximum bipartite matching edges
cx q[0], q[6];
rz(0.2365) q[6];
cx q[0], q[6];
cx q[0], q[7];
rz(0.1985) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.1456) q[7];
cx q[1], q[7];
cx q[1], q[11];
rz(0.3333) q[11];
cx q[1], q[11];

// Layer 3: Additional entangling layer
cx q[2], q[8];
rz(0.3184) q[8];
cx q[2], q[8];
cx q[2], q[9];
rz(0.2793) q[9];
cx q[2], q[9];
cx q[3], q[9];
rz(0.1512) q[9];
cx q[3], q[9];
cx q[3], q[10];
rz(0.0498) q[10];
cx q[3], q[10];

// Layer 4: Final rotations 
cx q[4], q[10];
rz(0.1772) q[10];
cx q[4], q[10];
cx q[4], q[7];
rz(0.2221) q[7];
cx q[4], q[7];
cx q[5], q[8];
rz(0.3937) q[8];
cx q[5], q[8];
cx q[5], q[11];
rz(0.0601) q[11];
cx q[5], q[11];

// Measure all qubits
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