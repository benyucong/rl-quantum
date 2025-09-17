OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Cost Hamiltonian for vertex cover (Layer 1)
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.298) q[2];
rz(0.342) q[3];
rz(0.225) q[4];
rz(0.331) q[5];
rz(0.367) q[6];

// Edge constraints (Layer 1)
cx q[0], q[1];
rz(0.089) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.092) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.105) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(0.078) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.101) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.113) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(0.067) q[3];
cx q[1], q[3];

cx q[1], q[6];
rz(0.071) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(0.069) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(0.065) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.073) q[6];
cx q[2], q[6];

cx q[3], q[6];
rz(0.062) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.058) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(0.061) q[6];
cx q[5], q[6];

// Layer 2
rx(1.892) q[0];
rx(1.834) q[1];
rx(1.907) q[2];
rx(1.963) q[3];
rx(1.721) q[4];
rx(1.945) q[5];
rx(2.018) q[6];

// Layer 3
rz(0.427) q[0];
rz(0.369) q[1];
rz(0.401) q[2];
rz(0.461) q[3];
rz(0.303) q[4];
rz(0.445) q[5];
rz(0.493) q[6];

// Edge constraints (Layer 3)
cx q[0], q[1];
rz(0.121) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.124) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.142) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(0.105) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.136) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.152) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(0.090) q[3];
cx q[1], q[3];

cx q[1], q[6];
rz(0.096) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(0.093) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(0.088) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.098) q[6];
cx q[2], q[6];

cx q[3], q[6];
rz(0.083) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.078) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(0.082) q[6];
cx q[5], q[6];

// Layer 4
rx(2.547) q[0];
rx(2.468) q[1];
rx(2.565) q[2];
rx(2.641) q[3];
rx(2.315) q[4];
rx(2.617) q[5];
rx(2.715) q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];