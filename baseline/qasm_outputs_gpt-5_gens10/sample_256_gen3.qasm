OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits to superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1: Apply parameterized rotation gates
rx(0.5) q[0];
rz(0.2) q[0];
rx(0.5) q[1];
rz(0.1) q[1];
rx(0.3) q[2];
rz(0.3) q[2];
rx(0.4) q[3];
rz(0.4) q[3];
rx(0.2) q[4];
rz(0.2) q[4];

// Layer 2: Entangling gates between specific nodes
cx q[0], q[3]; 
cx q[1], q[3];
cx q[2], q[4];
cx q[1], q[4];

// Layer 3: Further entangling actions based on connectivity in the graph
cx q[0], q[4];
cx q[2], q[3];

// Layer 4: Apply inverse rotations to complete the circuit
rz(-0.2) q[0];
rx(-0.5) q[0];
rz(-0.1) q[1];
rx(-0.5) q[1];
rz(-0.3) q[2];
rx(-0.3) q[2];
rz(-0.4) q[3];
rx(-0.4) q[3];
rz(-0.2) q[4];
rx(-0.2) q[4];

// Measurement of all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];