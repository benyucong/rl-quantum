OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Layer 1 - Initialization and mixing
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
h q[14];
h q[15];

// Layer 1 - Problem Hamiltonian
// Edge 0-1 constraint
cx q[0], q[1];
rz(0.314) q[1];
cx q[0], q[1];

// Edge 1-2 constraint
cx q[1], q[2];
rz(0.219) q[2];
cx q[1], q[2];

// Edge 1-3 constraint
cx q[1], q[3];
rz(0.134) q[3];
cx q[1], q[3];

// Edge 1-4 constraint
cx q[1], q[4];
rz(0.131) q[4];
cx q[1], q[4];

// Edge 2-3 constraint
cx q[2], q[3];
rz(0.349) q[3];
cx q[2], q[3];

// Edge 2-4 constraint
cx q[2], q[4];
rz(0.124) q[4];
cx q[2], q[4];

// Edge 3-4 constraint
cx q[3], q[4];
rz(0.349) q[4];
cx q[3], q[4];

// Edge 4-5 constraint
cx q[4], q[5];
rz(0.392) q[5];
cx q[4], q[5];

// Start and end node constraints
rz(0.785) q[0];  // Start node 0
rz(0.785) q[5];  // End node 5

// Layer 2 - Mixing Hamiltonian
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
h q[14];
h q[15];

// Layer 2 - Problem Hamiltonian
// Edge 0-1 constraint
cx q[0], q[1];
rz(0.628) q[1];
cx q[0], q[1];

// Edge 1-2 constraint
cx q[1], q[2];
rz(0.438) q[2];
cx q[1], q[2];

// Edge 1-3 constraint
cx q[1], q[3];
rz(0.268) q[3];
cx q[1], q[3];

// Edge 1-4 constraint
cx q[1], q[4];
rz(0.262) q[4];
cx q[1], q[4];

// Edge 2-3 constraint
cx q[2], q[3];
rz(0.698) q[3];
cx q[2], q[3];

// Edge 2-4 constraint
cx q[2], q[4];
rz(0.248) q[4];
cx q[2], q[4];

// Edge 3-4 constraint
cx q[3], q[4];
rz(0.698) q[4];
cx q[3], q[4];

// Edge 4-5 constraint
cx q[4], q[5];
rz(0.784) q[5];
cx q[4], q[5];

// Start and end node constraints
rz(1.57) q[0];  // Start node 0
rz(1.57) q[5];  // End node 5

// Layer 3 - Mixing Hamiltonian
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
h q[14];
h q[15];

// Layer 3 - Problem Hamiltonian
// Edge 0-1 constraint
cx q[0], q[1];
rz(0.942) q[1];
cx q[0], q[1];

// Edge 1-2 constraint
cx q[1], q[2];
rz(0.657) q[2];
cx q[1], q[2];

// Edge 1-3 constraint
cx q[1], q[3];
rz(0.402) q[3];
cx q[1], q[3];

// Edge 1-4 constraint
cx q[1], q[4];
rz(0.393) q[4];
cx q[1], q[4];

// Edge 2-3 constraint
cx q[2], q[3];
rz(1.047) q[3];
cx q[2], q[3];

// Edge 2-4 constraint
cx q[2], q[4];
rz(0.372) q[4];
cx q[2], q[4];

// Edge 3-4 constraint
cx q[3], q[4];
rz(1.047) q[4];
cx q[3], q[4];

// Edge 4-5 constraint
cx q[4], q[5];
rz(1.176) q[5];
cx q[4], q[5];

// Start and end node constraints
rz(2.355) q[0];  // Start node 0
rz(2.355) q[5];  // End node 5

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
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];
c[15] = measure q[15];