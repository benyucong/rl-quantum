OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];

// Edge interactions based on bipartite matching weights
// Layer 1: Strongest edges
rz(0.314) q[3];  // Edge to node 14 (weight 20)
rz(0.298) q[7];  // Edge to node 9 (weight 20)
rz(0.280) q[3];  // Edge to node 12 (weight 18)
rz(0.275) q[5];  // Edge to node 10 (weight 17)
rz(0.270) q[0];  // Edge to node 12 (weight 16)

// Layer 2: Medium weight edges
rz(0.210) q[6];  // Edge to node 14 (weight 8)
rz(0.205) q[3];  // Edge to node 11 (weight 7)
rz(0.200) q[2];  // Edge to node 10 (weight 6)
rz(0.200) q[1];  // Edge to node 9 (weight 6)
rz(0.195) q[0];  // Edge to node 8 (weight 5)
rz(0.195) q[4];  // Edge to node 12 (weight 5)
rz(0.190) q[5];  // Edge to node 13 (weight 4)

// Layer 3: Constraint enforcement - prevent multiple matches
// Apply constraints to ensure one-to-one matching
cx q[0], q[8];
rz(-0.150) q[8];
cx q[0], q[8];

cx q[0], q[12];
rz(-0.150) q[12];
cx q[0], q[12];

cx q[1], q[9];
rz(-0.150) q[9];
cx q[1], q[9];

cx q[2], q[10];
rz(-0.150) q[10];
cx q[2], q[10];

cx q[3], q[11];
rz(-0.150) q[11];
cx q[3], q[11];

cx q[3], q[12];
rz(-0.150) q[12];
cx q[3], q[12];

cx q[3], q[14];
rz(-0.150) q[14];
cx q[3], q[14];

cx q[4], q[12];
rz(-0.150) q[12];
cx q[4], q[12];

cx q[5], q[10];
rz(-0.150) q[10];
cx q[5], q[10];

cx q[5], q[13];
rz(-0.150) q[13];
cx q[5], q[13];

cx q[6], q[14];
rz(-0.150) q[14];
cx q[6], q[14];

cx q[7], q[9];
rz(-0.150) q[9];
cx q[7], q[9];

// Layer 4: Final optimization and measurement preparation
h q[0];
rz(0.250) q[0];
h q[0];

h q[1];
rz(0.240) q[1];
h q[1];

h q[2];
rz(0.230) q[2];
h q[2];

h q[3];
rz(0.280) q[3];
h q[3];

h q[4];
rz(0.220) q[4];
h q[4];

h q[5];
rz(0.260) q[5];
h q[5];

h q[6];
rz(0.210) q[6];
h q[6];

h q[7];
rz(0.270) q[7];
h q[7];

h q[8];
rz(0.180) q[8];
h q[8];

h q[9];
rz(0.190) q[9];
h q[9];

h q[10];
rz(0.200) q[10];
h q[10];

h q[11];
rz(0.170) q[11];
h q[11];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];