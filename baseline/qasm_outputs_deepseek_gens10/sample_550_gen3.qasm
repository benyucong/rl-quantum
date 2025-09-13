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

// Layer 1: Problem-specific phase rotations based on edge weights
// Qubits 0-2: left nodes, 3-7: right nodes
rz(0.7854) q[0];  // Based on average weight from node 0
rz(0.3927) q[1];  // Based on average weight from node 1
rz(0.1963) q[2];  // Based on weight from node 2
rz(0.3927) q[3];  // Based on connections to node 3
rz(0.3927) q[4];  // Based on connections to node 4
rz(0.3927) q[5];  // Based on connections to node 5
rz(0.3927) q[6];  // Based on connections to node 6
rz(0.3927) q[7];  // Based on connections to node 7

// Layer 1: Entangling gates for bipartite matching constraints
// Constraint: Each left node can match at most one right node
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];
cx q[0], q[6];
cx q[0], q[7];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[1], q[6];
cx q[1], q[7];
cx q[2], q[3];
cx q[2], q[4];
cx q[2], q[5];
cx q[2], q[6];
cx q[2], q[7];

// Layer 2: Additional optimization rotations
rz(0.5236) q[0];
rz(0.2618) q[1];
rz(0.1309) q[2];
rz(0.2618) q[3];
rz(0.2618) q[4];
rz(0.2618) q[5];
rz(0.2618) q[6];
rz(0.2618) q[7];

// Layer 2: Final Hadamard for measurement
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