OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initialize all qubits to |+⟩ state
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

// Apply QAOA mixing layer with optimal parameters
// Edge interactions based on capacities
rz(0.214) q[0];
rz(0.143) q[1];
rz(0.179) q[2];
rz(0.321) q[3];
rz(0.286) q[4];
rz(0.250) q[5];
rz(0.357) q[6];
rz(0.321) q[7];
rz(0.179) q[8];
rz(0.107) q[9];

// Apply controlled-phase gates for edge constraints
// Edge (0,3) capacity 3
cx q[0], q[3];
rz(0.642) q[3];
cx q[0], q[3];

// Edge (0,5) capacity 2
cx q[0], q[5];
rz(0.428) q[5];
cx q[0], q[5];

// Edge (0,6) capacity 1
cx q[0], q[6];
rz(0.214) q[6];
cx q[0], q[6];

// Edge (0,7) capacity 3
cx q[0], q[7];
rz(0.642) q[7];
cx q[0], q[7];

// Edge (1,9) capacity 1
cx q[1], q[9];
rz(0.214) q[9];
cx q[1], q[9];

// Edge (2,1) capacity 3
cx q[2], q[1];
rz(0.642) q[1];
cx q[2], q[1];

// Edge (2,7) capacity 2
cx q[2], q[7];
rz(0.428) q[7];
cx q[2], q[7];

// Edge (3,8) capacity 1
cx q[3], q[8];
rz(0.214) q[8];
cx q[3], q[8];

// Edge (4,1) capacity 3
cx q[4], q[1];
rz(0.642) q[1];
cx q[4], q[1];

// Edge (4,2) capacity 2
cx q[4], q[2];
rz(0.428) q[2];
cx q[4], q[2];

// Edge (4,3) capacity 3
cx q[4], q[3];
rz(0.642) q[3];
cx q[4], q[3];

// Edge (4,6) capacity 2
cx q[4], q[6];
rz(0.428) q[6];
cx q[4], q[6];

// Edge (4,7) capacity 2
cx q[4], q[7];
rz(0.428) q[7];
cx q[4], q[7];

// Edge (5,6) capacity 2
cx q[5], q[6];
rz(0.428) q[6];
cx q[5], q[6];

// Edge (5,7) capacity 1
cx q[5], q[7];
rz(0.214) q[7];
cx q[5], q[7];

// Edge (6,4) capacity 1
cx q[6], q[4];
rz(0.214) q[4];
cx q[6], q[4];

// Edge (6,5) capacity 3
cx q[6], q[5];
rz(0.642) q[5];
cx q[6], q[5];

// Edge (6,8) capacity 3
cx q[6], q[8];
rz(0.642) q[8];
cx q[6], q[8];

// Edge (7,3) capacity 2
cx q[7], q[3];
rz(0.428) q[3];
cx q[7], q[3];

// Edge (7,9) capacity 3
cx q[7], q[9];
rz(0.642) q[9];
cx q[7], q[9];

// Edge (8,4) capacity 3
cx q[8], q[4];
rz(0.642) q[4];
cx q[8], q[4];

// Final mixing layer
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