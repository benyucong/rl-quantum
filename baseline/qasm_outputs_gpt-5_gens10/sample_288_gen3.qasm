OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Create entanglement for connected components
cx q[0], q[1]; // edge (0, 1)
cx q[2], q[3]; // edge (2, 3)
cx q[3], q[4]; // edge (3, 4)

// Layer 3: Apply rotation gates to adjust the state
rz(0.3424) q[0];
rz(0.2974) q[1];
rz(0.2187) q[2];
rz(0.1256) q[3];

// Layer 4: Finalize entanglement for measurement
cx q[1], q[2]; // additional edge connection
cx q[0], q[3]; // cross connection for more entanglement

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];