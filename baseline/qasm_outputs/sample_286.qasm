OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply phase separation with optimal parameters
// Layer 1 - encode edge weights
rz(0.314) q[0];
rz(0.589) q[1];
rz(0.589) q[2];
rz(0.314) q[3];
rz(0.589) q[4];
rz(0.314) q[5];
rz(0.589) q[6];
rz(0.314) q[7];

// Apply mixing layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];