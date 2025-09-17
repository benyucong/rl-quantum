OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
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
// Apply cost Hamiltonian for hyperedge [9,4,7]
ccx q[9], q[4], q[7];
rz(0.2145) q[7];
ccx q[9], q[4], q[7];
// Apply cost Hamiltonian for hyperedge [9,3,6,1]
ccx q[9], q[3], q[6];
ccx q[6], q[1], q[0];
rz(0.1832) q[0];
ccx q[6], q[1], q[0];
ccx q[9], q[3], q[6];
// Apply cost Hamiltonian for hyperedge [8,1,4,9]
ccx q[8], q[1], q[4];
ccx q[4], q[9], q[0];
rz(0.1987) q[0];
ccx q[4], q[9], q[0];
ccx q[8], q[1], q[4];
// Apply cost Hamiltonian for hyperedge [8,2,3,5]
ccx q[8], q[2], q[3];
ccx q[3], q[5], q[0];
rz(0.1765) q[0];
ccx q[3], q[5], q[0];
ccx q[8], q[2], q[3];
// Apply cost Hamiltonian for hyperedge [1,4,5,7]
ccx q[1], q[4], q[5];
ccx q[5], q[7], q[0];
rz(0.1923) q[0];
ccx q[5], q[7], q[0];
ccx q[1], q[4], q[5];
// Apply cost Hamiltonian for hyperedge [8,0,3,1]
ccx q[8], q[0], q[3];
ccx q[3], q[1], q[2];
rz(0.2056) q[2];
ccx q[3], q[1], q[2];
ccx q[8], q[0], q[3];
// Apply cost Hamiltonian for hyperedge [8,0,2,5]
ccx q[8], q[0], q[2];
ccx q[2], q[5], q[1];
rz(0.1894) q[1];
ccx q[2], q[5], q[1];
ccx q[8], q[0], q[2];
// Apply cost Hamiltonian for hyperedge [8,1,4,7]
ccx q[8], q[1], q[4];
ccx q[4], q[7], q[0];
rz(0.2018) q[0];
ccx q[4], q[7], q[0];
ccx q[8], q[1], q[4];
// Apply cost Hamiltonian for hyperedge [0,7]
cx q[0], q[7];
rz(0.1256) q[7];
cx q[0], q[7];
// Apply cost Hamiltonian for hyperedge [1,2,3]
ccx q[1], q[2], q[3];
rz(0.1678) q[3];
ccx q[1], q[2], q[3];
// Apply cost Hamiltonian for hyperedge [9,5]
cx q[9], q[5];
rz(0.1189) q[5];
cx q[9], q[5];
// Apply cost Hamiltonian for hyperedge [8,1,2,6]
ccx q[8], q[1], q[2];
ccx q[2], q[6], q[0];
rz(0.1942) q[0];
ccx q[2], q[6], q[0];
ccx q[8], q[1], q[2];
// Apply cost Hamiltonian for hyperedge [8,0,4,1]
ccx q[8], q[0], q[4];
ccx q[4], q[1], q[2];
rz(0.2071) q[2];
ccx q[4], q[1], q[2];
ccx q[8], q[0], q[4];
// Apply cost Hamiltonian for hyperedge [2,3,4,6,7]
ccx q[2], q[3], q[4];
ccx q[4], q[6], q[7];
rz(0.2315) q[7];
ccx q[4], q[6], q[7];
ccx q[2], q[3], q[4];
// Apply cost Hamiltonian for hyperedge [9,6,7]
ccx q[9], q[6], q[7];
rz(0.1783) q[7];
ccx q[9], q[6], q[7];
// Apply cost Hamiltonian for hyperedge [0,1,5,6]
ccx q[0], q[1], q[5];
ccx q[5], q[6], q[2];
rz(0.2029) q[2];
ccx q[5], q[6], q[2];
ccx q[0], q[1], q[5];
// Apply cost Hamiltonian for hyperedge [9,3,4]
ccx q[9], q[3], q[4];
rz(0.1654) q[4];
ccx q[9], q[3], q[4];
// Apply mixer Hamiltonian
h q[0];
rz(0.4287) q[0];
h q[0];
h q[1];
rz(0.4287) q[1];
h q[1];
h q[2];
rz(0.4287) q[2];
h q[2];
h q[3];
rz(0.4287) q[3];
h q[3];
h q[4];
rz(0.4287) q[4];
h q[4];
h q[5];
rz(0.4287) q[5];
h q[5];
h q[6];
rz(0.4287) q[6];
h q[6];
h q[7];
rz(0.4287) q[7];
h q[7];
h q[8];
rz(0.4287) q[8];
h q[8];
h q[9];
rz(0.4287) q[9];
h q[9];
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