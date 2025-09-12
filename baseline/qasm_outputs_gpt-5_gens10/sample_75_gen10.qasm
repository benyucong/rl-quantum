OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
cx q[0], q[2]; // edge 0 -> 2 (capacity 5)
cx q[0], q[5]; // edge 0 -> 5 (capacity 3)
cx q[0], q[6]; // edge 0 -> 6 (capacity 4)
cx q[0], q[7]; // edge 0 -> 7 (capacity 3)
cx q[1], q[2]; // edge 1 -> 2 (capacity 4)
cx q[1], q[3]; // edge 1 -> 3 (capacity 2)
cx q[1], q[4]; // edge 1 -> 4 (capacity 5)
cx q[1], q[5]; // edge 1 -> 5 (capacity 4)
cx q[1], q[6]; // edge 1 -> 6 (capacity 4)
cx q[2], q[6]; // edge 2 -> 6 (capacity 4)
cx q[3], q[4]; // edge 3 -> 4 (capacity 2)
cx q[3], q[5]; // edge 3 -> 5 (capacity 3)
cx q[5], q[1]; // edge 5 -> 1 (capacity 5)
cx q[5], q[2]; // edge 5 -> 2 (capacity 5)
cx q[5], q[4]; // edge 5 -> 4 (capacity 2)
cx q[6], q[2]; // edge 6 -> 2 (capacity 5)
cx q[6], q[4]; // edge 6 -> 4 (capacity 3)
cx q[6], q[5]; // edge 6 -> 5 (capacity 1)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];