OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];

// Capacity constraints phase (edge qubits 7-12)
rz(0.7854) q[7];  // edge 0-1 capacity 1
rz(1.5708) q[8];  // edge 0-6 capacity 2
rz(0.7854) q[9];  // edge 1-4 capacity 1
rz(1.5708) q[10]; // edge 1-6 capacity 2
rz(0.7854) q[11]; // edge 2-4 capacity 1
rz(1.5708) q[12]; // edge 3-5 capacity 3

// Flow conservation constraints
// Node 0 (source): outflow constraints
cx q[0], q[7];
rz(-0.3927) q[7];
cx q[0], q[7];
cx q[0], q[8];
rz(-0.7854) q[8];
cx q[0], q[8];

// Node 1: conservation
cx q[1], q[7];
rz(0.3927) q[7];
cx q[1], q[7];
cx q[1], q[9];
rz(-0.3927) q[9];
cx q[1], q[9];
cx q[1], q[10];
rz(-0.7854) q[10];
cx q[1], q[10];

// Layer 2: Additional mixing and constraints
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Node 2: conservation
cx q[2], q[11];
rz(0.3927) q[11];
cx q[2], q[11];

// Node 3: conservation
cx q[3], q[12];
rz(-1.1781) q[12];
cx q[3], q[12];

// Node 4: conservation
cx q[4], q[9];
rz(0.3927) q[9];
cx q[4], q[9];
cx q[4], q[11];
rz(0.3927) q[11];
cx q[4], q[11];

// Layer 3: Final optimization and measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Final phase adjustments for optimal flow
rz(0.5236) q[0];
rz(0.3491) q[1];
rz(0.1745) q[2];
rz(0.6981) q[3];
rz(0.2618) q[4];
rz(0.0873) q[5];
rz(0.4363) q[6];

// Measure all qubits
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