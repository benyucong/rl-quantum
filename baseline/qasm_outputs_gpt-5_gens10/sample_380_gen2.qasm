OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2: Entangling operations for min-cut
cx q[0], q[2]; // edge 0 -> 2
cx q[0], q[6]; // edge 0 -> 6
cx q[1], q[3]; // edge 1 -> 3
cx q[2], q[4]; // edge 2 -> 4
cx q[3], q[1]; // edge 3 -> 1
cx q[3], q[2]; // edge 3 -> 2
cx q[3], q[4]; // edge 3 -> 4
cx q[5], q[1]; // edge 5 -> 1

// Layer 3: Measurement preparation and rotations
rz(0.1567) q[0];
rz(0.1985) q[1];
rz(0.1234) q[2];
rz(0.0593) q[3];
rz(0.3289) q[4];
rz(0.2456) q[5];
rz(0.3778) q[6];

// Final Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];