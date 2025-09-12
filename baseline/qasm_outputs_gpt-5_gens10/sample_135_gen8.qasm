OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initialization and encoding edges
h q[0]; // Initialize source
h q[1]; // Node 1
h q[2]; // Node 2
h q[3]; // Node 3
h q[4]; // Node 4
h q[5]; // Node 5
h q[6]; // Sink
cx q[0], q[1]; // Edge from Node 0 to Node 1
cx q[0], q[6]; // Edge from Node 0 to Sink
cx q[1], q[4]; // Edge from Node 1 to Node 4
cx q[1], q[6]; // Edge from Node 1 to Sink
cx q[2], q[4]; // Edge from Node 2 to Node 4
cx q[3], q[2]; // Edge from Node 3 to Node 2
cx q[3], q[5]; // Edge from Node 3 to Node 5
cx q[3], q[6]; // Edge from Node 3 to Sink
cx q[4], q[2]; // Edge from Node 4 to Node 2

// Layer 2: Apply control phase for capacities
rz(0.5) q[0]; // Capacity from source to Node 1
rz(1.0) q[1]; // Capacity from Node 1 to Sink
rz(0.5) q[3]; // Capacity from Node 3 to Sink
rz(1.0) q[1]; // Capacity from Node 1 to Node 4
rz(0.5) q[2]; // Capacity from Node 2 to Node 4
rz(1.5) q[2]; // Capacity from Node 2 to Sink

// Layer 3: Finalize entanglements
h q[0]; // Finalize source
h q[1]; // Finalize Node 1
h q[2]; // Finalize Node 2
h q[3]; // Finalize Node 3
h q[4]; // Finalize Node 4
h q[5]; // Finalize Node 5
h q[6]; // Finalize Sink
cx q[0], q[6]; // Entangle source to Sink

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];