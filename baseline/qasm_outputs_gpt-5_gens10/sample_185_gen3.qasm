OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Apply controlled operations based on edges
cx q[0], q[1]; // 0 <-> 1
rz(0.2131) q[1];
cx q[0], q[1];

cx q[0], q[3]; // 0 <-> 3
rz(0.5764) q[3];
cx q[0], q[3];

cx q[0], q[5]; // 0 <-> 5
rz(0.4587) q[5];
cx q[0], q[5];

cx q[1], q[5]; // 1 <-> 5
rz(0.3290) q[5];
cx q[1], q[5];

cx q[2], q[3]; // 2 <-> 3
rz(0.1143) q[3];
cx q[2], q[3];

cx q[3], q[5]; // 3 <-> 5
rz(0.4129) q[5];
cx q[3], q[5];

cx q[4], q[5]; // 4 <-> 5
rz(0.1042) q[5];
cx q[4], q[5];

cx q[4], q[6]; // 4 <-> 6
rz(0.0973) q[6];
cx q[4], q[6];

cx q[6], q[7]; // 6 <-> 7
rz(0.0841) q[7];
cx q[6], q[7];

// Layer 2: Apply inverse operations to measure final states
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];