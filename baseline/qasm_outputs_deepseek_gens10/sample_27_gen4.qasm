OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

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
h q[11];

rz(0.314) q[0];
rz(0.271) q[1];
rz(0.159) q[2];
rz(0.265) q[3];
rz(0.298) q[4];
rz(0.227) q[5];
rz(0.183) q[6];
rz(0.342) q[7];
rz(0.291) q[8];
rz(0.205) q[9];
rz(0.336) q[10];
rz(0.254) q[11];

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,1)
cx q[0], q[1];
rz(-0.127) q[1];
cx q[0], q[1];

// Edge (0,4)
cx q[0], q[4];
rz(-0.142) q[4];
cx q[0], q[4];

// Edge (0,6)
cx q[0], q[6];
rz(-0.118) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(-0.095) q[4];
cx q[1], q[4];

// Edge (1,6)
cx q[1], q[6];
rz(-0.103) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(-0.134) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(-0.156) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(-0.121) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(-0.089) q[4];
cx q[3], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(-0.112) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(-0.147) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(-0.131) q[6];
cx q[5], q[6];

// Layer 3: Final parameterized rotations
rz(0.228) q[0];
rz(0.195) q[1];
rz(0.142) q[2];
rz(0.189) q[3];
rz(0.213) q[4];
rz(0.176) q[5];
rz(0.154) q[6];
rz(0.247) q[7];
rz(0.208) q[8];
rz(0.163) q[9];
rz(0.239) q[10];
rz(0.182) q[11];

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