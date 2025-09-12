OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Applying RX and RZ gates based on problem structure
rx(1.2543) q[0];
rz(0.5870) q[0];
rx(0.4321) q[1];
rz(-0.1245) q[1];
rx(1.7803) q[2];
rz(0.6562) q[2];
rx(0.6542) q[3];
rz(0.4623) q[3];
rx(1.8974) q[4];
rz(-0.3271) q[4];

// Layer 3: Entangling gates to capture relationships in the graph
cx q[0], q[1];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];

// Measure the outcome
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];