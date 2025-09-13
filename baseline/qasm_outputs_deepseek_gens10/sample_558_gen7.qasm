OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Mixer and cost unitary
// Mixer terms
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];

// Cost terms - edges from source (0) and to sink (6)
rz(-0.3927) q[2];  // edge 0-2
rz(-0.7854) q[3];  // edge 0-3
rz(-1.5708) q[4];  // edge 0-4
rz(-0.7854) q[5];  // edge 0-5
rz(-0.1963) q[6];  // edge 2-6
rz(-0.5890) q[6];  // edge 3-6

// Layer 2 - Mixer and cost unitary
// Mixer terms
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];

// Cost terms - additional edges
rz(-0.3927) q[1];  // edge 1-2
rz(-0.7854) q[3];  // edge 1-3
rz(-0.5890) q[4];  // edge 2-4
rz(-0.7854) q[5];  // edge 2-5
rz(-0.3927) q[4];  // edge 3-4
rz(-0.1963) q[5];  // edge 3-5

// Layer 3 - Mixer and cost unitary
// Mixer terms
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];

// Cost terms - remaining edges
rz(-0.5890) q[1];  // edge 2-1
rz(-0.3927) q[3];  // edge 2-3
rz(-0.5890) q[1];  // edge 3-1
rz(-0.3927) q[2];  // edge 4-1
rz(-0.1963) q[2];  // edge 4-2
rz(-0.5890) q[3];  // edge 4-3
rz(-0.5890) q[5];  // edge 4-5
rz(-0.5890) q[2];  // edge 5-2
rz(-0.1963) q[3];  // edge 5-3
rz(-0.7854) q[4];  // edge 5-4

// Layer 4 - Final mixer layer
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];