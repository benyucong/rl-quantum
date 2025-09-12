OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled gates based on edges
cx q[0], q[3]; // Source (0) to Sink (3)
rz(0.3565) q[3];
cx q[0], q[3]; 

cx q[1], q[2]; // Node (1) to Node (2)
rz(0.7654) q[2];
cx q[1], q[2]; 

cx q[2], q[3]; // Node (2) to Sink (3)
rz(0.3458) q[3];
cx q[2], q[3];

// Layer 3: Apply additional rotations and controlled gates
h q[3];
rz(0.1234) q[3];
h q[3];

cx q[1], q[0]; // Source (0) and Node (1)
rz(0.4567) q[0];
cx q[1], q[0];

cx q[2], q[1]; // Node (1) to Node (2)
rz(0.2345) q[1];
cx q[2], q[1];

// Layer 4: Finalize the computation
h q[0];
h q[1];
h q[2];
h q[3];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];