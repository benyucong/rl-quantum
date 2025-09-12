OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];

// First layer of entangling gates based on the bipartite connections
cx q[0], q[3];
rz(0.012) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(0.015) q[4];
cx q[0], q[4];

cx q[0], q[6];
rz(0.010) q[6];
cx q[0], q[6];

cx q[1], q[4];
rz(0.020) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(0.012) q[5];
cx q[1], q[5];

cx q[1], q[7];
rz(0.018) q[7];
cx q[1], q[7];

// Second layer of entangling gates
cx q[2], q[5];
rz(0.009) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.011) q[6];
cx q[2], q[6];

cx q[2], q[7];
rz(0.014) q[7];
cx q[2], q[7];

cx q[3], q[6];
rz(0.016) q[6];
cx q[3], q[6];

cx q[3], q[7];
rz(0.013) q[7];
cx q[3], q[7];

// Third layer of entangling gates
cx q[0], q[1];
rz(0.017) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.002) q[2];
cx q[0], q[2];

// Fourth layer of entangling gates
cx q[1], q[2];
rz(0.004) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.005) q[3];
cx q[1], q[3];

h q[0];
h q[1];
h q[2];
h q[3];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];