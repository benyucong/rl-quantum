OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard gates
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

// Layer 1: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.2145) q[7];
cx q[1], q[7];

// Edge (0,3)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.1987) q[8];
cx q[3], q[8];

// Edge (0,4)
cx q[0], q[9];
rz(0.2053) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.2053) q[9];
cx q[4], q[9];

// Edge (0,5)
cx q[0], q[10];
rz(0.1921) q[10];
cx q[0], q[10];
cx q[5], q[10];
rz(0.1921) q[10];
cx q[5], q[10];

// Edge (0,6)
cx q[0], q[7];
rz(0.1876) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(0.1876) q[7];
cx q[6], q[7];

// Edge (1,2)
cx q[1], q[8];
rz(0.1763) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(0.1763) q[8];
cx q[2], q[8];

// Edge (1,5)
cx q[1], q[9];
rz(0.2034) q[9];
cx q[1], q[9];
cx q[5], q[9];
rz(0.2034) q[9];
cx q[5], q[9];

// Edge (3,4)
cx q[3], q[10];
rz(0.1892) q[10];
cx q[3], q[10];
cx q[4], q[10];
rz(0.1892) q[10];
cx q[4], q[10];

// Edge (3,5)
cx q[3], q[7];
rz(0.1958) q[7];
cx q[3], q[7];
cx q[5], q[7];
rz(0.1958) q[7];
cx q[5], q[7];

// Edge (4,5)
cx q[4], q[8];
rz(0.2011) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.2011) q[8];
cx q[5], q[8];

// Edge (5,6)
cx q[5], q[9];
rz(0.1829) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.1829) q[9];
cx q[6], q[9];

// Layer 1: Mixing
rz(0.4231) q[0];
rz(0.4231) q[1];
rz(0.4231) q[2];
rz(0.4231) q[3];
rz(0.4231) q[4];
rz(0.4231) q[5];
rz(0.4231) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.4231) q[0];
rz(0.4231) q[1];
rz(0.4231) q[2];
rz(0.4231) q[3];
rz(0.4231) q[4];
rz(0.4231) q[5];
rz(0.4231) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[7];
rz(0.3562) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.3562) q[7];
cx q[1], q[7];

// Edge (0,3)
cx q[0], q[8];
rz(0.3418) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.3418) q[8];
cx q[3], q[8];

// Edge (0,4)
cx q[0], q[9];
rz(0.3487) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.3487) q[9];
cx q[4], q[9];

// Edge (0,5)
cx q[0], q[10];
rz(0.3372) q[10];
cx q[0], q[10];
cx q[5], q[10];
rz(0.3372) q[10];
cx q[5], q[10];

// Edge (0,6)
cx q[0], q[7];
rz(0.3329) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(0.3329) q[7];
cx q[6], q[7];

// Edge (1,2)
cx q[1], q[8];
rz(0.3241) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(0.3241) q[8];
cx q[2], q[8];

// Edge (1,5)
cx q[1], q[9];
rz(0.3528) q[9];
cx q[1], q[9];
cx q[5], q[9];
rz(0.3528) q[9];
cx q[5], q[9];

// Edge (3,4)
cx q[3], q[10];
rz(0.3385) q[10];
cx q[3], q[10];
cx q[4], q[10];
rz(0.3385) q[10];
cx q[4], q[10];

// Edge (3,5)
cx q[3], q[7];
rz(0.3452) q[7];
cx q[3], q[7];
cx q[5], q[7];
rz(0.3452) q[7];
cx q[5], q[7];

// Edge (4,5)
cx q[4], q[8];
rz(0.3498) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.3498) q[8];
cx q[5], q[8];

// Edge (5,6)
cx q[5], q[9];
rz(0.3284) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.3284) q[9];
cx q[6], q[9];

// Layer 2: Mixing
rz(0.5872) q[0];
rz(0.5872) q[1];
rz(0.5872) q[2];
rz(0.5872) q[3];
rz(0.5872) q[4];
rz(0.5872) q[5];
rz(0.5872) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.5872) q[0];
rz(0.5872) q[1];
rz(0.5872) q[2];
rz(0.5872) q[3];
rz(0.5872) q[4];
rz(0.5872) q[5];
rz(0.5872) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 3: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[7];
rz(0.4789) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.4789) q[7];
cx q[1], q[7];

