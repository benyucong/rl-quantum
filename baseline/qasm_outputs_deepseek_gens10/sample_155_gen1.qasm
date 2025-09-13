OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1: Edge interactions with optimal parameters
rz(0.314) q[0];
rz(0.628) q[1];
rz(0.942) q[2];
rz(1.256) q[3];
rz(1.570) q[4];
rz(1.884) q[5];
rz(2.198) q[6];
rz(2.512) q[7];
rz(2.826) q[8];

cx q[0], q[6];
rz(0.157) q[6];
cx q[0], q[6];

cx q[0], q[8];
rz(0.314) q[8];
cx q[0], q[8];

cx q[1], q[2];
rz(0.471) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.157) q[3];
cx q[1], q[3];

cx q[1], q[5];
rz(0.628) q[5];
cx q[1], q[5];

cx q[2], q[7];
rz(0.314) q[7];
cx q[2], q[7];

cx q[2], q[8];
rz(0.471) q[8];
cx q[2], q[8];

cx q[4], q[6];
rz(0.157) q[6];
cx q[4], q[6];

cx q[4], q[7];
rz(0.157) q[7];
cx q[4], q[7];

cx q[5], q[6];
rz(0.314) q[6];
cx q[5], q[6];

cx q[6], q[2];
rz(0.314) q[2];
cx q[6], q[2];

cx q[7], q[1];
rz(0.157) q[1];
cx q[7], q[1];

cx q[7], q[2];
rz(0.314) q[2];
cx q[7], q[2];

cx q[7], q[6];
rz(0.157) q[6];
cx q[7], q[6];

cx q[7], q[8];
rz(0.628) q[8];
cx q[7], q[8];

// Layer 2: Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

rz(0.785) q[0];
rz(1.047) q[1];
rz(1.309) q[2];
rz(1.571) q[3];
rz(1.833) q[4];
rz(2.095) q[5];
rz(2.356) q[6];
rz(2.618) q[7];
rz(2.880) q[8];

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

rz(0.392) q[0];
rz(0.523) q[1];
rz(0.654) q[2];
rz(0.785) q[3];
rz(0.916) q[4];
rz(1.047) q[5];
rz(1.178) q[6];
rz(1.309) q[7];
rz(1.440) q[8];

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