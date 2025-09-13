OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initial Hadamard layer
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

// Layer 1 - Problem Hamiltonian
rz(0.314) q[0];
rz(0.251) q[1];
rz(0.188) q[2];
rz(0.063) q[3];
rz(0.063) q[4];
rz(0.251) q[5];
rz(0.188) q[6];
rz(0.126) q[7];
rz(0.251) q[8];
rz(0.188) q[9];

// Layer 1 - Mixer Hamiltonian
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];
rx(0.785) q[8];
rx(0.785) q[9];

// Layer 2 - Problem Hamiltonian
rz(0.628) q[0];
rz(0.502) q[1];
rz(0.376) q[2];
rz(0.126) q[3];
rz(0.126) q[4];
rz(0.502) q[5];
rz(0.376) q[6];
rz(0.252) q[7];
rz(0.502) q[8];
rz(0.376) q[9];

// Layer 2 - Mixer Hamiltonian
rx(1.571) q[0];
rx(1.571) q[1];
rx(1.571) q[2];
rx(1.571) q[3];
rx(1.571) q[4];
rx(1.571) q[5];
rx(1.571) q[6];
rx(1.571) q[7];
rx(1.571) q[8];
rx(1.571) q[9];

// Layer 3 - Problem Hamiltonian
rz(0.942) q[0];
rz(0.753) q[1];
rz(0.564) q[2];
rz(0.189) q[3];
rz(0.189) q[4];
rz(0.753) q[5];
rz(0.564) q[6];
rz(0.378) q[7];
rz(0.753) q[8];
rz(0.564) q[9];

// Layer 3 - Mixer Hamiltonian
rx(2.356) q[0];
rx(2.356) q[1];
rx(2.356) q[2];
rx(2.356) q[3];
rx(2.356) q[4];
rx(2.356) q[5];
rx(2.356) q[6];
rx(2.356) q[7];
rx(2.356) q[8];
rx(2.356) q[9];

// Layer 4 - Problem Hamiltonian
rz(1.256) q[0];
rz(1.004) q[1];
rz(0.752) q[2];
rz(0.252) q[3];
rz(0.252) q[4];
rz(1.004) q[5];
rz(0.752) q[6];
rz(0.504) q[7];
rz(1.004) q[8];
rz(0.752) q[9];

// Layer 4 - Mixer Hamiltonian
rx(3.142) q[0];
rx(3.142) q[1];
rx(3.142) q[2];
rx(3.142) q[3];
rx(3.142) q[4];
rx(3.142) q[5];
rx(3.142) q[6];
rx(3.142) q[7];
rx(3.142) q[8];
rx(3.142) q[9];

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
c[9] = measure q[9];