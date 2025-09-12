OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize qubit states
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply entangling gates based on the K-Clique structure of the graph
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[3], q[4];
cx q[3], q[5];

// Layer 3: Apply rotation gates for optimal state preparation
rz(0.15) q[0];
rz(0.25) q[1];
rz(0.35) q[2];
rz(0.45) q[3];
rz(0.55) q[4];
rz(0.65) q[5];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];