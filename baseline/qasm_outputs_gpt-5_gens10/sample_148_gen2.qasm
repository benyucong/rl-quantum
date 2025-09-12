OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialize qubits
h q[0]; // source qubit
h q[1]; // source qubit
h q[2]; // intermediate qubit
h q[3]; // intermediate qubit
h q[4]; // sink qubit

// Layer 2: Encode the flow capacities
rx(1.5707) q[0]; // Apply rotation for source
cx q[0], q[2]; // Connect source to intermediate
cx q[1], q[2]; // Connect additional source to intermediate
rz(1.0472) q[2]; // Apply rotation to encode capacity to sink

// Layer 3: Control the flow towards the sink
cx q[2], q[4]; // First control towards sink
rz(0.5236) q[4]; // Capacity adjustment to the sink
cx q[3], q[2]; // Second source towards the same intermediate

// Layer 4: Measure the results for flow
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];