OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initial Hadamard and problem-specific unitaries
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
h q[12];

// Edge interaction terms (first layer)
// Edge (0,3)
cx q[0], q[7];
rz(0.214) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.192) q[8];
cx q[0], q[8];
// Edge (1,2)
cx q[1], q[9];
rz(0.178) q[9];
cx q[1], q[9];
// Edge (1,3)
cx q[1], q[10];
rz(0.205) q[10];
cx q[1], q[10];
// Edge (1,4)
cx q[1], q[11];
rz(0.221) q[11];
cx q[1], q[11];
// Edge (1,5)
cx q[1], q[12];
rz(0.198) q[12];
cx q[1], q[12];
// Edge (2,3)
cx q[2], q[7];
rz(0.186) q[7];
cx q[2], q[7];
// Edge (2,4)
cx q[2], q[11];
rz(0.203) q[11];
cx q[2], q[11];
// Edge (2,5)
cx q[2], q[12];
rz(0.189) q[12];
cx q[2], q[12];
// Edge (3,4)
cx q[3], q[11];
rz(0.211) q[11];
cx q[3], q[11];
// Edge (4,5)
cx q[4], q[12];
rz(0.195) q[12];
cx q[4], q[12];
// Edge (4,6)
cx q[4], q[6];
rz(0.182) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.176) q[6];
cx q[5], q[6];

// Mixer layer 1
rx(0.423) q[0];
rx(0.423) q[1];
rx(0.423) q[2];
rx(0.423) q[3];
rx(0.423) q[4];
rx(0.423) q[5];
rx(0.423) q[6];
rx(0.423) q[7];
rx(0.423) q[8];
rx(0.423) q[9];
rx(0.423) q[10];
rx(0.423) q[11];
rx(0.423) q[12];

// Layer 2: Problem-specific unitaries
// Edge (0,3)
cx q[0], q[7];
rz(0.231) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.208) q[8];
cx q[0], q[8];
// Edge (1,2)
cx q[1], q[9];
rz(0.192) q[9];
cx q[1], q[9];
// Edge (1,3)
cx q[1], q[10];
rz(0.222) q[10];
cx q[1], q[10];
// Edge (1,4)
cx q[1], q[11];
rz(0.238) q[11];
cx q[1], q[11];
// Edge (1,5)
cx q[1], q[12];
rz(0.214) q[12];
cx q[1], q[12];
// Edge (2,3)
cx q[2], q[7];
rz(0.201) q[7];
cx q[2], q[7];
// Edge (2,4)
cx q[2], q[11];
rz(0.219) q[11];
cx q[2], q[11];
// Edge (2,5)
cx q[2], q[12];
rz(0.204) q[12];
cx q[2], q[12];
// Edge (3,4)
cx q[3], q[11];
rz(0.228) q[11];
cx q[3], q[11];
// Edge (4,5)
cx q[4], q[12];
rz(0.211) q[12];
cx q[4], q[12];
// Edge (4,6)
cx q[4], q[6];
rz(0.197) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.190) q[6];
cx q[5], q[6];

// Mixer layer 2
rx(0.387) q[0];
rx(0.387) q[1];
rx(0.387) q[2];
rx(0.387) q[3];
rx(0.387) q[4];
rx(0.387) q[5];
rx(0.387) q[6];
rx(0.387) q[7];
rx(0.387) q[8];
rx(0.387) q[9];
rx(0.387) q[10];
rx(0.387) q[11];
rx(0.387) q[12];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];