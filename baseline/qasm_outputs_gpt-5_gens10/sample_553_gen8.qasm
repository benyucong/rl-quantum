OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1: Create entanglement based on graph structure
cx q[0], q[2]; // connects 0 to 2
cx q[1], q[2]; // connects 1 to 2
cx q[3], q[4]; // connects 3 to 4
cx q[4], q[5]; // connects 4 to 5

// Layer 2: Apply Rz rotations for phase adjustments
rz(0.234) q[2];
rz(0.45) q[4];

// Layer 3: More entanglement using CNOTs
cx q[2], q[3];
cx q[1], q[4];

// Layer 4: Prepare final state with U gates
rx(1.256) q[0];
rz(0.123) q[0];
rx(2.456) q[1];
rz(0.654) q[1];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];