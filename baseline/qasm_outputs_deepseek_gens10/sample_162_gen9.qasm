OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Cost Hamiltonian for vertex cover
rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.3123) q[2];
rz(0.4231) q[3];
rz(0.2876) q[4];
rz(0.2564) q[5];
rz(0.2349) q[6];
// Edge constraints
cx q[0], q[2];
rz(0.0873) q[2];
cx q[0], q[2];
cx q[1], q[4];
rz(0.0921) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(0.1056) q[3];
cx q[2], q[3];
cx q[3], q[4];
rz(0.1138) q[4];
cx q[3], q[4];
cx q[3], q[5];
rz(0.0987) q[5];
cx q[3], q[5];
cx q[3], q[6];
rz(0.0942) q[6];
cx q[3], q[6];
cx q[5], q[6];
rz(0.0825) q[6];
cx q[5], q[6];
// Mixer layer 1
rx(0.3562) q[0];
rx(0.3428) q[1];
rx(0.3789) q[2];
rx(0.4012) q[3];
rx(0.3674) q[4];
rx(0.3521) q[5];
rx(0.3456) q[6];
// Layer 2
// Cost Hamiltonian for vertex cover
rz(0.1983) q[0];
rz(0.1842) q[1];
rz(0.2894) q[2];
rz(0.3921) q[3];
rz(0.2667) q[4];
rz(0.2378) q[5];
rz(0.2179) q[6];
// Edge constraints
cx q[0], q[2];
rz(0.0811) q[2];
cx q[0], q[2];
cx q[1], q[4];
rz(0.0854) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(0.0979) q[3];
cx q[2], q[3];
cx q[3], q[4];
rz(0.1056) q[4];
cx q[3], q[4];
cx q[3], q[5];
rz(0.0915) q[5];
cx q[3], q[5];
cx q[3], q[6];
rz(0.0874) q[6];
cx q[3], q[6];
cx q[5], q[6];
rz(0.0765) q[6];
cx q[5], q[6];
// Mixer layer 2
rx(0.3305) q[0];
rx(0.3182) q[1];
rx(0.3514) q[2];
rx(0.3721) q[3];
rx(0.3408) q[4];
rx(0.3267) q[5];
rx(0.3205) q[6];
// Layer 3
// Cost Hamiltonian for vertex cover
rz(0.1839) q[0];
rz(0.1709) q[1];
rz(0.2684) q[2];
rz(0.3637) q[3];
rz(0.2473) q[4];
rz(0.2206) q[5];
rz(0.2021) q[6];
// Edge constraints
cx q[0], q[2];
rz(0.0752) q[2];
cx q[0], q[2];
cx q[1], q[4];
rz(0.0792) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(0.0908) q[3];
cx q[2], q[3];
cx q[3], q[4];
rz(0.0979) q[4];
cx q[3], q[4];
cx q[3], q[5];
rz(0.0849) q[5];
cx q[3], q[5];
cx q[3], q[6];
rz(0.0811) q[6];
cx q[3], q[6];
cx q[5], q[6];
rz(0.0710) q[6];
cx q[5], q[6];
// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];