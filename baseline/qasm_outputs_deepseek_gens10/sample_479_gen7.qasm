OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialize qubits for 3 nodes with 3 colors each (one-hot encoding)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Apply constraints for valid coloring
// Constraint: Each node gets exactly one color
rz(1.0472) q[0];
rz(1.0472) q[1];
rz(1.0472) q[2];
rz(1.0472) q[3];
rz(1.0472) q[4];
rz(1.0472) q[5];
rz(1.0472) q[6];
rz(1.0472) q[7];
rz(1.0472) q[8];

// Edge constraints: Adjacent nodes must have different colors
// Edge (0,2)
cx q[0], q[6];
rz(0.5236) q[6];
cx q[0], q[6];
cx q[1], q[7];
rz(0.5236) q[7];
cx q[1], q[7];
cx q[2], q[8];
rz(0.5236) q[8];
cx q[2], q[8];

// Edge (2,1)
cx q[6], q[3];
rz(0.5236) q[3];
cx q[6], q[3];
cx q[7], q[4];
rz(0.5236) q[4];
cx q[7], q[4];
cx q[8], q[5];
rz(0.5236) q[5];
cx q[8], q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];