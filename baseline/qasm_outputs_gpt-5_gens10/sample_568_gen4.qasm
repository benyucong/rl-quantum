OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initialize qubits to represent the source node
h q[0];
h q[1];
h q[2];
h q[3];
// Prepare entanglement between source and other nodes
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];

// Layer 1: Encoding the flow capacities
rx(0.6308) q[0];
rx(1.0417) q[1];
rx(0.7854) q[2];
rx(0.5933) q[3];
rx(0.9825) q[4];
rx(1.1772) q[5];

// Layer 2: Final entanglements to create the flow paths
rz(0.1375) q[0];
rz(-0.1543) q[1];
rz(0.4430) q[2];
rz(-0.2050) q[3];
rz(0.2987) q[4];
rz(0.6723) q[5];

// Measure the qubits representing the flow
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