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

// First QAOA layer - Mixer Hamiltonian
rz(0.2145) q[0];
rz(0.1983) q[1];
rz(0.1762) q[2];
rz(0.2251) q[3];
rz(0.1927) q[4];
rz(0.2089) q[5];
rz(0.1843) q[6];
rz(0.2016) q[7];
rz(0.2198) q[8];

// First QAOA layer - Problem Hamiltonian
// Edge 0-1 (capacity 2)
cx q[0], q[1];
rz(0.1257) q[1];
cx q[0], q[1];
// Edge 0-5 (capacity 2)
cx q[0], q[5];
rz(0.1257) q[5];
cx q[0], q[5];
// Edge 0-6 (capacity 1)
cx q[0], q[6];
rz(0.0628) q[6];
cx q[0], q[6];
// Edge 1-3 (capacity 2)
cx q[1], q[3];
rz(0.1257) q[3];
cx q[1], q[3];
// Edge 1-5 (capacity 4)
cx q[1], q[5];
rz(0.2513) q[5];
cx q[1], q[5];
// Edge 2-4 (capacity 3)
cx q[2], q[4];
rz(0.1885) q[4];
cx q[2], q[4];
// Edge 3-5 (capacity 2)
cx q[3], q[5];
rz(0.1257) q[5];
cx q[3], q[5];
// Edge 3-6 (capacity 4)
cx q[3], q[6];
rz(0.2513) q[6];
cx q[3], q[6];
// Edge 3-7 (capacity 2)
cx q[3], q[7];
rz(0.1257) q[7];
cx q[3], q[7];
// Edge 4-2 (capacity 2)
cx q[4], q[2];
rz(0.1257) q[2];
cx q[4], q[2];
// Edge 4-3 (capacity 4)
cx q[4], q[3];
rz(0.2513) q[3];
cx q[4], q[3];
// Edge 4-5 (capacity 2)
cx q[4], q[5];
rz(0.1257) q[5];
cx q[4], q[5];
// Edge 4-7 (capacity 3)
cx q[4], q[7];
rz(0.1885) q[7];
cx q[4], q[7];
// Edge 5-4 (capacity 2)
cx q[5], q[4];
rz(0.1257) q[4];
cx q[5], q[4];
// Edge 6-2 (capacity 3)
cx q[6], q[2];
rz(0.1885) q[2];
cx q[6], q[2];
// Edge 6-5 (capacity 2)
cx q[6], q[5];
rz(0.1257) q[5];
cx q[6], q[5];
// Edge 6-8 (capacity 3)
cx q[6], q[8];
rz(0.1885) q[8];
cx q[6], q[8];

// Second QAOA layer - Mixer Hamiltonian
rz(0.1987) q[0];
rz(0.1842) q[1];
rz(0.1635) q[2];
rz(0.2089) q[3];
rz(0.1786) q[4];
rz(0.1937) q[5];
rz(0.1709) q[6];
rz(0.1869) q[7];
rz(0.2038) q[8];

