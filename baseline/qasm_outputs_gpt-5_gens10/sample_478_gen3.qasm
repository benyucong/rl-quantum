OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Prepare superposition
rz(0.2791) q[0];
rz(0.7912) q[1];
rz(0.4527) q[2];
rz(0.1240) q[3];
rz(0.3421) q[4];
rz(0.4695) q[5];

// Layer 2: Create entanglement
cx q[0], q[1];
cx q[0], q[5];
cx q[1], q[5];
cx q[2], q[4];
cx q[3], q[4];

// Layer 3: Apply final rotations
rz(-0.0523) q[0];
rz(-0.0841) q[1];
rz(-0.0572) q[2];
rz(-0.0437) q[3];
rz(-0.0345) q[4];
rz(-0.0321) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];