OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard gates to create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Controlled rotations for encoding the edges based on weights
crz(0.1) q[0], q[1];  // weight 3
crz(1.5) q[0], q[2];  // weight 15
crz(1.8) q[0], q[3];  // weight 18
crz(1.1) q[0], q[5];  // weight 11
crz(1.4) q[1], q[2];  // weight 14
crz(1.2) q[1], q[3];  // weight 12
crz(0.9) q[2], q[3];  // weight 9
crz(0.3) q[4], q[5];  // weight 3

// Additional Hadamard gates to prepare for measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];