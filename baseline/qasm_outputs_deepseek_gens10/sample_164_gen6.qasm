OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Initial Hadamard on all qubits
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
h q[12];
h q[13];
h q[14];
h q[15];

// Graph isomorphism oracle for the given graphs
// Graph 1 edges: (3,2), (3,0), (2,1), (0,1)
// Graph 2 edges: (0,1), (0,2), (1,3), (2,3)

// Implement controlled-phase gates for graph edges with optimal parameters
// Edge (3,2) in first graph
cx q[3], q[2];
rz(0.7854) q[2];
cx q[3], q[2];

// Edge (3,0) in first graph
cx q[3], q[0];
rz(0.7854) q[0];
cx q[3], q[0];

// Edge (2,1) in first graph
cx q[2], q[1];
rz(0.7854) q[1];
cx q[2], q[1];

// Edge (0,1) in first graph
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (0,1) in second graph
cx q[4], q[5];
rz(-0.7854) q[5];
cx q[4], q[5];

// Edge (0,2) in second graph
cx q[4], q[6];
rz(-0.7854) q[6];
cx q[4], q[6];

// Edge (1,3) in second graph
cx q[5], q[7];
rz(-0.7854) q[7];
cx q[5], q[7];

// Edge (2,3) in second graph
cx q[6], q[7];
rz(-0.7854) q[7];
cx q[6], q[7];

// Final Hadamard on all qubits
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
h q[12];
h q[13];
h q[14];
h q[15];

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
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];
c[15] = measure q[15];