OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
h q[0];
h q[1];
h q[2];
h q[3];
rx(1.5708) q[0]; // Rotate 90 degrees
rx(1.5708) q[1];
cx q[0], q[1]; // Entangle qubits q[0] and q[1]
rz(-0.7854) q[1]; // Adjust phase for q[1]
cx q[2], q[3]; // Entangle qubits q[2] and q[3]
rz(0.7854) q[3]; // Adjust phase for q[3]
h q[0];
h q[1];
h q[2];
h q[3];
rz(-0.7854) q[0]; // Final phase rotation for q[0]
rz(0.7854) q[1]; // Final phase rotation for q[1]
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];