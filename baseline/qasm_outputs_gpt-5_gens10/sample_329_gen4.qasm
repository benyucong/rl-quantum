OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Apply Hadamard gates to prepare superposition 
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2: Implementing controlled not and rotation gates 
cx q[0], q[2]; // source(0) -> node(2)
rz(-0.678) q[2]; 
cx q[0], q[2];

cx q[0], q[3]; // source(0) -> node(3)
rz(-0.567) q[3]; 
cx q[0], q[3];

cx q[0], q[4]; // source(0) -> node(4)
rz(-0.754) q[4]; 
cx q[0], q[4];

cx q[0], q[6]; // source(0) -> node(6)
rz(-0.653) q[6]; 
cx q[0], q[6];

cx q[1], q[3]; // node(1) -> node(3)
rz(-0.459) q[3]; 
cx q[1], q[3];

cx q[1], q[5]; // node(1) -> node(5)
rz(-0.738) q[5]; 
cx q[1], q[5];

cx q[1], q[6]; // node(1) -> sink(6)
rz(-0.345) q[6]; 
cx q[1], q[6];

cx q[2], q[4]; // node(2) -> node(4)
rz(-0.197) q[4]; 
cx q[2], q[4];

cx q[2], q[5]; // node(2) -> node(5)
rz(-0.264) q[5]; 
cx q[2], q[5];

cx q[3], q[5]; // node(3) -> node(5)
rz(-0.115) q[5]; 
cx q[3], q[5];

cx q[3], q[6]; // node(3) -> sink(6)
rz(-0.319) q[6]; 
cx q[3], q[6];


// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];