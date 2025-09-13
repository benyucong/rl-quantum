OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1: Problem-specific entangling gates
cx q[0], q[6];
rz(0.142) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(0.138) q[6];
cx q[1], q[6];
cx q[1], q[7];
rz(0.136) q[7];
cx q[1], q[7];
cx q[1], q[8];
rz(0.135) q[8];
cx q[1], q[8];
cx q[2], q[7];
rz(0.141) q[7];
cx q[2], q[7];
cx q[3], q[5];
rz(0.139) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(0.137) q[5];
cx q[4], q[5];
cx q[4], q[7];
rz(0.134) q[7];
cx q[4], q[7];
cx q[4], q[8];
rz(0.132) q[8];
cx q[4], q[8];
cx q[5], q[6];
rz(0.140) q[6];
cx q[5], q[6];
cx q[6], q[8];
rz(0.133) q[8];
cx q[6], q[8];

// Layer 1: Mixer operations
rx(0.285) q[0];
rx(0.282) q[1];
rx(0.284) q[2];
rx(0.281) q[3];
rx(0.283) q[4];
rx(0.280) q[5];
rx(0.279) q[6];
rx(0.278) q[7];
rx(0.277) q[8];

// Layer 2: Problem-specific entangling gates
cx q[0], q[6];
rz(0.128) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(0.126) q[6];
cx q[1], q[6];
cx q[1], q[7];
rz(0.124) q[7];
cx q[1], q[7];
cx q[1], q[8];
rz(0.122) q[8];
cx q[1], q[8];
cx q[2], q[7];
rz(0.120) q[7];
cx q[2], q[7];
cx q[3], q[5];
rz(0.118) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(0.116) q[5];
cx q[4], q[5];
cx q[4], q[7];
rz(0.114) q[7];
cx q[4], q[7];
cx q[4], q[8];
rz(0.112) q[8];
cx q[4], q[8];
cx q[5], q[6];
rz(0.110) q[6];
cx q[5], q[6];
cx q[6], q[8];
rz(0.108) q[8];
cx q[6], q[8];

// Layer 2: Mixer operations
rx(0.205) q[0];
rx(0.203) q[1];
rx(0.201) q[2];
rx(0.199) q[3];
rx(0.197) q[4];
rx(0.195) q[5];
rx(0.193) q[6];
rx(0.191) q[7];
rx(0.189) q[8];

// Layer 3: Problem-specific entangling gates
cx q[0], q[6];
rz(0.095) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(0.093) q[6];
cx q[1], q[6];
cx q[1], q[7];
rz(0.091) q[7];
cx q[1], q[7];
cx q[1], q[8];
rz(0.089) q[8];
cx q[1], q[8];
cx q[2], q[7];
rz(0.087) q[7];
cx q[2], q[7];
cx q[3], q[5];
rz(0.085) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(0.083) q[5];
cx q[4], q[5];
cx q[4], q[7];
rz(0.081) q[7];
cx q[4], q[7];
cx q[4], q[8];
rz(0.079) q[8];
cx q[4], q[8];
cx q[5], q[6];
rz(0.077) q[6];
cx q[5], q[6];
cx q[6], q[8];
rz(0.075) q[8];
cx q[6], q[8];

// Layer 3: Mixer operations
rx(0.142) q[0];
rx(0.140) q[1];
rx(0.138) q[2];
rx(0.136) q[3];
rx(0.134) q[4];
rx(0.132) q[5];
rx(0.130) q[6];
rx(0.128) q[7];
rx(0.126) q[8];

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