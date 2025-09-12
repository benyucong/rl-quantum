OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Apply Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled-X and rotations for entanglement
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[4];

// Optimization rotations based on the structure
rz(0.235) q[0];
rz(0.283) q[1];
rz(0.148) q[2];
rz(0.559) q[3];
rz(0.471) q[4];
rz(0.301) q[5];

// Layer 3: Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];