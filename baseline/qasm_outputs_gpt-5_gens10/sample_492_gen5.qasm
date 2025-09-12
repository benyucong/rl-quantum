OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Initialize qubits with Hadamard to create a superposition.
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
h q[13];
h q[14];

// Apply layer of controlled rotations representing flow capacity.
cx q[0], q[6]; // 2 capacity from 0 to 6
cx q[0], q[8]; // 1 capacity from 0 to 8
cx q[1], q[3]; // 2 capacity from 1 to 3
cx q[1], q[4]; // 1 capacity from 1 to 4
cx q[2], q[5]; // 1 capacity from 2 to 5
cx q[3], q[6]; // 1 capacity from 3 to 6
cx q[4], q[5]; // 1 capacity from 4 to 5
cx q[6], q[1]; // 2 capacity from 6 to 1
cx q[6], q[4]; // 2 capacity from 6 to 4
cx q[7], q[4]; // 1 capacity from 7 to 4
cx q[7], q[6]; // 1 capacity from 7 to 6
cx q[7], q[8]; // 1 capacity from 7 to 8

// Final measurements to extract the classical bits.
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
c[13] = measure q[13];
c[14] = measure q[14];