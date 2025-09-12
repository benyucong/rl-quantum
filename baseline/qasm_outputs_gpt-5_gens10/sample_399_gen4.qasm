OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1
rx(1.571) q[0];
ry(1.254) q[1];
rz(0.785) q[2];
rx(0.615) q[3];
rx(1.203) q[4];
ry(0.891) q[5];
rz(1.005) q[6];
ry(0.424) q[7];
cx q[0], q[1];
cx q[2], q[3];

// Layer 2
rz(1.029) q[0];
rz(1.547) q[1];
rz(0.861) q[2];
rx(0.745) q[3];
rx(1.218) q[4];
ry(1.112) q[5];
rx(0.394) q[6];
rx(1.823) q[7];
cx q[1], q[2];
cx q[3], q[4];

// Layer 3
rz(0.912) q[0];
rx(1.006) q[1];
rz(1.304) q[2];
ry(0.578) q[3];
ry(1.493) q[4];
rx(0.558) q[5];
rx(0.644) q[6];
ry(1.012) q[7];
cx q[4], q[5];
cx q[0], q[3];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];