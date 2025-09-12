OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

h q[0];
h q[1];
h q[2];
h q[3];

cx q[0], q[2]; // Entangle source to middle node
cx q[1], q[3]; // Entangle sink to target node
rz(0.5) q[2];  // Apply rotation to middle node to optimize state
rz(0.5) q[3];  // Apply rotation to sink node to optimize state

cx q[2], q[1]; // Create connectivity that reflects edges and their capacities
cx q[3], q[0]; // Capture the connections via controlled operations

h q[0];        // Reverse h on source
h q[1];        // Reverse h on sink
h q[2];        // Reverse h on middle
h q[3];        // Reverse h on target

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];