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

// Layer 1 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.2145) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2231) q[5];
cx q[0], q[5];
// Edge (0,7)
cx q[0], q[7];
rz(0.2056) q[7];
cx q[0], q[7];
// Edge (1,4)
cx q[1], q[4];
rz(0.1923) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2189) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.2014) q[7];
cx q[1], q[7];
// Edge (1,8)
cx q[1], q[8];
rz(0.1897) q[8];
cx q[1], q[8];
// Edge (2,4)
cx q[2], q[4];
rz(0.1865) q[4];
cx q[2], q[4];
// Edge (2,7)
cx q[2], q[7];
rz(0.1972) q[7];
cx q[2], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.2218) q[5];
cx q[3], q[5];
// Edge (3,7)
cx q[3], q[7];
rz(0.2083) q[7];
cx q[3], q[7];
// Edge (4,6)
cx q[4], q[6];
rz(0.1841) q[6];
cx q[4], q[6];
// Edge (4,8)
cx q[4], q[8];
rz(0.1916) q[8];
cx q[4], q[8];
// Edge (5,7)
cx q[5], q[7];
rz(0.2157) q[7];
cx q[5], q[7];
// Edge (6,8)
cx q[6], q[8];
rz(0.1829) q[8];
cx q[6], q[8];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4321) q[0];
h q[0];
h q[1];
rz(0.4287) q[1];
h q[1];
h q[2];
rz(0.4265) q[2];
h q[2];
h q[3];
rz(0.4318) q[3];
h q[3];
h q[4];
rz(0.4293) q[4];
h q[4];
h q[5];
rz(0.4336) q[5];
h q[5];
h q[6];
rz(0.4258) q[6];
h q[6];
h q[7];
rz(0.4329) q[7];
h q[7];
h q[8];
rz(0.4274) q[8];
h q[8];

// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.4123) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.3982) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.4187) q[5];
cx q[0], q[5];
// Edge (0,7)
cx q[0], q[7];
rz(0.4051) q[7];
cx q[0], q[7];
// Edge (1,4)
cx q[1], q[4];
rz(0.3946) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.4162) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.4028) q[7];
cx q[1], q[7];
// Edge (1,8)
cx q[1], q[8];
rz(0.3921) q[8];
cx q[1], q[8];
// Edge (2,4)
cx q[2], q[4];
rz(0.3897) q[4];
cx q[2], q[4];
// Edge (2,7)
cx q[2], q[7];
rz(0.3974) q[7];
cx q[2], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.4179) q[5];
cx q[3], q[5];
// Edge (3,7)
cx q[3], q[7];
rz(0.4086) q[7];
cx q[3], q[7];
// Edge (4,6)
cx q[4], q[6];
rz(0.3872) q[6];
cx q[4], q[6];
// Edge (4,8)
cx q[4], q[8];
rz(0.3935) q[8];
cx q[4], q[8];
// Edge (5,7)
cx q[5], q[7];
rz(0.4138) q[7];
cx q[5], q[7];
// Edge (6,8)
cx q[6], q[8];
rz(0.3859) q[8];
cx q[6], q[8];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.6543) q[0];
h q[0];
h q[1];
rz(0.6498) q[1];
h q[1];
h q[2];
rz(0.6472) q[2];
h q[2];
h q[3];
rz(0.6531) q[3];
h q[3];
h q[4];
rz(0.6504) q[4];
h q[4];
h q[5];
rz(0.6557) q[5];
h q[5];
h q[6];
rz(0.6463) q[6];
h q[6];
h q[7];
rz(0.6548) q[7];
h q[7];
h q[8];
rz(0.6486) q[8];
h q[8];

// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.6124) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.5987) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.6189) q[5];
cx q[0], q[5];
// Edge (0,7)
cx q[0], q[7];
rz(0.6053) q[7];
cx q[0], q[7];
// Edge (1,4)
cx q[1], q[4];
rz(0.5948) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.6165) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.6031) q[7];
cx q[1], q[7];
// Edge (1,8)
cx q[1], q[8];
rz(0.5924) q[8];
cx q[1], q[8];
// Edge (2,4)
cx q[2], q[4];
rz(0.5899) q[4];
cx q[2], q[4];
// Edge (2,7)
cx q[2], q[7];
rz(0.5976) q[7];
cx q[2], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.6182) q[5];
cx q[3], q[5];
// Edge (3,7)
cx q[3], q[7];
rz(0.6089) q[7];
cx q[3], q[7];
// Edge (4,6)
cx q[4], q[6];
rz(0.5874) q[6];
cx q[4], q[6];
// Edge (4,8)
cx q[4], q[8];
rz(0.5938) q[8];
cx q[4], q[8];
// Edge (5,7)
cx q[5], q[7];
rz(0.6141) q[7];
cx q[5], q[7];
// Edge (6,8)
cx q[6], q[8];
rz(0.5862) q[8];
cx q[6], q[8];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.8765) q[0];
h q[0];
h q[1];
rz(0.8712) q[1];
h q[1];
h q[2];
rz(0.8684) q[2];
h q[2];
h q[3];
rz(0.8753) q[3];
h q[3];
h q[4];
rz(0.8721) q[4];
h q[4];
h q[5];
rz(0.8779) q[5];
h q[5];
h q[6];
rz(0.8676) q[6];
h q[6];
h q[7];
rz(0.8768) q[7];
h q[7];
h q[8];
rz(0.8698) q[8];
h q[8];

// Layer 4 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.8126) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.7989) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.8192) q[5];
cx q[0], q[5];
// Edge (0,7)
cx q[0], q[7];
rz(0.8056) q[7];
cx q[0], q[7];
// Edge (1,4)
cx q[1], q[4];
rz(0.7951) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.8168) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.8034) q[7];
cx q[1], q[7];
// Edge (1,8)
cx q[1], q[8];
rz(0.7927) q[8];
cx q[1], q[8];
// Edge (2,4)
cx q[2], q[4];
rz(0.7902) q[4];
cx q[2], q[4];
// Edge (2,7)
cx q[2], q[7];
rz(0.7979) q[7];
cx q[2], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.8185) q[5];
cx q[3], q[5];
// Edge (3,7)
cx q[3], q[7];
rz(0.8092) q[7];
cx q[3], q[7];
// Edge (4,6)
cx q[4], q[6];
rz(0.7877) q[6];
cx q[4], q[6];
// Edge (4,8)
cx q[4], q[8];
rz(0.7941) q[8];
cx q[4], q[8];
// Edge (5,7)
cx q[5], q[7];
rz(0.8144) q[7];
cx q[5], q[7];
// Edge (6,8)
cx q[6], q[8];
rz(0.7865) q[8];
cx q[6], q[8];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];