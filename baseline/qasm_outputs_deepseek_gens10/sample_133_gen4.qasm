OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
// Layer 1 - Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Layer 1 - Problem Hamiltonian (edges)
// Edge (0,3)
cx q[0], q[3];
rz(0.214) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.198) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.205) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.192) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.207) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.201) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.209) q[6];
cx q[4], q[6];
// Layer 1 - Mixing Hamiltonian
rx(0.523) q[0];
rx(0.518) q[1];
rx(0.521) q[2];
rx(0.525) q[3];
rx(0.520) q[4];
rx(0.517) q[5];
rx(0.524) q[6];
// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.312) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.298) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.305) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.292) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.307) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.301) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.309) q[6];
cx q[4], q[6];
// Layer 2 - Mixing Hamiltonian
rx(0.428) q[0];
rx(0.423) q[1];
rx(0.426) q[2];
rx(0.430) q[3];
rx(0.425) q[4];
rx(0.422) q[5];
rx(0.429) q[6];
// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.418) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.402) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.410) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.397) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.412) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.406) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.414) q[6];
cx q[4], q[6];
// Layer 3 - Mixing Hamiltonian
rx(0.328) q[0];
rx(0.323) q[1];
rx(0.326) q[2];
rx(0.330) q[3];
rx(0.325) q[4];
rx(0.322) q[5];
rx(0.329) q[6];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];