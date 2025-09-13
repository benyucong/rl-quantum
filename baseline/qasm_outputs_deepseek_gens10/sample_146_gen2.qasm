OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard on all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Problem-specific phase rotations based on edge weights
// Qubits 0-2: left nodes, 3-7: right nodes
rz(0.314) q[0];  // Node 0 phase
rz(0.628) q[1];  // Node 1 phase  
rz(0.471) q[2];  // Node 2 phase
rz(0.392) q[3];  // Node 3 phase
rz(0.549) q[4];  // Node 4 phase
rz(0.157) q[5];  // Node 5 phase
rz(1.256) q[6];  // Node 6 phase
rz(0.0) q[7];    // Node 7 phase (unused)

// Layer 1: Entangling gates for bipartite matching constraints
// Left node 0 connections
cx q[0], q[3];
rz(-0.196) q[3];
cx q[0], q[3];
cx q[0], q[6];
rz(-0.981) q[6];
cx q[0], q[6];

// Left node 1 connections
cx q[1], q[4];
rz(-0.392) q[4];
cx q[1], q[4];
cx q[1], q[6];
rz(-0.981) q[6];
cx q[1], q[6];
cx q[1], q[3];
rz(-0.785) q[3];
cx q[1], q[3];

// Left node 2 connections
cx q[2], q[5];
rz(-0.157) q[5];
cx q[2], q[5];
cx q[2], q[3];
rz(-0.863) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(-0.863) q[4];
cx q[2], q[4];

// Layer 2: Mixer layer with Hadamards
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Additional phase optimization
rz(0.235) q[0];
rz(0.471) q[1];
rz(0.353) q[2];
rz(0.294) q[3];
rz(0.412) q[4];
rz(0.118) q[5];
rz(0.942) q[6];
rz(0.0) q[7];

// Layer 2: Final entangling for constraint reinforcement
cx q[0], q[3];
rz(-0.147) q[3];
cx q[0], q[3];
cx q[1], q[4];
rz(-0.294) q[4];
cx q[1], q[4];
cx q[2], q[5];
rz(-0.118) q[5];
cx q[2], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];