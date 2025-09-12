OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize and entangle qubits
h q[0];
h q[1];
h q[2];
h q[3];

cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[1];
cx q[2], q[3];

// Layer 2: Apply rotations
rz(1.0472) q[0]; // Example rotation parameter
rz(0.7854) q[1]; // Example rotation parameter
rz(0.5236) q[2]; // Example rotation parameter
rz(1.5708) q[3]; // Example rotation parameter

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];