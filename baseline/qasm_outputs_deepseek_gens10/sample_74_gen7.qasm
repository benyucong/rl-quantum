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
// Cost Hamiltonian for vertex cover
rz(0.214) q[0];
rz(0.327) q[1];
rz(0.183) q[2];
rz(0.192) q[3];
rz(0.305) q[4];
rz(0.241) q[5];
rz(0.398) q[6];
// Edge constraints
cx q[0], q[1];
rz(0.156) q[1];
cx q[0], q[1];
cx q[0], q[6];
rz(0.142) q[6];
cx q[0], q[6];
cx q[1], q[4];
rz(0.168) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.134) q[5];
cx q[1], q[5];
cx q[2], q[6];
rz(0.125) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(0.118) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(0.152) q[6];
cx q[4], q[6];
// Mixer layer 1
rx(0.428) q[0];
rx(0.654) q[1];
rx(0.366) q[2];
rx(0.384) q[3];
rx(0.610) q[4];
rx(0.482) q[5];
rx(0.796) q[6];
// Layer 2
// Cost Hamiltonian for vertex cover
rz(0.198) q[0];
rz(0.302) q[1];
rz(0.169) q[2];
rz(0.178) q[3];
rz(0.282) q[4];
rz(0.223) q[5];
rz(0.367) q[6];
// Edge constraints
cx q[0], q[1];
rz(0.144) q[1];
cx q[0], q[1];
cx q[0], q[6];
rz(0.131) q[6];
cx q[0], q[6];
cx q[1], q[4];
rz(0.155) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.124) q[5];
cx q[1], q[5];
cx q[2], q[6];
rz(0.116) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(0.109) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(0.140) q[6];
cx q[4], q[6];
// Mixer layer 2
rx(0.396) q[0];
rx(0.604) q[1];
rx(0.338) q[2];
rx(0.356) q[3];
rx(0.564) q[4];
rx(0.446) q[5];
rx(0.734) q[6];
// Layer 3
// Cost Hamiltonian for vertex cover
rz(0.183) q[0];
rz(0.279) q[1];
rz(0.156) q[2];
rz(0.164) q[3];
rz(0.260) q[4];
rz(0.206) q[5];
rz(0.339) q[6];
// Edge constraints
cx q[0], q[1];
rz(0.133) q[1];
cx q[0], q[1];
cx q[0], q[6];
rz(0.121) q[6];
cx q[0], q[6];
cx q[1], q[4];
rz(0.143) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.114) q[5];
cx q[1], q[5];
cx q[2], q[6];
rz(0.107) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(0.101) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(0.129) q[6];
cx q[4], q[6];
// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];