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
rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2256) q[2];
rz(0.2031) q[3];
rz(0.1923) q[4];
rz(0.2089) q[5];
rz(0.2217) q[6];
rz(0.1975) q[7];
rz(0.2132) q[8];
rz(0.2068) q[9];
rz(0.2194) q[10];
// Layer 1: Problem Hamiltonian (edge constraints)
// Edge 0-4
cx q[0], q[4];
rz(0.0873) q[4];
cx q[0], q[4];
// Edge 0-5
cx q[0], q[5];
rz(0.0912) q[5];
cx q[0], q[5];
// Edge 1-2
cx q[1], q[2];
rz(0.0856) q[2];
cx q[1], q[2];
// Edge 1-3
cx q[1], q[3];
rz(0.0839) q[3];
cx q[1], q[3];
// Edge 2-3
cx q[2], q[3];
rz(0.0794) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.0827) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.0881) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.0865) q[6];
cx q[2], q[6];
// Edge 3-4
cx q[3], q[4];
rz(0.0812) q[4];
cx q[3], q[4];
// Edge 3-5
cx q[3], q[5];
rz(0.0849) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.0803) q[6];
cx q[3], q[6];
// Layer 2: Mixer Hamiltonian
h q[0];
rz(0.4327) q[0];
h q[0];
h q[1];
rz(0.4189) q[1];
h q[1];
h q[2];
rz(0.4452) q[2];
h q[2];
h q[3];
rz(0.4216) q[3];
h q[3];
h q[4];
rz(0.4098) q[4];
h q[4];
h q[5];
rz(0.4371) q[5];
h q[5];
h q[6];
rz(0.4483) q[6];
h q[6];
h q[7];
rz(0.4162) q[7];
h q[7];
h q[8];
rz(0.4319) q[8];
h q[8];
h q[9];
rz(0.4254) q[9];
h q[9];
h q[10];
rz(0.4387) q[10];
h q[10];
// Layer 2: Problem Hamiltonian
// Edge 0-4
cx q[0], q[4];
rz(0.1759) q[4];
cx q[0], q[4];
// Edge 0-5
cx q[0], q[5];
rz(0.1824) q[5];
cx q[0], q[5];
// Edge 1-2
cx q[1], q[2];
rz(0.1712) q[2];
cx q[1], q[2];
// Edge 1-3
cx q[1], q[3];
rz(0.1678) q[3];
cx q[1], q[3];
// Edge 2-3
cx q[2], q[3];
rz(0.1588) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.1654) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.1762) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.1730) q[6];
cx q[2], q[6];
// Edge 3-4
cx q[3], q[4];
rz(0.1624) q[4];
cx q[3], q[4];
// Edge 3-5
cx q[3], q[5];
rz(0.1698) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.1606) q[6];
cx q[3], q[6];
// Layer 3: Mixer Hamiltonian
h q[0];
rz(0.6518) q[0];
h q[0];
h q[1];
rz(0.6284) q[1];
h q[1];
h q[2];
rz(0.6678) q[2];
h q[2];
h q[3];
rz(0.6324) q[3];
h q[3];
h q[4];
rz(0.6147) q[4];
h q[4];
h q[5];
rz(0.6557) q[5];
h q[5];
h q[6];
rz(0.6725) q[6];
h q[6];
h q[7];
rz(0.6243) q[7];
h q[7];
h q[8];
rz(0.6479) q[8];
h q[8];
h q[9];
rz(0.6381) q[9];
h q[9];
h q[10];
rz(0.6581) q[10];
h q[10];
// Layer 3: Problem Hamiltonian
// Edge 0-4
cx q[0], q[4];
rz(0.2638) q[4];
cx q[0], q[4];
// Edge 0-5
cx q[0], q[5];
rz(0.2736) q[5];
cx q[0], q[5];
// Edge 1-2
cx q[1], q[2];
rz(0.2568) q[2];
cx q[1], q[2];
// Edge 1-3
cx q[1], q[3];
rz(0.2517) q[3];
cx q[1], q[3];
// Edge 2-3
cx q[2], q[3];
rz(0.2382) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.2481) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.2643) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.2595) q[6];
cx q[2], q[6];
// Edge 3-4
cx q[3], q[4];
rz(0.2436) q[4];
cx q[3], q[4];
// Edge 3-5
cx q[3], q[5];
rz(0.2547) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.2409) q[6];
cx q[3], q[6];
// Final measurement
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