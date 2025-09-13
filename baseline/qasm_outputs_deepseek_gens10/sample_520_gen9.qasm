OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

// Edge interactions based on capacities (Layer 1)
rz(0.214) q[3];
rz(0.071) q[4];
rz(0.286) q[5];
rz(0.143) q[2];
rz(0.214) q[5];
rz(0.071) q[6];
rz(0.071) q[5];
rz(0.143) q[9];
rz(0.286) q[2];
rz(0.143) q[3];
rz(0.071) q[7];
rz(0.071) q[2];
rz(0.286) q[1];
rz(0.357) q[2];
rz(0.071) q[1];
rz(0.214) q[4];
rz(0.286) q[5];
rz(0.286) q[4];
rz(0.143) q[6];
rz(0.429) q[7];

// Layer 2: Mixer and optimization
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

// Second layer of edge interactions
rz(0.192) q[3];
rz(0.064) q[4];
rz(0.257) q[5];
rz(0.129) q[2];
rz(0.192) q[5];
rz(0.064) q[6];
rz(0.064) q[5];
rz(0.129) q[9];
rz(0.257) q[2];
rz(0.129) q[3];
rz(0.064) q[7];
rz(0.064) q[2];
rz(0.257) q[1];
rz(0.321) q[2];
rz(0.064) q[1];
rz(0.192) q[4];
rz(0.257) q[5];
rz(0.257) q[4];
rz(0.129) q[6];
rz(0.386) q[7];

// Final measurements
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