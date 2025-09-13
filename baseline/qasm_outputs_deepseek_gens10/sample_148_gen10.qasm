OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

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

// Capacity constraints and flow conservation
rz(0.7854) q[0];  // Edge 0->2 capacity 1
rz(0.1963) q[1];  // Edge 1->2 capacity 4
rz(0.1309) q[2];  // Edge 2->4 capacity 6
rz(0.3927) q[3];  // Edge 3->2 capacity 2

// Flow conservation at nodes
rz(0.5236) q[4];  // Node 0 conservation
rz(0.5236) q[5];  // Node 1 conservation
rz(0.5236) q[6];  // Node 2 conservation
rz(0.5236) q[7];  // Node 3 conservation
rz(0.5236) q[8];  // Node 4 conservation

// Layer 2: Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Second parameter layer
rz(0.6283) q[0];
rz(0.1571) q[1];
rz(0.1047) q[2];
rz(0.3142) q[3];
rz(0.4189) q[4];
rz(0.4189) q[5];
rz(0.4189) q[6];
rz(0.4189) q[7];
rz(0.4189) q[8];

// Layer 3: Further optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Third parameter layer
rz(0.4712) q[0];
rz(0.1178) q[1];
rz(0.0785) q[2];
rz(0.2356) q[3];
rz(0.3142) q[4];
rz(0.3142) q[5];
rz(0.3142) q[6];
rz(0.3142) q[7];
rz(0.3142) q[8];

// Layer 4: Final optimization and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Final parameter layer
rz(0.3927) q[0];
rz(0.0982) q[1];
rz(0.0654) q[2];
rz(0.1963) q[3];
rz(0.2618) q[4];
rz(0.2618) q[5];
rz(0.2618) q[6];
rz(0.2618) q[7];
rz(0.2618) q[8];

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