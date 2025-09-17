OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
// Initialize all qubits to |+> state for QAOA
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Apply problem Hamiltonian with optimal parameters
// Edge (0,3) with weight 8
cx q[0], q[3];
rz(0.16) q[3];
cx q[0], q[3];
// Edge (0,5) with weight 15
cx q[0], q[5];
rz(0.3) q[5];
cx q[0], q[5];
// Edge (0,4) with weight 17
cx q[0], q[4];
rz(0.34) q[4];
cx q[0], q[4];
// Edge (1,4) with weight 5
cx q[1], q[4];
rz(0.1) q[4];
cx q[1], q[4];
// Edge (1,6) with weight 11
cx q[1], q[6];
rz(0.22) q[6];
cx q[1], q[6];
// Edge (2,5) with weight 6
cx q[2], q[5];
rz(0.12) q[5];
cx q[2], q[5];
// Edge (2,3) with weight 17
cx q[2], q[3];
rz(0.34) q[3];
cx q[2], q[3];
// Edge (2,4) with weight 15
cx q[2], q[4];
rz(0.3) q[4];
cx q[2], q[4];
// Apply mixing Hamiltonian
h q[0];
rz(0.32) q[0];
h q[0];
h q[1];
rz(0.32) q[1];
h q[1];
h q[2];
rz(0.32) q[2];
h q[2];
h q[3];
rz(0.32) q[3];
h q[3];
h q[4];
rz(0.32) q[4];
h q[4];
h q[5];
rz(0.32) q[5];
h q[5];
h q[6];
rz(0.32) q[6];
h q[6];
h q[7];
rz(0.32) q[7];
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