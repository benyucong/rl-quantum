OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
rz(0.314) q[0];
rz(0.471) q[1];
rz(0.628) q[2];
rz(0.392) q[3];
rz(0.549) q[4];
rz(0.706) q[5];
rz(0.235) q[6];

// Layer 1: Mixer unitary
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];

// Layer 2: Problem unitary
rz(0.471) q[0];
rz(0.628) q[1];
rz(0.785) q[2];
rz(0.549) q[3];
rz(0.706) q[4];
rz(0.863) q[5];
rz(0.392) q[6];

// Layer 2: Mixer unitary
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];

// Layer 3: Problem unitary
rz(0.628) q[0];
rz(0.785) q[1];
rz(0.942) q[2];
rz(0.706) q[3];
rz(0.863) q[4];
rz(1.020) q[5];
rz(0.549) q[6];

// Layer 3: Mixer unitary
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];

// Layer 4: Final problem unitary
rz(0.785) q[0];
rz(0.942) q[1];
rz(1.099) q[2];
rz(0.863) q[3];
rz(1.020) q[4];
rz(1.177) q[5];
rz(0.706) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];