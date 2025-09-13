OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and problem encoding
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

// Edge interactions with optimal parameters
// Layer 1: Capacity-weighted ZZ interactions
rz(0.214) q[2];
rz(0.107) q[3];
rz(0.321) q[6];
rz(0.321) q[7];
rz(0.214) q[3];
rz(0.214) q[5];
rz(0.428) q[8];
rz(0.321) q[10];
rz(0.107) q[1];
rz(0.214) q[6];
rz(0.107) q[8];
rz(0.107) q[9];
rz(0.107) q[11];
rz(0.107) q[3];
rz(0.107) q[6];
rz(0.321) q[7];
rz(0.321) q[11];
rz(0.321) q[3];
rz(0.428) q[9];
rz(0.321) q[10];
rz(0.428) q[11];
rz(0.321) q[8];
rz(0.107) q[11];
rz(0.214) q[3];
rz(0.321) q[8];
rz(0.428) q[11];
rz(0.428) q[1];
rz(0.107) q[3];
rz(0.321) q[10];
rz(0.214) q[2];
rz(0.428) q[3];
rz(0.107) q[5];
rz(0.428) q[8];
rz(0.321) q[10];
rz(0.321) q[4];
rz(0.107) q[8];
rz(0.428) q[9];
rz(0.428) q[11];

// Layer 2: Mixer and optimization
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
rz(0.152) q[0];
rz(0.152) q[1];
rz(0.152) q[2];
rz(0.152) q[3];
rz(0.152) q[4];
rz(0.152) q[5];
rz(0.152) q[6];
rz(0.152) q[7];
rz(0.152) q[8];
rz(0.152) q[9];
rz(0.152) q[10];
rz(0.152) q[11];
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

// Layer 3: Final optimization and source-sink constraints
// Source constraint (node 0)
x q[0];
// Sink constraint (node 11)
x q[11];
h q[11];
cx q[0], q[11];
h q[11];
x q[11];

// Final measurements
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