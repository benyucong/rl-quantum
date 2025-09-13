OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard gates
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

// Layer 2: Problem-specific phase rotations
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(1.1781) q[3];
rz(0.3927) q[4];
rz(1.1781) q[5];
rz(1.1781) q[6];
rz(0.3927) q[7];
rz(0.3927) q[8];
rz(0.3927) q[9];
rz(0.3927) q[10];

// Layer 3: Mixer Hamiltonian
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.7854) q[3];
rx(0.3491) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.3491) q[7];
rx(0.3491) q[8];
rx(0.3491) q[9];
rx(0.3491) q[10];

// Layer 4: Final optimization
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.5890) q[3];
rz(0.1963) q[4];
rz(0.5890) q[5];
rz(0.5890) q[6];
rz(0.1963) q[7];
rz(0.1963) q[8];
rz(0.1963) q[9];
rz(0.1963) q[10];

// Measurements
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