// Second QAOA layer - Problem Hamiltonian
// Edge 0-1 (capacity 2)
cx q[0], q[1];
rz(0.1165) q[1];
cx q[0], q[1];
// Edge 0-5 (capacity 2)
cx q[0], q[5];
rz(0.1165) q[5];
cx q[0], q[5];
// Edge 0-6 (capacity 1)
cx q[0], q[6];
rz(0.0582) q[6];
cx q[0], q[6];
// Edge 1-3 (capacity 2)
cx q[1], q[3];
rz(0.1165) q[3];
cx q[1], q[3];
// Edge 1-5 (capacity 4)
cx q[1], q[5];
rz(0.2330) q[5];
cx q[1], q[5];
// Edge 2-4 (capacity 3)
cx q[2], q[4];
rz(0.1747) q[4];
cx q[2], q[4];
// Edge 3-5 (capacity 2)
cx q[3], q[5];
rz(0.1165) q[5];
cx q[3], q[5];
// Edge 3-6 (capacity 4)
cx q[3], q[6];
rz(0.2330) q[6];
cx q[3], q[6];
// Edge 3-7 (capacity 2)
cx q[3], q[7];
rz(0.1165) q[7];
cx q[3], q[7];
// Edge 4-2 (capacity 2)
cx q[4], q[2];
rz(0.1165) q[2];
cx q[4], q[2];
// Edge 4-3 (capacity 4)
cx q[4], q[3];
rz(0.2330) q[3];
cx q[4], q[3];
// Edge 4-5 (capacity 2)
cx q[4], q[5];
rz(0.1165) q[5];
cx q[4], q[5];
// Edge 4-7 (capacity 3)
cx q[4], q[7];
rz(0.1747) q[7];
cx q[4], q[7];
// Edge 5-4 (capacity 2)
cx q[5], q[4];
rz(0.1165) q[4];
cx q[5], q[4];
// Edge 6-2 (capacity 3)
cx q[6], q[2];
rz(0.1747) q[2];
cx q[6], q[2];
// Edge 6-5 (capacity 2)
cx q[6], q[5];
rz(0.1165) q[5];
cx q[6], q[5];
// Edge 6-8 (capacity 3)
cx q[6], q[8];
rz(0.1747) q[8];
cx q[6], q[8];

// Third QAOA layer - Mixer Hamiltonian
rz(0.1842) q[0];
rz(0.1708) q[1];
rz(0.1516) q[2];
rz(0.1937) q[3];
rz(0.1656) q[4];
rz(0.1796) q[5];
rz(0.1584) q[6];
rz(0.1733) q[7];
rz(0.1890) q[8];

// Third QAOA layer - Problem Hamiltonian
// Edge 0-1 (capacity 2)
cx q[0], q[1];
rz(0.1080) q[1];
cx q[0], q[1];
// Edge 0-5 (capacity 2)
cx q[0], q[5];
rz(0.1080) q[5];
cx q[0], q[5];
// Edge 0-6 (capacity 1)
cx q[0], q[6];
rz(0.0540) q[6];
cx q[0], q[6];
// Edge 1-3 (capacity 2)
cx q[1], q[3];
rz(0.1080) q[3];
cx q[1], q[3];
// Edge 1-5 (capacity 4)
cx q[1], q[5];
rz(0.2160) q[5];
cx q[1], q[5];
// Edge 2-4 (capacity 3)
cx q[2], q[4];
rz(0.1620) q[4];
cx q[2], q[4];
// Edge 3-5 (capacity 2)
cx q[3], q[5];
rz(0.1080) q[5];
cx q[3], q[5];
// Edge 3-6 (capacity 4)
cx q[3], q[6];
rz(0.2160) q[6];
cx q[3], q[6];
// Edge 3-7 (capacity 2)
cx q[3], q[7];
rz(0.1080) q[7];
cx q[3], q[7];
// Edge 4-2 (capacity 2)
cx q[4], q[2];
rz(0.1080) q[2];
cx q[4], q[2];
// Edge 4-3 (capacity 4)
cx q[4], q[3];
rz(0.2160) q[3];
cx q[4], q[3];
// Edge 4-5 (capacity 2)
cx q[4], q[5];
rz(0.1080) q[5];
cx q[4], q[5];
// Edge 4-7 (capacity 3)
cx q[4], q[7];
rz(0.1620) q[7];
cx q[4], q[7];
// Edge 5-4 (capacity 2)
cx q[5], q[4];
rz(0.1080) q[4];
cx q[5], q[4];
// Edge 6-2 (capacity 3)
cx q[6], q[2];
rz(0.1620) q[2];
cx q[6], q[2];
// Edge 6-5 (capacity 2)
cx q[6], q[5];
rz(0.1080) q[5];
cx q[6], q[5];
// Edge 6-8 (capacity 3)
cx q[6], q[8];
rz(0.1620) q[8];
cx q[6], q[8];

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