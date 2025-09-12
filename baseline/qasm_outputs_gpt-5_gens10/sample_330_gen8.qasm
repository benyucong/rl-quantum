OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits to |+⟩ state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer: entangling qubits based on the edges present in the graph
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[4];
cx q[1], q[2];
cx q[2], q[5];
cx q[4], q[3];
cx q[3], q[5];

// Second layer: applying rotation gates for k = 3
rz(1.5707) q[0];
rz(1.5707) q[1];
rz(1.5707) q[2];
rz(1.5707) q[3];
rz(1.5707) q[4];
rz(1.5707) q[5];

// Third layer: more entanglements to ensure clique
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[5];

// Fourth layer: final rotations
rx(2.3562) q[0];
rx(2.3562) q[1];
rx(2.3562) q[2];
rx(2.3562) q[3];
rx(2.3562) q[4];
rx(2.3562) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];