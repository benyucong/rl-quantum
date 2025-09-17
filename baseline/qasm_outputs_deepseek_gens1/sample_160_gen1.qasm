OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initial Hadamard and problem encoding
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

// Edge interactions based on bipartite graph weights
// Edge (0,8): weight 5
rz(0.0785) q[0];
rz(0.0785) q[8];
cx q[0], q[8];
rz(-0.0785) q[8];
cx q[0], q[8];

// Edge (0,12): weight 16 (encoded on q[0] and q[4] since 12-8=4)
rz(0.2513) q[0];
rz(0.2513) q[4];
cx q[0], q[4];
rz(-0.2513) q[4];
cx q[0], q[4];

// Edge (1,9): weight 6
rz(0.0942) q[1];
rz(0.0942) q[9];
cx q[1], q[9];
rz(-0.0942) q[9];
cx q[1], q[9];

// Edge (2,10): weight 6
rz(0.0942) q[2];
rz(0.0942) q[10];
cx q[2], q[10];
rz(-0.0942) q[10];
cx q[2], q[10];

// Edge (3,11): weight 7
rz(0.1099) q[3];
rz(0.1099) q[11];
cx q[3], q[11];
rz(-0.1099) q[11];
cx q[3], q[11];

// Edge (3,14): weight 20 (encoded on q[3] and q[6] since 14-8=6)
rz(0.3142) q[3];
rz(0.3142) q[6];
cx q[3], q[6];
rz(-0.3142) q[6];
cx q[3], q[6];

// Edge (3,12): weight 18 (encoded on q[3] and q[4] since 12-8=4)
rz(0.2827) q[3];
rz(0.2827) q[4];
cx q[3], q[4];
rz(-0.2827) q[4];
cx q[3], q[4];

// Edge (4,12): weight 5 (encoded on q[4] and q[4] - self interaction)
rz(0.0785) q[4];

// Edge (5,13): weight 4
rz(0.0628) q[5];
rz(0.0628) q[13-8]; // q[5]
cx q[5], q[5];
rz(-0.0628) q[5];
cx q[5], q[5];

// Edge (5,10): weight 17
rz(0.2670) q[5];
rz(0.2670) q[10];
cx q[5], q[10];
rz(-0.2670) q[10];
cx q[5], q[10];

// Edge (6,14): weight 8 (encoded on q[6] and q[6] since 14-8=6)
rz(0.1257) q[6];

// Edge (7,9): weight 20
rz(0.3142) q[7];
rz(0.3142) q[9];
cx q[7], q[9];
rz(-0.3142) q[9];
cx q[7], q[9];

// Layer 2: Mixing and optimization
h q[0];
rz(0.1571) q[0];
h q[0];
h q[1];
rz(0.1571) q[1];
h q[1];
h q[2];
rz(0.1571) q[2];
h q[2];
h q[3];
rz(0.1571) q[3];
h q[3];
h q[4];
rz(0.1571) q[4];
h q[4];
h q[5];
rz(0.1571) q[5];
h q[5];
h q[6];
rz(0.1571) q[6];
h q[6];
h q[7];
rz(0.1571) q[7];
h q[7];
h q[8];
rz(0.1571) q[8];
h q[8];
h q[9];
rz(0.1571) q[9];
h q[9];
h q[10];
rz(0.1571) q[10];
h q[10];
h q[11];
rz(0.1571) q[11];
h q[11];

// Layer 3: Repeat problem Hamiltonian with optimized parameters
// Edge interactions with optimized weights
rz(0.0854) q[0];
rz(0.0854) q[8];
cx q[0], q[8];
rz(-0.0854) q[8];
cx q[0], q[8];

rz(0.2732) q[0];
rz(0.2732) q[4];
cx q[0], q[4];
rz(-0.2732) q[4];
cx q[0], q[4];

rz(0.1025) q[1];
rz(0.1025) q[9];
cx q[1], q[9];
rz(-0.1025) q[9];
cx q[1], q[9];

rz(0.1025) q[2];
rz(0.1025) q[10];
cx q[2], q[10];
rz(-0.1025) q[10];
cx q[2], q[10];

rz(0.1196) q[3];
rz(0.1196) q[11];
cx q[3], q[11];
rz(-0.1196) q[11];
cx q[3], q[11];

rz(0.3419) q[3];
rz(0.3419) q[6];
cx q[3], q[6];
rz(-0.3419) q[6];
cx q[3], q[6];

rz(0.3075) q[3];
rz(0.3075) q[4];
cx q[3], q[4];
rz(-0.3075) q[4];
cx q[3], q[4];

rz(0.0854) q[4];

rz(0.0683) q[5];
rz(0.0683) q[5];
cx q[5], q[5];
rz(-0.0683) q[5];
cx q[5], q[5];

rz(0.2904) q[5];
rz(0.2904) q[10];
cx q[5], q[10];
rz(-0.2904) q[10];
cx q[5], q[10];

rz(0.1367) q[6];

rz(0.3419) q[7];
rz(0.3419) q[9];
cx q[7], q[9];
rz(-0.3419) q[9];
cx q[7], q[9];

// Layer 4: Final mixing and measurement
h q[0];
rz(0.1710) q[0];
h q[0];
h q[1];
rz(0.1710) q[1];
h q[1];
h q[2];
rz(0.1710) q[2];
h q[2];
h q[3];
rz(0.1710) q[3];
h q[3];
h q[4];
rz(0.1710) q[4];
h q[4];
h q[5];
rz(0.1710) q[5];
h q[5];
h q[6];
rz(0.1710) q[6];
h q[6];
h q[7];
rz(0.1710) q[7];
h q[7];
h q[8];
rz(0.1710) q[8];
h q[8];
h q[9];
rz(0.1710) q[9];
h q[9];
h q[10];
rz(0.1710) q[10];
h q[10];
h q[11];
rz(0.1710) q[11];
h q[11];

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