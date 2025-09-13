OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and mixing
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

// Layer 1: Problem-specific entangling gates with optimal parameters
// Edges from source (0) to neighbors
rz(0.214) q[1];
cx q[0], q[1];
rz(-0.214) q[1];
cx q[0], q[1];

rz(0.183) q[3];
cx q[0], q[3];
rz(-0.183) q[3];
cx q[0], q[3];

rz(0.251) q[5];
cx q[0], q[5];
rz(-0.251) q[5];
cx q[0], q[5];

rz(0.125) q[9];
cx q[0], q[9];
rz(-0.125) q[9];
cx q[0], q[9];

// Other significant edges in the graph
rz(0.167) q[7];
cx q[2], q[7];
rz(-0.167) q[7];
cx q[2], q[7];

rz(0.251) q[8];
cx q[2], q[8];
rz(-0.251) q[8];
cx q[2], q[8];

rz(0.167) q[10];
cx q[2], q[10];
rz(-0.167) q[10];
cx q[2], q[10];

rz(0.214) q[1];
cx q[3], q[1];
rz(-0.214) q[1];
cx q[3], q[1];

rz(0.214) q[6];
cx q[3], q[6];
rz(-0.214) q[6];
cx q[3], q[6];

rz(0.214) q[9];
cx q[3], q[9];
rz(-0.214) q[9];
cx q[3], q[9];

// Layer 2: Additional mixing and optimization
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

rz(0.142) q[2];
cx q[4], q[2];
rz(-0.142) q[2];
cx q[4], q[2];

rz(0.125) q[6];
cx q[4], q[6];
rz(-0.125) q[6];
cx q[4], q[6];

rz(0.125) q[10];
cx q[4], q[10];
rz(-0.125) q[10];
cx q[4], q[10];

rz(0.251) q[2];
cx q[5], q[2];
rz(-0.251) q[2];
cx q[5], q[2];

rz(0.167) q[7];
cx q[5], q[7];
rz(-0.167) q[7];
cx q[5], q[7];

rz(0.125) q[9];
cx q[5], q[9];
rz(-0.125) q[9];
cx q[5], q[9];

rz(0.125) q[10];
cx q[5], q[10];
rz(-0.125) q[10];
cx q[5], q[10];

// Layer 3: Final optimization and measurement preparation
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

rz(0.142) q[4];
cx q[6], q[4];
rz(-0.142) q[4];
cx q[6], q[4];

rz(0.125) q[7];
cx q[6], q[7];
rz(-0.125) q[7];
cx q[6], q[7];

rz(0.125) q[1];
cx q[7], q[1];
rz(-0.125) q[1];
cx q[7], q[1];

rz(0.167) q[6];
cx q[7], q[6];
rz(-0.167) q[6];
cx q[7], q[6];

rz(0.167) q[9];
cx q[7], q[9];
rz(-0.167) q[9];
cx q[7], q[9];

rz(0.167) q[10];
cx q[7], q[10];
rz(-0.167) q[10];
cx q[7], q[10];

rz(0.251) q[1];
cx q[8], q[1];
rz(-0.251) q[1];
cx q[8], q[1];

rz(0.251) q[2];
cx q[8], q[2];
rz(-0.251) q[2];
cx q[8], q[2];

rz(0.167) q[5];
cx q[8], q[5];
rz(-0.167) q[5];
cx q[8], q[5];

rz(0.214) q[5];
cx q[9], q[5];
rz(-0.214) q[5];
cx q[9], q[5];

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