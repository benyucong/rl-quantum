OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply controlled rotations and entanglements based on graph edges
cx q[0], q[1]; // from source 0 to 1
rz(0.3) q[1]; // capacity weight adjustment
cx q[0], q[1];

cx q[0], q[2]; // from source 0 to 2
rz(0.4) q[2];
cx q[0], q[2];

cx q[0], q[4]; // from source 0 to 4
rz(0.2) q[4];
cx q[0], q[4];

cx q[0], q[6]; // from source 0 to 6
rz(0.5) q[6];
cx q[0], q[6];

cx q[0], q[7]; // from source 0 to sink 7
rz(0.6) q[7];
cx q[0], q[7];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply controlled rotations for interaction between qubits
cx q[1], q[6]; // min_cut conditions
rz(0.3) q[6];
cx q[1], q[6];

cx q[2], q[1]; // interactions between qubits
rz(0.2) q[1];
cx q[2], q[1];

cx q[2], q[7]; // interactions with sink
rz(0.4) q[7];
cx q[2], q[7];

cx q[3], q[2]; // additional control
rz(0.3) q[2];
cx q[3], q[2];

cx q[4], q[3]; // another gate to add complexity
rz(0.5) q[3];
cx q[4], q[3];

cx q[5], q[1]; // interrelations to fit min_cut logic
rz(0.4) q[1];
cx q[5], q[1];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];