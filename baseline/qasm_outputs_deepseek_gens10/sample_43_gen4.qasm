OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard on all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Problem-specific mixing with optimal parameters
// Edge (0,1) with weight 3
cx q[0], q[1];
rz(0.0942) q[1];
cx q[0], q[1];

// Edge (0,5) with weight 14
cx q[0], q[5];
rz(0.4398) q[5];
cx q[0], q[5];

// Edge (1,4) with weight 15
cx q[1], q[4];
rz(0.4712) q[4];
cx q[1], q[4];

// Edge (1,3) with weight 11
cx q[1], q[3];
rz(0.3456) q[3];
cx q[1], q[3];

// Edge (2,3) with weight 10
cx q[2], q[3];
rz(0.3142) q[3];
cx q[2], q[3];

// Edge (4,5) with weight 6
cx q[4], q[5];
rz(0.1885) q[5];
cx q[4], q[5];

// Edge (4,6) with weight 20
cx q[4], q[6];
rz(0.6283) q[6];
cx q[4], q[6];

// Edge (5,6) with weight 16
cx q[5], q[6];
rz(0.5027) q[6];
cx q[5], q[6];

// Layer 3: Additional mixing for near-perfect matching
rz(0.1571) q[0];
rz(0.1571) q[1];
rz(0.1571) q[2];
rz(0.1571) q[3];
rz(0.1571) q[4];
rz(0.1571) q[5];
rz(0.1571) q[6];
rz(0.1571) q[7];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 4: Final optimization layer
rz(0.0785) q[0];
rz(0.0785) q[1];
rz(0.0785) q[2];
rz(0.0785) q[3];
rz(0.0785) q[4];
rz(0.0785) q[5];
rz(0.0785) q[6];
rz(0.0785) q[7];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];