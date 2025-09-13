OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initialization and first mixing
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

// Capacity constraints for edges
rz(0.7854) q[0];  // Edge 0->5 capacity 2
rz(0.5236) q[1];  // Edge 2->3 capacity 2
rz(1.0472) q[2];  // Edge 3->1 capacity 3
rz(0.2618) q[3];  // Edge 3->2 capacity 1
rz(1.0472) q[4];  // Edge 3->5 capacity 3
rz(0.5236) q[5];  // Edge 4->2 capacity 2

// Flow conservation constraints
cx q[0], q[6];    // Source 0 constraint
cx q[2], q[7];    // Sink 5 constraint
cx q[1], q[8];    // Node 1 conservation
cx q[3], q[9];    // Node 2 conservation
cx q[4], q[10];   // Node 3 conservation

// Layer 2: Intermediate optimization
rz(0.3927) q[0];
rz(0.3491) q[1];
rz(0.6981) q[2];
rz(0.1745) q[3];
rz(0.6981) q[4];
rz(0.3491) q[5];

// Flow conservation reinforcement
cx q[6], q[7];
cx q[8], q[9];
cx q[9], q[10];
rz(0.5236) q[6];
rz(0.5236) q[7];
rz(0.3491) q[8];
rz(0.3491) q[9];
rz(0.3491) q[10];

// Layer 3: Final optimization and measurement
rz(0.1963) q[0];
rz(0.1745) q[1];
rz(0.3491) q[2];
rz(0.0873) q[3];
rz(0.3491) q[4];
rz(0.1745) q[5];

// Final flow conservation checks
cx q[7], q[6];
cx q[10], q[9];
cx q[9], q[8];
rz(0.2618) q[6];
rz(0.2618) q[7];
rz(0.1745) q[8];
rz(0.1745) q[9];
rz(0.1745) q[10];

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