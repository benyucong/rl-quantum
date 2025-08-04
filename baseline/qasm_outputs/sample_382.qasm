OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
// Initialize superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Apply max flow constraints (source: 0, sink: 5)
// Edge 0->1 (capacity 1)
cx q[0], q[6];
rz(1.0) q[6];
cx q[0], q[6];
// Edge 0->3 (capacity 2)
cx q[0], q[7];
rz(2.0) q[7];
cx q[0], q[7];
// Edge 1->2 (capacity 1)
cx q[1], q[8];
rz(1.0) q[8];
cx q[1], q[8];
// Edge 1->5 (capacity 1)
cx q[1], q[5];
rz(1.0) q[5];
cx q[1], q[5];
// Edge 2->1 (capacity 1)
cx q[2], q[1];
rz(1.0) q[1];
cx q[2], q[1];
// Edge 2->4 (capacity 1)
cx q[2], q[4];
rz(1.0) q[4];
cx q[2], q[4];
// Edge 4->1 (capacity 1)
cx q[4], q[1];
rz(1.0) q[1];
cx q[4], q[1];
// Edge 4->2 (capacity 2)
cx q[4], q[2];
rz(2.0) q[2];
cx q[4], q[2];
// Measure all qubits
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