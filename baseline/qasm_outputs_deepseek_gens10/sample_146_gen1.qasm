OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
// Layer 1: Initial Hadamard on all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Layer 1: Problem-specific phase rotations based on edge weights
rz(0.3927) q[0];  // Weight 2
rz(3.9270) q[0];  // Weight 20
rz(1.9635) q[1];  // Weight 5
rz(3.9270) q[1];  // Weight 20
rz(2.3562) q[1];  // Weight 12
rz(0.3927) q[2];  // Weight 2
rz(2.1598) q[2];  // Weight 11
rz(2.5536) q[2];  // Weight 13
// Layer 1: Mixer operations
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
// Layer 2: Second set of phase rotations
rz(0.3927) q[0];  // Weight 2
rz(3.9270) q[0];  // Weight 20
rz(1.9635) q[1];  // Weight 5
rz(3.9270) q[1];  // Weight 20
rz(2.3562) q[1];  // Weight 12
rz(0.3927) q[2];  // Weight 2
rz(2.1598) q[2];  // Weight 11
rz(2.5536) q[2];  // Weight 13
// Layer 2: Final mixer operations
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];