OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Layer 1: Initialization and first mixing
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
h q[12];
h q[13];

// Capacity constraints phase (Layer 1)
// Edge 0-1 (capacity 1)
rz(0.2145) q[0];
rz(0.2145) q[1];
cx q[0], q[1];
rz(-0.2145) q[1];
cx q[0], q[1];

// Edge 0-2 (capacity 1)
rz(0.1987) q[0];
rz(0.1987) q[2];
cx q[0], q[2];
rz(-0.1987) q[2];
cx q[0], q[2];

// Edge 0-4 (capacity 2)
rz(0.3124) q[0];
rz(0.3124) q[4];
cx q[0], q[4];
rz(-0.3124) q[4];
cx q[0], q[4];

// Edge 1-6 (capacity 1)
rz(0.1876) q[1];
rz(0.1876) q[6];
cx q[1], q[6];
rz(-0.1876) q[6];
cx q[1], q[6];

// Edge 2-1 (capacity 2)
rz(0.2765) q[2];
rz(0.2765) q[1];
cx q[2], q[1];
rz(-0.2765) q[1];
cx q[2], q[1];

// Edge 2-4 (capacity 1)
rz(0.2031) q[2];
rz(0.2031) q[4];
cx q[2], q[4];
rz(-0.2031) q[4];
cx q[2], q[4];

// Edge 3-5 (capacity 1)
rz(0.1923) q[3];
rz(0.1923) q[5];
cx q[3], q[5];
rz(-0.1923) q[5];
cx q[3], q[5];

// Edge 4-2 (capacity 2)
rz(0.2897) q[4];
rz(0.2897) q[2];
cx q[4], q[2];
rz(-0.2897) q[2];
cx q[4], q[2];

// Edge 4-6 (capacity 1)
rz(0.2056) q[4];
rz(0.2056) q[6];
cx q[4], q[6];
rz(-0.2056) q[6];
cx q[4], q[6];

// Edge 5-1 (capacity 1)
rz(0.1982) q[5];
rz(0.1982) q[1];
cx q[5], q[1];
rz(-0.1982) q[1];
cx q[5], q[1];

// Edge 5-3 (capacity 1)
rz(0.1849) q[5];
rz(0.1849) q[3];
cx q[5], q[3];
rz(-0.1849) q[3];
cx q[5], q[3];

// Layer 2: Mixing and flow conservation
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
h q[12];
h q[13];

// Flow conservation constraints (Layer 2)
// Node 0 (source)
rz(0.4231) q[0];
rz(0.4231) q[1];
rz(0.4231) q[2];
rz(0.4231) q[4];
cx q[0], q[7];
cx q[1], q[7];
cx q[2], q[7];
cx q[4], q[7];
rz(-0.4231) q[7];
cx q[4], q[7];
cx q[2], q[7];
cx q[1], q[7];
cx q[0], q[7];

// Node 6 (sink)
rz(0.3987) q[1];
rz(0.3987) q[4];
rz(0.3987) q[6];
cx q[1], q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(-0.3987) q[8];
cx q[6], q[8];
cx q[4], q[8];
cx q[1], q[8];

// Intermediate nodes conservation
// Node 1
rz(0.3562) q[0];
rz(0.3562) q[2];
rz(0.3562) q[5];
rz(0.3562) q[6];
cx q[0], q[9];
cx q[2], q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(-0.3562) q[9];
cx q[6], q[9];
cx q[5], q[9];
cx q[2], q[9];
cx q[0], q[9];

// Node 2
rz(0.3418) q[0];
rz(0.3418) q[4];
rz(0.3418) q[1];
cx q[0], q[10];
cx q[4], q[10];
cx q[1], q[10];
rz(-0.3418) q[10];
cx q[1], q[10];
cx q[4], q[10];
cx q[0], q[10];

// Node 4
rz(0.3679) q[0];
rz(0.3679) q[2];
rz(0.3679) q[6];
cx q[0], q[11];
cx q[2], q[11];
cx q[6], q[11];
rz(-0.3679) q[11];
cx q[6], q[11];
cx q[2], q[11];
cx q[0], q[11];

// Node 3 and 5 (isolated components)
rz(0.2894) q[3];
rz(0.2894) q[5];
cx q[3], q[12];
cx q[5], q[12];
rz(-0.2894) q[12];
cx q[5], q[12];
cx q[3], q[12];

// Layer 3: Final mixing and measurement preparation
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
h q[12];
h q[13];

// Final optimization phase (Layer 3)
rz(0.1567) q[0];
rz(0.1423) q[1];
rz(0.1389) q[2];
rz(0.0912) q[3];
rz(0.1678) q[4];
rz(0.1034) q[5];
rz(0.1245) q[6];
rz(0.0789) q[7];
rz(0.0821) q[8];
rz(0.0678) q[9];
rz(0.0734) q[10];
rz(0.0691) q[11];
rz(0.0456) q[12];
rz(0.0512) q[13];

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
c[12] = measure q[12];
c[13] = measure q[13];