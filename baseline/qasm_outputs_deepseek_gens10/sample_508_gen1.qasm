OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and parameterized rotations
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

// Edge interaction terms (layer 1)
// Edge 0-1
cx q[0], q[7];
rz(0.214) q[7];
cx q[0], q[7];
// Edge 0-3
cx q[0], q[8];
rz(0.192) q[8];
cx q[0], q[8];
// Edge 0-4
cx q[0], q[9];
rz(0.205) q[9];
cx q[0], q[9];
// Edge 0-5
cx q[0], q[10];
rz(0.198) q[10];
cx q[0], q[10];
// Edge 0-6
cx q[0], q[1];
rz(0.221) q[1];
cx q[0], q[1];
// Edge 1-2
cx q[1], q[2];
rz(0.183) q[2];
cx q[1], q[2];
// Edge 1-4
cx q[1], q[4];
rz(0.176) q[4];
cx q[1], q[4];
// Edge 2-3
cx q[2], q[3];
rz(0.169) q[3];
cx q[2], q[3];
// Edge 2-5
cx q[2], q[5];
rz(0.194) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.187) q[6];
cx q[2], q[6];
// Edge 4-6
cx q[4], q[6];
rz(0.202) q[6];
cx q[4], q[6];

// Layer 2: Mixing terms
rx(0.432) q[0];
rx(0.415) q[1];
rx(0.398) q[2];
rx(0.421) q[3];
rx(0.409) q[4];
rx(0.426) q[5];
rx(0.418) q[6];
rx(0.401) q[7];
rx(0.423) q[8];
rx(0.412) q[9];
rx(0.429) q[10];

// Layer 3: Final parameterized rotations and measurements
rz(0.157) q[0];
rz(0.142) q[1];
rz(0.135) q[2];
rz(0.148) q[3];
rz(0.139) q[4];
rz(0.151) q[5];
rz(0.144) q[6];
rz(0.129) q[7];
rz(0.146) q[8];
rz(0.138) q[9];
rz(0.153) q[10];

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