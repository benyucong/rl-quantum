OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
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

// Layer 2: Encode flow dynamics
cx q[0], q[1]; // Source to node 1
cx q[0], q[3]; // Source to sink
cx q[1], q[2]; // Node 1 to node 2
cx q[1], q[3]; // Node 1 to sink
cx q[2], q[1]; // Node 2 to Node 1 (flow back)
cx q[2], q[3]; // Node 2 to sink

// Layer 3: Apply angle rotations based on capacities
rz(0.8723) q[1]; // Node 1 dynamics
rz(0.4454) q[3]; // Sink dynamics
rz(0.3422) q[2]; // Node 2 dynamics

// Final measurements
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