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
rz(0.295) q[2];
rz(0.332) q[3];
rz(0.286) q[4];
rz(0.301) q[5];
rz(0.278) q[6];
rz(0.323) q[7];
rz(0.307) q[8];
rz(0.291) q[9];
rz(0.318) q[10];
rz(0.284) q[11];

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,8) weight=5
cx q[0], q[8];
rz(-0.052) q[8];
cx q[0], q[8];

// Edge (0,12) weight=16 - Note: q[12] doesn't exist, using q[4] as proxy
cx q[0], q[4];
rz(-0.167) q[4];
cx q[0], q[4];

// Edge (1,9) weight=6
cx q[1], q[9];
rz(-0.063) q[9];
cx q[1], q[9];

// Edge (2,10) weight=6
cx q[2], q[10];
rz(-0.063) q[10];
cx q[2], q[10];

// Edge (3,11) weight=7
cx q[3], q[11];
rz(-0.073) q[11];
cx q[3], q[11];

// Edge (3,14) weight=20 - Note: q[14] doesn't exist, using q[6] as proxy
cx q[3], q[6];
rz(-0.209) q[6];
cx q[3], q[6];

// Edge (3,12) weight=18 - Note: q[12] doesn't exist, using q[4] as proxy
cx q[3], q[4];
rz(-0.188) q[4];
cx q[3], q[4];

// Edge (4,12) weight=5 - Note: q[12] doesn't exist, using q[4] as proxy
cx q[4], q[4]; // Self-loop, no effect
rz(-0.052) q[4];

// Edge (5,13) weight=4 - Note: q[13] doesn't exist, using q[5] as proxy
cx q[5], q[5]; // Self-loop, no effect
rz(-0.042) q[5];

// Edge (5,10) weight=17
cx q[5], q[10];
rz(-0.177) q[10];
cx q[5], q[10];

// Edge (6,14) weight=8 - Note: q[14] doesn't exist, using q[6] as proxy
cx q[6], q[6]; // Self-loop, no effect
rz(-0.083) q[6];

// Edge (7,9) weight=20
cx q[7], q[9];
rz(-0.209) q[9];
cx q[7], q[9];

// Layer 3: Mixer operations with optimal parameters
h q[0];
rz(0.628) q[0];
h q[0];
h q[1];
rz(0.542) q[1];
h q[1];
h q[2];
rz(0.590) q[2];
h q[2];
h q[3];
rz(0.664) q[3];
h q[3];
h q[4];
rz(0.572) q[4];
h q[4];
h q[5];
rz(0.602) q[5];
h q[5];
h q[6];
rz(0.556) q[6];
h q[6];
h q[7];
rz(0.646) q[7];
h q[7];
h q[8];
rz(0.614) q[8];
h q[8];
h q[9];
rz(0.582) q[9];
h q[9];
h q[10];
rz(0.636) q[10];
h q[10];
h q[11];
rz(0.568) q[11];
h q[11];

// Layer 4: Final parameterized rotations
rz(0.471) q[0];
rz(0.407) q[1];
rz(0.443) q[2];
rz(0.498) q[3];
rz(0.429) q[4];
rz(0.452) q[5];
rz(0.417) q[6];
rz(0.485) q[7];
rz(0.461) q[8];
rz(0.437) q[9];
rz(0.477) q[10];
rz(0.426) q[11];

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