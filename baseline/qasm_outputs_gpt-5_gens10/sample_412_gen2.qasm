OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4]; 
h q[5];

// Layer 1: Entangling edges
cx q[0], q[4];  // source (0) to sink (4)
rz(0.5) q[4];
cx q[2], q[4];  // node (2) to sink (4)
rz(0.5) q[4]; 
cx q[1], q[3];  // node (1) to node (3)
rz(0.5) q[3];

// Layer 2: Control on edges
cx q[3], q[1];  // node (3) to node (1) control
rz(-0.5) q[1];
cx q[3], q[2];  // node (3) to node (2) control
rz(-0.5) q[2];
cx q[4], q[5];  // node (4) to sink (5)
rz(-0.5) q[5];

// Layer 3: Final entanglement
cx q[0], q[5];  // source to sink
rz(1.0) q[5];
cx q[1], q[4];  // node (1) to node (4)
rz(1.0) q[4];
cx q[2], q[4];  // node (2) to node (4)
rz(1.0) q[4];

// Layer 4: Measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measure outputs
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];