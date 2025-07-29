OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
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

// Problem Hamiltonian (capacity-weighted edges)
// Edge 0-1 (capacity 5)
cx q[0], q[1];
rz(0.314) q[1];
cx q[0], q[1];
// Edge 0-2 (capacity 4)
cx q[0], q[2];
rz(0.251) q[2];
cx q[0], q[2];
// Edge 0-3 (capacity 1)
cx q[0], q[3];
rz(0.063) q[3];
cx q[0], q[3];
// Edge 0-4 (capacity 1)
cx q[0], q[4];
rz(0.063) q[4];
cx q[0], q[4];
// Edge 0-8 (capacity 4)
cx q[0], q[8];
rz(0.251) q[8];
cx q[0], q[8];
// Edge 1-2 (capacity 5)
cx q[1], q[2];
rz(0.314) q[2];
cx q[1], q[2];
// Edge 1-5 (capacity 3)
cx q[1], q[5];
rz(0.188) q[5];
cx q[1], q[5];
// Edge 1-7 (capacity 2)
cx q[1], q[7];
rz(0.126) q[7];
cx q[1], q[7];
// Edge 1-8 (capacity 5)
cx q[1], q[8];
rz(0.314) q[8];
cx q[1], q[8];
// Edge 2-1 (capacity 3)
cx q[2], q[1];
rz(0.188) q[1];
cx q[2], q[1];
// Edge 2-3 (capacity 2)
cx q[2], q[3];
rz(0.126) q[3];
cx q[2], q[3];
// Edge 2-6 (capacity 6)
cx q[2], q[6];
rz(0.377) q[6];
cx q[2], q[6];
// Edge 2-8 (capacity 4)
cx q[2], q[8];
rz(0.251) q[8];
cx q[2], q[8];
// Edge 2-9 (capacity 2)
cx q[2], q[9];
rz(0.126) q[9];
cx q[2], q[9];
// Edge 3-5 (capacity 1)
cx q[3], q[5];
rz(0.063) q[5];
cx q[3], q[5];
// Edge 3-7 (capacity 1)
cx q[3], q[7];
rz(0.063) q[7];
cx q[3], q[7];
// Edge 4-2 (capacity 4)
cx q[4], q[2];
rz(0.251) q[2];
cx q[4], q[2];
// Edge 4-3 (capacity 3)
cx q[4], q[3];
rz(0.188) q[3];
cx q[4], q[3];
// Edge 4-6 (capacity 5)
cx q[4], q[6];
rz(0.314) q[6];
cx q[4], q[6];
// Edge 5-2 (capacity 3)
cx q[5], q[2];
rz(0.188) q[2];
cx q[5], q[2];
// Edge 5-4 (capacity 1)
cx q[5], q[4];
rz(0.063) q[4];
cx q[5], q[4];
// Edge 5-6 (capacity 5)
cx q[5], q[6];
rz(0.314) q[6];
cx q[5], q[6];
// Edge 5-7 (capacity 3)
cx q[5], q[7];
rz(0.188) q[7];
cx q[5], q[7];
// Edge 5-8 (capacity 6)
cx q[5], q[8];
rz(0.377) q[8];
cx q[5], q[8];
// Edge 6-3 (capacity 3)
cx q[6], q[3];
rz(0.188) q[3];
cx q[6], q[3];
// Edge 6-4 (capacity 3)
cx q[6], q[4];
rz(0.188) q[4];
cx q[6], q[4];
// Edge 6-9 (capacity 4)
cx q[6], q[9];
rz(0.251) q[9];
cx q[6], q[9];
// Edge 7-1 (capacity 6)
cx q[7], q[1];
rz(0.377) q[1];
cx q[7], q[1];
// Edge 7-2 (capacity 3)
cx q[7], q[2];
rz(0.188) q[2];
cx q[7], q[2];
// Edge 7-4 (capacity 3)
cx q[7], q[4];
rz(0.188) q[4];
cx q[7], q[4];
// Edge 7-9 (capacity 3)
cx q[7], q[9];
rz(0.188) q[9];
cx q[7], q[9];
// Edge 8-2 (capacity 5)
cx q[8], q[2];
rz(0.314) q[2];
cx q[8], q[2];
// Edge 8-5 (capacity 4)
cx q[8], q[5];
rz(0.251) q[5];
cx q[8], q[5];

// Layer 2-4 (repeating with optimized parameters)
for i in [1, 2, 3] {
    // Mixer Hamiltonian
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
    
    // Problem Hamiltonian with optimized parameters
    cx q[0], q[1];
    rz(0.314/(i+1)) q[1];
    cx q[0], q[1];
    cx q[0], q[2];
    rz(0.251/(i+1)) q[2];
    cx q[0], q[2];
    cx q[2], q[6];
    rz(0.377/(i+1)) q[6];
    cx q[2], q[6];
    cx q[2], q[9];
    rz(0.126/(i+1)) q[9];
    cx q[2], q[9];
    cx q[5], q[8];
    rz(0.377/(i+1)) q[8];
    cx q[5], q[8];
    cx q[6], q[9];
    rz(0.251/(i+1)) q[9];
    cx q[6], q[9];
    cx q[7], q[1];
    rz(0.377/(i+1)) q[1];
    cx q[7], q[1];
}

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