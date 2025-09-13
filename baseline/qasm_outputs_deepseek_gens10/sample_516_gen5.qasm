OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initialization and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem Hamiltonian (edges)
// Edge 0-2
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge 0-3
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];
// Edge 1-2
cx q[1], q[2];
rz(0.2251) q[2];
cx q[1], q[2];
// Edge 1-4
cx q[1], q[4];
rz(0.2318) q[4];
cx q[1], q[4];
// Edge 1-5
cx q[1], q[5];
rz(0.2432) q[5];
cx q[1], q[5];
// Edge 2-4
cx q[2], q[4];
rz(0.2076) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.2193) q[5];
cx q[2], q[5];
// Edge 3-4
cx q[3], q[4];
rz(0.1924) q[4];
cx q[3], q[4];
// Edge 4-5
cx q[4], q[5];
rz(0.2357) q[5];
cx q[4], q[5];
// Edge 5-6
cx q[5], q[6];
rz(0.2289) q[6];
cx q[5], q[6];

// Layer 2 - Mixing Hamiltonian
rx(1.1423) q[0];
rx(1.1567) q[1];
rx(1.1389) q[2];
rx(1.1298) q[3];
rx(1.1672) q[4];
rx(1.1735) q[5];
rx(1.1486) q[6];

// Layer 2 - Problem Hamiltonian (edges)
// Edge 0-2
cx q[0], q[2];
rz(0.2018) q[2];
cx q[0], q[2];
// Edge 0-3
cx q[0], q[3];
rz(0.1872) q[3];
cx q[0], q[3];
// Edge 1-2
cx q[1], q[2];
rz(0.2119) q[2];
cx q[1], q[2];
// Edge 1-4
cx q[1], q[4];
rz(0.2183) q[4];
cx q[1], q[4];
// Edge 1-5
cx q[1], q[5];
rz(0.2291) q[5];
cx q[1], q[5];
// Edge 2-4
cx q[2], q[4];
rz(0.1954) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.2065) q[5];
cx q[2], q[5];
// Edge 3-4
cx q[3], q[4];
rz(0.1812) q[4];
cx q[3], q[4];
// Edge 4-5
cx q[4], q[5];
rz(0.2220) q[5];
cx q[4], q[5];
// Edge 5-6
cx q[5], q[6];
rz(0.2156) q[6];
cx q[5], q[6];

// Layer 3 - Mixing Hamiltonian
rx(1.0897) q[0];
rx(1.1032) q[1];
rx(1.0864) q[2];
rx(1.0783) q[3];
rx(1.1125) q[4];
rx(1.1183) q[5];
rx(1.0958) q[6];

// Layer 3 - Problem Hamiltonian (edges)
// Edge 0-2
cx q[0], q[2];
rz(0.1897) q[2];
cx q[0], q[2];
// Edge 0-3
cx q[0], q[3];
rz(0.1761) q[3];
cx q[0], q[3];
// Edge 1-2
cx q[1], q[2];
rz(0.1993) q[2];
cx q[1], q[2];
// Edge 1-4
cx q[1], q[4];
rz(0.2054) q[4];
cx q[1], q[4];
// Edge 1-5
cx q[1], q[5];
rz(0.2156) q[5];
cx q[1], q[5];
// Edge 2-4
cx q[2], q[4];
rz(0.1839) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.1943) q[5];
cx q[2], q[5];
// Edge 3-4
cx q[3], q[4];
rz(0.1705) q[4];
cx q[3], q[4];
// Edge 4-5
cx q[4], q[5];
rz(0.2089) q[5];
cx q[4], q[5];
// Edge 5-6
cx q[5], q[6];
rz(0.2029) q[6];
cx q[5], q[6];

// Layer 4 - Mixing Hamiltonian
rx(1.0376) q[0];
rx(1.0502) q[1];
rx(1.0344) q[2];
rx(1.0273) q[3];
rx(1.0583) q[4];
rx(1.0636) q[5];
rx(1.0435) q[6];

// Layer 4 - Problem Hamiltonian (edges)
// Edge 0-2
cx q[0], q[2];
rz(0.1782) q[2];
cx q[0], q[2];
// Edge 0-3
cx q[0], q[3];
rz(0.1655) q[3];
cx q[0], q[3];
// Edge 1-2
cx q[1], q[2];
rz(0.1874) q[2];
cx q[1], q[2];
// Edge 1-4
cx q[1], q[4];
rz(0.1932) q[4];
cx q[1], q[4];
// Edge 1-5
cx q[1], q[5];
rz(0.2027) q[5];
cx q[1], q[5];
// Edge 2-4
cx q[2], q[4];
rz(0.1729) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.1827) q[5];
cx q[2], q[5];
// Edge 3-4
cx q[3], q[4];
rz(0.1603) q[4];
cx q[3], q[4];
// Edge 4-5
cx q[4], q[5];
rz(0.1964) q[5];
cx q[4], q[5];
// Edge 5-6
cx q[5], q[6];
rz(0.1908) q[6];
cx q[5], q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];