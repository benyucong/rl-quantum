OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Apply controlled rotations based on edge weights
cry(0.4599) q[0], q[1]; // edge (0,1) weight 5
cry(0.6290) q[0], q[3]; // edge (0,3) weight 11
cry(0.8350) q[0], q[2]; // edge (0,2) weight 17
cry(0.7740) q[0], q[5]; // edge (0,5) weight 11
cry(0.8700) q[1], q[2]; // edge (1,2) weight 18
cry(0.3220) q[2], q[3]; // edge (2,3) weight 8
cry(0.5470) q[2], q[4]; // edge (2,4) weight 15
cry(0.1120) q[4], q[5]; // edge (4,5) weight 1

// Layer 3: Measure qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];