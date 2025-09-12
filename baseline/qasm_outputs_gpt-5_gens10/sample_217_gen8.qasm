OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply controlled rotations based on the edges and the capacities
cx q[0], q[4]; // from node 0 to 4
rz(1.0472) q[4]; // phase for capacity 3
cx q[1], q[5]; // from node 1 to 5
rz(0.7854) q[5]; // phase for capacity 2
cx q[2], q[6]; // from node 2 to 6
rz(1.0472) q[6]; // phase for capacity 3
cx q[3], q[4]; // from node 3 to 4
rz(0.5236) q[4]; // phase for capacity 1
cx q[3], q[6]; // from node 3 to 6
rz(0.7854) q[6]; // phase for capacity 2
cx q[3], q[7]; // from node 3 to 7
rz(1.0472) q[7]; // phase for capacity 3

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
  
// Measure the final states
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];