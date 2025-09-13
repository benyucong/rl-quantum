OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// First layer: mixing Hamiltonian
rz(0.0) q[0];
rz(0.0) q[1];
rz(0.0) q[2];
rz(0.0) q[3];
rz(0.0) q[4];
rz(0.0) q[5];
rz(0.0) q[6];
// First layer: cost Hamiltonian for min-cut
// Edge (0,3) with capacity 6
cx q[0], q[3];
rz(0.942) q[3];
cx q[0], q[3];
// Edge (0,5) with capacity 5
cx q[0], q[5];
rz(0.785) q[5];
cx q[0], q[5];
// Edge (0,6) with capacity 1
cx q[0], q[6];
rz(0.157) q[6];
cx q[0], q[6];
// Edge (1,2) with capacity 7
cx q[1], q[2];
rz(1.099) q[2];
cx q[1], q[2];
// Edge (2,1) with capacity 1
cx q[2], q[1];
rz(0.157) q[1];
cx q[2], q[1];
// Edge (2,3) with capacity 1
cx q[2], q[3];
rz(0.157) q[3];
cx q[2], q[3];
// Edge (4,2) with capacity 3
cx q[4], q[2];
rz(0.471) q[2];
cx q[4], q[2];
// Edge (4,3) with capacity 2
cx q[4], q[3];
rz(0.314) q[3];
cx q[4], q[3];
// Edge (5,1) with capacity 1
cx q[5], q[1];
rz(0.157) q[1];
cx q[5], q[1];
// Edge (5,2) with capacity 2
cx q[5], q[2];
rz(0.314) q[2];
cx q[5], q[2];
// Edge (5,4) with capacity 5
cx q[5], q[4];
rz(0.785) q[4];
cx q[5], q[4];
// Second layer: mixing Hamiltonian
h q[0];
rz(1.571) q[0];
h q[0];
h q[1];
rz(1.571) q[1];
h q[1];
h q[2];
rz(1.571) q[2];
h q[2];
h q[3];
rz(1.571) q[3];
h q[3];
h q[4];
rz(1.571) q[4];
h q[4];
h q[5];
rz(1.571) q[5];
h q[5];
h q[6];
rz(1.571) q[6];
h q[6];
// Second layer: cost Hamiltonian for min-cut
// Edge (0,3) with capacity 6
cx q[0], q[3];
rz(0.942) q[3];
cx q[0], q[3];
// Edge (0,5) with capacity 5
cx q[0], q[5];
rz(0.785) q[5];
cx q[0], q[5];
// Edge (0,6) with capacity 1
cx q[0], q[6];
rz(0.157) q[6];
cx q[0], q[6];
// Edge (1,2) with capacity 7
cx q[1], q[2];
rz(1.099) q[2];
cx q[1], q[2];
// Edge (2,1) with capacity 1
cx q[2], q[1];
rz(0.157) q[1];
cx q[2], q[1];
// Edge (2,3) with capacity 1
cx q[2], q[3];
rz(0.157) q[3];
cx q[2], q[3];
// Edge (4,2) with capacity 3
cx q[4], q[2];
rz(0.471) q[2];
cx q[4], q[2];
// Edge (4,3) with capacity 2
cx q[4], q[3];
rz(0.314) q[3];
cx q[4], q[3];
// Edge (5,1) with capacity 1
cx q[5], q[1];
rz(0.157) q[1];
cx q[5], q[1];
// Edge (5,2) with capacity 2
cx q[5], q[2];
rz(0.314) q[2];
cx q[5], q[2];
// Edge (5,4) with capacity 5
cx q[5], q[4];
rz(0.785) q[4];
cx q[5], q[4];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];