OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Initialize qubits
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

// Create entanglements based on maximum bipartite matching graph edges
cx q[0], q[7]; // Weight 5
cx q[1], q[8]; // Weight 2
cx q[2], q[9]; // Weight 4
cx q[2], q[12]; // Weight 11
cx q[3], q[10]; // Weight 10
cx q[3], q[11]; // Weight 20
cx q[4], q[11]; // Weight 7
cx q[4], q[10]; // Weight 17
cx q[5], q[12]; // Weight 5
cx q[6], q[8]; // Weight 14
cx q[6], q[9]; // Weight 17

// Apply optimal rotation gates
rz(1.2314) q[0];
rz(0.6722) q[1];
rz(2.7643) q[2];
rz(0.8465) q[3];
rz(1.1244) q[4];
rz(0.8743) q[5];
rz(0.4921) q[6];
rz(1.0612) q[7];
rz(0.3315) q[8];
rz(1.8321) q[9];
rz(0.2554) q[10];

// Final entanglement layer
cx q[0], q[7];
cx q[1], q[8];
cx q[2], q[9];
cx q[2], q[12];
cx q[3], q[10];
cx q[3], q[11];
cx q[4], q[11];
cx q[4], q[10];
cx q[5], q[12];
cx q[6], q[8];
cx q[6], q[9];

// Measure the output
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