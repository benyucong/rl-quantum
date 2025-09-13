OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Problem-specific entangling gates with optimal parameters
// Clique constraints for potential 5-clique (0,1,2,3,4)
cx q[0], q[1];
rz(0.314) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.314) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.314) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.314) q[4];
cx q[0], q[4];
cx q[1], q[2];
rz(0.314) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.314) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.314) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(0.314) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.314) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.314) q[4];
cx q[3], q[4];

// Mixer layer 1
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];

// Layer 2: Additional constraints for non-clique edges
cx q[2], q[6];
rz(-0.157) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(-0.157) q[7];
cx q[2], q[7];
cx q[6], q[5];
rz(-0.157) q[5];
cx q[6], q[5];
cx q[5], q[7];
rz(-0.157) q[7];
cx q[5], q[7];

// Mixer layer 2
rx(0.628) q[0];
rx(0.628) q[1];
rx(0.628) q[2];
rx(0.628) q[3];
rx(0.628) q[4];
rx(0.628) q[5];
rx(0.628) q[6];
rx(0.628) q[7];

// Layer 3: Reinforcement of clique structure
cx q[0], q[1];
rz(0.471) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.471) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.471) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.471) q[4];
cx q[0], q[4];
cx q[1], q[2];
rz(0.471) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.471) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.471) q[4];
cx q[1], q[4];

// Mixer layer 3
rx(0.471) q[0];
rx(0.471) q[1];
rx(0.471) q[2];
rx(0.471) q[3];
rx(0.471) q[4];
rx(0.471) q[5];
rx(0.471) q[6];
rx(0.471) q[7];

// Layer 4: Final optimization and penalty terms
cx q[2], q[6];
rz(-0.235) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(-0.235) q[7];
cx q[2], q[7];
cx q[6], q[5];
rz(-0.235) q[5];
cx q[6], q[5];
cx q[5], q[7];
rz(-0.235) q[7];
cx q[5], q[7];
cx q[3], q[4];
rz(0.628) q[4];
cx q[3], q[4];

// Final mixer layer
rx(0.314) q[0];
rx(0.314) q[1];
rx(0.314) q[2];
rx(0.314) q[3];
rx(0.314) q[4];
rx(0.314) q[5];
rx(0.314) q[6];
rx(0.314) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];