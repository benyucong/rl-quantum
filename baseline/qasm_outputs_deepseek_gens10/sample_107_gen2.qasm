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
// Edge (0,1) with weight 10
rz(0.6283) q[0];
rz(0.6283) q[1];

// Edge (0,6) with weight 13
rz(0.8168) q[0];
rz(0.8168) q[6];

// Edge (0,5) with weight 15
rz(0.9425) q[0];
rz(0.9425) q[5];

// Edge (1,2) with weight 15
rz(0.9425) q[1];
rz(0.9425) q[2];

// Edge (2,3) with weight 5
rz(0.3142) q[2];
rz(0.3142) q[3];

// Edge (2,7) with weight 18
rz(1.1309) q[2];
rz(1.1309) q[7];

// Edge (4,5) with weight 3
rz(0.1885) q[4];
rz(0.1885) q[5];

// Edge (4,7) with weight 11
rz(0.6912) q[4];
rz(0.6912) q[7];

// Edge (6,7) with weight 4
rz(0.2513) q[6];
rz(0.2513) q[7];

// Layer 3: Mixing Hamiltonian
rx(1.2566) q[0];
rx(1.2566) q[1];
rx(1.2566) q[2];
rx(1.2566) q[3];
rx(1.2566) q[4];
rx(1.2566) q[5];
rx(1.2566) q[6];
rx(1.2566) q[7];
rx(1.2566) q[8];

// Layer 4: Final optimization and measurement preparation
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];

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