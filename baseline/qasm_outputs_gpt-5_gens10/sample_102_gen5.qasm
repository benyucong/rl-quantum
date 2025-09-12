OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initialize the quantum state
h q[0]; // Source qubit initialization
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Encode flow capacities with RX gates
rx(1.5708) q[0]; // π/2 for source to target routing
rx(1.5708) q[1]; // encoding capacity
rx(1.5708) q[2]; // encoding capacity
rx(1.5708) q[3]; // encoding capacity
rx(1.5708) q[4]; // encoding capacity
rx(1.5708) q[5]; // encoding capacity

// Layer 2: Apply controlled rotations based on paths
cx q[0], q[2]; // flow from source 0 to 2
rz(0.5140) q[2]; // capacity routing
cx q[0], q[3]; // flow from source 0 to 3
rz(0.5140) q[3]; // capacity routing
cx q[0], q[4]; // flow from source 0 to 4
rz(0.1280) q[4]; // capacity routing
cx q[0], q[5]; // flow from source 0 to the sink
rz(0.1280) q[5]; // capacity routing

cx q[2], q[3]; // additional flow paths
rz(0.1280) q[3];

cx q[2], q[5]; // flow from 2 to sink
rz(0.5140) q[5];

cx q[3], q[1]; // additional flow paths
rz(0.1280) q[1];

// Measurement of output states
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
c[11] = measure q[11];
c[12] = measure q[12];