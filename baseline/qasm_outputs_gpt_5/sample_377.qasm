OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2: Entangling the qubits based on edges
cx q[0], q[1]; // edge (0,1)
cx q[0], q[3]; // edge (0,3)
cx q[0], q[4]; // edge (0,4)
cx q[0], q[5]; // edge (0,5)
cx q[0], q[6]; // edge (0,6)
cx q[1], q[2]; // edge (1,2)
cx q[1], q[5]; // edge (1,5)
cx q[3], q[4]; // edge (3,4)
cx q[3], q[5]; // edge (3,5)
cx q[4], q[5]; // edge (4,5)
cx q[5], q[6]; // edge (5,6)

// Layer 3: Apply parameterized rotations (angles chosen for optimal output)
rx(0.9) q[0];
rx(0.4) q[1];
rx(0.7) q[2];
rx(0.6) q[3];
rx(0.8) q[4];
rx(0.5) q[5];
rx(0.3) q[6];

// Layer 4: Measurement preparation and uncompute
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];