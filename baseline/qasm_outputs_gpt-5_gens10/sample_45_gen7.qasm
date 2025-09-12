OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits for graph coloring
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 1: Apply controlled rotations and entangling gates
cx q[0], q[1];
rx(1.2345) q[0];
ry(1.5678) q[1];

cx q[0], q[2];
rx(1.3456) q[0];
ry(1.6789) q[2];

cx q[1], q[2];
rx(1.4567) q[1];
ry(1.7890) q[2];

cx q[3], q[1];
rx(1.2345) q[3];
ry(1.5678) q[1];

// Layer 2: Apply additional controlled operations and rotations
h q[0];
h q[1];

cx q[0], q[2];
rz(0.0453) q[2];
cx q[0], q[2];

cx q[1], q[3];
rz(0.0345) q[3];
cx q[1], q[3];

// Layer 3: Finalize with rotations and measurements
h q[0];
h q[1];
h q[2];
h q[3];

rx(0.1234) q[0];
rx(0.2345) q[1];
rx(0.3456) q[2];
rx(0.4567) q[3];

// Layer 4: Readout
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];