OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1 - Initialization and Mixing
for i in [0:12] {
    h q[i];
}

// Layer 1 - Problem Unitary (Cost Hamiltonian)
// Left-Right connections with weights
crz(8.0) q[0], q[7];
crz(14.0) q[0], q[8];
crz(8.0) q[1], q[8];
crz(3.0) q[2], q[9];
crz(20.0) q[2], q[7];
crz(12.0) q[2], q[8];
crz(2.0) q[3], q[10];
crz(4.0) q[4], q[11];
crz(11.0) q[4], q[7];
crz(9.0) q[5], q[12];
crz(12.0) q[5], q[11];

// Layer 2 - Mixing Hamiltonian
for i in [0:12] {
    rx(1.5708) q[i];
}

// Layer 2 - Problem Unitary (Cost Hamiltonian)
// Repeat connections with optimized parameters
crz(4.0) q[0], q[7];
crz(7.0) q[0], q[8];
crz(4.0) q[1], q[8];
crz(1.5) q[2], q[9];
crz(10.0) q[2], q[7];
crz(6.0) q[2], q[8];
crz(1.0) q[3], q[10];
crz(2.0) q[4], q[11];
crz(5.5) q[4], q[7];
crz(4.5) q[5], q[12];
crz(6.0) q[5], q[11];

// Measurement
for i in [0:12] {
    c[i] = measure q[i];
}