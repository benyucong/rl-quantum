OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// First layer: apply Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Second layer: control rotations based on the graph edges
rz(0.5) q[0]; 
cx q[0], q[3]; // edge (0, 3)
cx q[0], q[5]; // edge (0, 5)
rz(0.5) q[1]; 
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[3]; // edge (1, 3)
cx q[1], q[6]; // edge (1, 6)
rz(0.5) q[2]; 
cx q[2], q[3]; // edge (2, 3)
cx q[2], q[6]; // edge (2, 6)
rz(0.5) q[3]; 
cx q[3], q[5]; // edge (3, 5)
rz(0.5) q[4]; 
cx q[4], q[5]; // edge (4, 5)
cx q[4], q[6]; // edge (4, 6)
rz(0.5) q[5]; 
cx q[5], q[6]; // edge (5, 6)

// Third layer: additional rotations to mix states
rz(-0.5) q[0];
rz(-0.5) q[1];
rz(-0.5) q[2];
rz(-0.5) q[3];
rz(-0.5) q[4];
rz(-0.5) q[5];
rz(-0.5) q[6];

// Fourth layer: apply inverse Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];