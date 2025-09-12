OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First layer encoding
rx(2.1395) q[0];
rx(2.2473) q[1];
rx(2.1377) q[2];
rx(2.9429) q[3];
rx(2.8362) q[4];
rx(1.4754) q[5];
rx(1.4062) q[6];
rx(1.0265) q[7];
rx(1.8091) q[8];

// Layer 1 entanglements based on the min cut edges
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[8];
cx q[1], q[2];
cx q[1], q[5];
cx q[2], q[7];
cx q[3], q[4];
cx q[3], q[5];
cx q[3], q[7];
cx q[4], q[1];
cx q[4], q[5];
cx q[4], q[8];
cx q[5], q[2];
cx q[5], q[3];
cx q[6], q[2];
cx q[7], q[1];
cx q[7], q[5];
cx q[7], q[6];

// Second layer with phases
rz(0.7234) q[0];
rz(0.5813) q[1];
rz(0.4337) q[2];
rz(0.7128) q[3];
rz(0.4129) q[4];
rz(0.8765) q[5];
rz(0.6743) q[6];
rz(0.5432) q[7];
rz(0.6234) q[8];

// Layer 2 entanglements
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];