OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and first mixing
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

// Layer 1: Problem unitary (edge interactions)
rz(0.214) q[0];
rz(0.107) q[1];
rz(0.321) q[2];
rz(0.143) q[3];
rz(0.179) q[4];
rz(0.250) q[5];
rz(0.286) q[6];
rz(0.357) q[7];
rz(0.429) q[8];
rz(0.393) q[9];
rz(0.179) q[10];

// Layer 2: Mixing and problem unitary
rx(0.857) q[0];
rx(0.714) q[1];
rx(1.071) q[2];
rx(0.929) q[3];
rx(0.786) q[4];
rx(0.643) q[5];
rx(0.500) q[6];
rx(0.357) q[7];
rx(0.214) q[8];
rx(0.071) q[9];
rx(0.929) q[10];

// Layer 3: Mixing and problem unitary
rz(0.429) q[0];
rz(0.357) q[1];
rz(0.500) q[2];
rz(0.286) q[3];
rz(0.214) q[4];
rz(0.143) q[5];
rz(0.071) q[6];
rz(0.000) q[7];
rz(0.857) q[8];
rz(0.786) q[9];
rz(0.643) q[10];

// Layer 4: Final mixing and measurement preparation
rx(1.214) q[0];
rx(1.071) q[1];
rx(0.929) q[2];
rx(0.786) q[3];
rx(0.643) q[4];
rx(0.500) q[5];
rx(0.357) q[6];
rx(0.214) q[7];
rx(0.071) q[8];
rx(0.857) q[9];
rx(1.000) q[10];

// Final measurements
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