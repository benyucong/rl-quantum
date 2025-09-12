OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialize qubits with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply controlled rotations based on edges weights
// Mapping the weights to a parameter
rz(0.6931) q[0]; // weight edge (0,1)
cx q[0], q[1];
rz(2.5649) q[0]; // weight edge (0,3)
cx q[0], q[3];
rz(2.8904) q[0]; // weight edge (0,4)
cx q[0], q[4];
rz(2.5649) q[1]; // weight edge (1,4)
cx q[1], q[4];
rz(2.7080) q[1]; // weight edge (1,7)
cx q[1], q[7];
rz(0.0009) q[2]; // weight edge (2,3)
cx q[2], q[3];
rz(2.9444) q[2]; // weight edge (2,4)
cx q[2], q[4];
rz(0.0009) q[4]; // weight edge (4,5)
cx q[4], q[5];
rz(2.3026) q[6]; // weight edge (6,7)
cx q[6], q[7];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];