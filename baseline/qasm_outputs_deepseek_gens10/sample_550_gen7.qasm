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
rz(0.784) q[0];  // Weight 4
rz(2.744) q[1];  // Weight 7
rz(1.176) q[2];  // Weight 6
rz(2.744) q[3];  // Weight 14 (from 0-3)
rz(2.744) q[4];  // Weight 14 (from 0-4)
rz(3.724) q[5];  // Weight 19 (from 0-5)
rz(3.136) q[6];  // Weight 16 (from 0-6)
rz(2.548) q[7];  // Weight 13 (from 1-7)

// Layer 1: Mixer operations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Second set of phase rotations
rz(0.392) q[0];
rz(1.372) q[1];
rz(0.588) q[2];
rz(1.372) q[3];
rz(1.372) q[4];
rz(1.862) q[5];
rz(1.568) q[6];
rz(1.274) q[7];

// Layer 2: Final mixer operations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
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