// Edge (0,3)
cx q[0], q[8];
rz(0.4653) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.4653) q[8];
cx q[3], q[8];

// Edge (0,4)
cx q[0], q[9];
rz(0.4721) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.4721) q[9];
cx q[4], q[9];

// Edge (0,5)
cx q[0], q[10];
rz(0.4618) q[10];
cx q[0], q[10];
cx q[5], q[10];
rz(0.4618) q[10];
cx q[5], q[10];

// Edge (0,6)
cx q[0], q[7];
rz(0.4582) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(0.4582) q[7];
cx q[6], q[7];

// Edge (1,2)
cx q[1], q[8];
rz(0.4501) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(0.4501) q[8];
cx q[2], q[8];

// Edge (1,5)
cx q[1], q[9];
rz(0.4772) q[9];
cx q[1], q[9];
cx q[5], q[9];
rz(0.4772) q[9];
cx q[5], q[9];

// Edge (3,4)
cx q[3], q[10];
rz(0.4639) q[10];
cx q[3], q[10];
cx q[4], q[10];
rz(0.4639) q[10];
cx q[4], q[10];

// Edge (3,5)
cx q[3], q[7];
rz(0.4705) q[7];
cx q[3], q[7];
cx q[5], q[7];
rz(0.4705) q[7];
cx q[5], q[7];

// Edge (4,5)
cx q[4], q[8];
rz(0.4749) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.4749) q[8];
cx q[5], q[8];

// Edge (5,6)
cx q[5], q[9];
rz(0.4553) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.4553) q[9];
cx q[6], q[9];

// Layer 3: Mixing
rz(0.7214) q[0];
rz(0.7214) q[1];
rz(0.7214) q[2];
rz(0.7214) q[3];
rz(0.7214) q[4];
rz(0.7214) q[5];
rz(0.7214) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.7214) q[0];
rz(0.7214) q[1];
rz(0.7214) q[2];
rz(0.7214) q[3];
rz(0.7214) q[4];
rz(0.7214) q[5];
rz(0.7214) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 4: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[7];
rz(0.5921) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.5921) q[7];
cx q[1], q[7];

// Edge (0,3)
cx q[0], q[8];
rz(0.5798) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.5798) q[8];
cx q[3], q[8];

// Edge (0,4)
cx q[0], q[9];
rz(0.5863) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.5863) q[9];
cx q[4], q[9];

// Edge (0,5)
cx q[0], q[10];
rz(0.5772) q[10];
cx q[0], q[10];
cx q[5], q[10];
rz(0.5772) q[10];
cx q[5], q[10];

// Edge (0,6)
cx q[0], q[7];
rz(0.5741) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(0.5741) q[7];
cx q[6], q[7];

// Edge (1,2)
cx q[1], q[8];
rz(0.5667) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(0.5667) q[8];
cx q[2], q[8];

// Edge (1,5)
cx q[1], q[9];
rz(0.5928) q[9];
cx q[1], q[9];
cx q[5], q[9];
rz(0.5928) q[9];
cx q[5], q[9];

// Edge (3,4)
cx q[3], q[10];
rz(0.5805) q[10];
cx q[3], q[10];
cx q[4], q[10];
rz(0.5805) q[10];
cx q[4], q[10];

// Edge (3,5)
cx q[3], q[7];
rz(0.5869) q[7];
cx q[3], q[7];
cx q[5], q[7];
rz(0.5869) q[7];
cx q[5], q[7];

// Edge (4,5)
cx q[4], q[8];
rz(0.5911) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.5911) q[8];
cx q[5], q[8];

// Edge (5,6)
cx q[5], q[9];
rz(0.5732) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.5732) q[9];
cx q[6], q[9];

// Layer 4: Mixing
rz(0.8347) q[0];
rz(0.8347) q[1];
rz(0.8347) q[2];
rz(0.8347) q[3];
rz(0.8347) q[4];
rz(0.8347) q[5];
rz(0.8347) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.8347) q[0];
rz(0.8347) q[1];
rz(0.8347) q[2];
rz(0.8347) q[3];
rz(0.8347) q[4];
rz(0.8347) q[5];
rz(0.8347) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

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