OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1 - Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1 - Problem Hamiltonian (edge constraints)
// Edge (0,6)
cx q[0], q[6];
rz(0.2145) q[6];
cx q[0], q[6];

// Edge (1,6)
cx q[1], q[6];
rz(0.1987) q[6];
cx q[1], q[6];

// Edge (1,7)
cx q[1], q[7];
rz(0.1832) q[7];
cx q[1], q[7];

// Edge (1,8)
cx q[1], q[8];
rz(0.1729) q[8];
cx q[1], q[8];

// Edge (2,7)
cx q[2], q[7];
rz(0.2056) q[7];
cx q[2], q[7];

// Edge (3,5)
cx q[3], q[5];
rz(0.1893) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1764) q[5];
cx q[4], q[5];

// Edge (4,7)
cx q[4], q[7];
rz(0.1921) q[7];
cx q[4], q[7];

// Edge (4,8)
cx q[4], q[8];
rz(0.1847) q[8];
cx q[4], q[8];

// Edge (5,6)
cx q[5], q[6];
rz(0.2018) q[6];
cx q[5], q[6];

// Edge (6,8)
cx q[6], q[8];
rz(0.1935) q[8];
cx q[6], q[8];

// Layer 1 - Mixer Hamiltonian
rx(0.3562) q[0];
rx(0.3428) q[1];
rx(0.3679) q[2];
rx(0.3514) q[3];
rx(0.3387) q[4];
rx(0.3452) q[5];
rx(0.3296) q[6];
rx(0.3419) q[7];
rx(0.3354) q[8];

// Layer 2 - Problem Hamiltonian
// Edge (0,6)
cx q[0], q[6];
rz(0.1873) q[6];
cx q[0], q[6];

// Edge (1,6)
cx q[1], q[6];
rz(0.1736) q[6];
cx q[1], q[6];

// Edge (1,7)
cx q[1], q[7];
rz(0.1598) q[7];
cx q[1], q[7];

// Edge (1,8)
cx q[1], q[8];
rz(0.1509) q[8];
cx q[1], q[8];

// Edge (2,7)
cx q[2], q[7];
rz(0.1794) q[7];
cx q[2], q[7];

// Edge (3,5)
cx q[3], q[5];
rz(0.1652) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1539) q[5];
cx q[4], q[5];

// Edge (4,7)
cx q[4], q[7];
rz(0.1676) q[7];
cx q[4], q[7];

// Edge (4,8)
cx q[4], q[8];
rz(0.1612) q[8];
cx q[4], q[8];

// Edge (5,6)
cx q[5], q[6];
rz(0.1761) q[6];
cx q[5], q[6];

// Edge (6,8)
cx q[6], q[8];
rz(0.1689) q[8];
cx q[6], q[8];

// Layer 2 - Mixer Hamiltonian
rx(0.3108) q[0];
rx(0.2991) q[1];
rx(0.3210) q[2];
rx(0.3066) q[3];
rx(0.2955) q[4];
rx(0.3012) q[5];
rx(0.2875) q[6];
rx(0.2983) q[7];
rx(0.2926) q[8];

// Layer 3 - Problem Hamiltonian
// Edge (0,6)
cx q[0], q[6];
rz(0.1634) q[6];
cx q[0], q[6];

// Edge (1,6)
cx q[1], q[6];
rz(0.1515) q[6];
cx q[1], q[6];

// Edge (1,7)
cx q[1], q[7];
rz(0.1394) q[7];
cx q[1], q[7];

// Edge (1,8)
cx q[1], q[8];
rz(0.1316) q[8];
cx q[1], q[8];

// Edge (2,7)
cx q[2], q[7];
rz(0.1565) q[7];
cx q[2], q[7];

// Edge (3,5)
cx q[3], q[5];
rz(0.1441) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1343) q[5];
cx q[4], q[5];

// Edge (4,7)
cx q[4], q[7];
rz(0.1462) q[7];
cx q[4], q[7];

// Edge (4,8)
cx q[4], q[8];
rz(0.1406) q[8];
cx q[4], q[8];

// Edge (5,6)
cx q[5], q[6];
rz(0.1536) q[6];
cx q[5], q[6];

// Edge (6,8)
cx q[6], q[8];
rz(0.1473) q[8];
cx q[6], q[8];

// Layer 3 - Mixer Hamiltonian
rx(0.2711) q[0];
rx(0.2609) q[1];
rx(0.2800) q[2];
rx(0.2674) q[3];
rx(0.2578) q[4];
rx(0.2627) q[5];
rx(0.2508) q[6];
rx(0.2602) q[7];
rx(0.2552) q[8];

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