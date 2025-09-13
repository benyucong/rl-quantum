OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard on all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2: Problem-specific phase rotations
rz(0.7854) q[0];  // Edge (0,1) weight 10
rz(0.9425) q[1];  // Edge (1,2) weight 12
rz(1.4137) q[2];  // Edge (1,7) weight 18
rz(0.5498) q[3];  // Edge (2,3) weight 7
rz(1.4137) q[4];  // Edge (2,5) weight 18
rz(0.9425) q[5];  // Edge (3,5) weight 12
rz(1.1781) q[6];  // Edge (3,4) weight 15
rz(0.3142) q[7];  // Edge (4,5) weight 4
rz(0.7854) q[8];  // Edge (6,7) weight 10

// Layer 3: Mixer operations
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];

// Layer 4: Final phase rotations and Hadamard
rz(0.3927) q[0];
rz(0.4712) q[1];
rz(0.7069) q[2];
rz(0.2749) q[3];
rz(0.7069) q[4];
rz(0.4712) q[5];
rz(0.5890) q[6];
rz(0.1571) q[7];
rz(0.3927) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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