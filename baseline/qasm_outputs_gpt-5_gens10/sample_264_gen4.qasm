OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1 - Prepare superposition and entangle
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
cx q[0], q[2];
cx q[0], q[5];
cx q[0], q[6];
cx q[0], q[7];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[1], q[6];

// Layer 2 - Apply controlled rotation based on graph weights (capacities)
rz(0.0206) q[0]; // For edge (0, 2)
rz(0.0215) q[0]; // For edge (0, 5)
rz(0.0233) q[0]; // For edge (0, 6)
rz(0.0194) q[0]; // For edge (0, 7)
rz(0.0157) q[1]; // For edge (1, 2)
rz(0.0142) q[1]; // For edge (1, 3)
rz(0.0259) q[1]; // For edge (1, 4)
rz(0.0221) q[1]; // For edge (1, 5)
rz(0.0243) q[1]; // For edge (1, 6)

// Layer 3 - Measure outcomes
h q[0];
rz(0.0764) q[0];
h q[0];
h q[1];
rz(0.0764) q[1];
h q[1];
h q[2];
rz(0.0764) q[2];
h q[2];
h q[3];
rz(0.0764) q[3];
h q[3];
h q[4];
rz(0.0764) q[4];
h q[4];
h q[5];
rz(0.0764) q[5];
h q[5];
h q[6];
rz(0.0764) q[6];
h q[6];
h q[7];
rz(0.0764) q[7];
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