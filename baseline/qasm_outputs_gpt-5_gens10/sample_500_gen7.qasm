OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
// Initialize qubits with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: apply CNOTs based on edge connections
cx q[0], q[1]; // connect source to node 1
cx q[0], q[4]; // connect source to node 4
cx q[0], q[6]; // connect source to node 6
cx q[1], q[2]; // connect node 1 to node 2
cx q[1], q[7]; // connect node 1 to sink
cx q[2], q[3]; // connect node 2 to node 3
cx q[2], q[6]; // connect node 2 to node 6
cx q[4], q[3]; // connect node 4 to node 3
cx q[4], q[5]; // connect node 4 to node 5
cx q[5], q[1]; // connect node 5 to node 1
cx q[5], q[3]; // connect node 5 to node 3
cx q[5], q[6]; // connect node 5 to node 6
cx q[6], q[3]; // connect node 6 to node 3

// Layer 2: apply rotations
rz(0.1) q[0];
rz(0.2) q[1];
rz(0.3) q[2];
rz(0.4) q[3];
rz(0.5) q[4];
rz(0.6) q[5];
rz(0.7) q[6];
rz(0.8) q[7];

// Layer 3: apply additional CNOTs 
cx q[0], q[2]; // reinforce path from source to sink
cx q[1], q[3]; // reinforce connections to node 3
cx q[4], q[6]; // reinforce connection to node 6

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];