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
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(1.5708) q[2];
rz(0.7854) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(0.3927) q[6];

// Layer 1: Mixer unitary
rx(1.2566) q[0];
rx(1.2566) q[1];
rx(0.6283) q[2];
rx(1.2566) q[3];
rx(0.6283) q[4];
rx(0.6283) q[5];
rx(1.8849) q[6];

// Layer 2: Problem unitary
rz(0.6283) q[0];
rz(0.6283) q[1];
rz(1.2566) q[2];
rz(0.6283) q[3];
rz(1.2566) q[4];
rz(1.2566) q[5];
rz(0.3142) q[6];

// Layer 2: Mixer unitary
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(0.5236) q[2];
rx(1.0472) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(1.5708) q[6];

// Layer 3: Problem unitary
rz(0.4712) q[0];
rz(0.4712) q[1];
rz(0.9425) q[2];
rz(0.4712) q[3];
rz(0.9425) q[4];
rz(0.9425) q[5];
rz(0.2356) q[6];

// Layer 3: Mixer unitary
rx(0.8378) q[0];
rx(0.8378) q[1];
rx(0.4189) q[2];
rx(0.8378) q[3];
rx(0.4189) q[4];
rx(0.4189) q[5];
rx(1.2566) q[6];

// Layer 4: Problem unitary
rz(0.3142) q[0];
rz(0.3142) q[1];
rz(0.6283) q[2];
rz(0.3142) q[3];
rz(0.6283) q[4];
rz(0.6283) q[5];
rz(0.1571) q[6];

// Layer 4: Mixer unitary
rx(0.6283) q[0];
rx(0.6283) q[1];
rx(0.3142) q[2];
rx(0.6283) q[3];
rx(0.3142) q[4];
rx(0.3142) q[5];
rx(0.9425) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];