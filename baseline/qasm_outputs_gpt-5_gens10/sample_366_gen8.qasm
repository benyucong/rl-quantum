OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits to |0> state
h q[0];  // Source
h q[1];  // Node 1
h q[2];  // Node 2
h q[3];  // Sink
h q[4];  // Auxiliary qubits

// Layer 1: Encoding edges
cx q[0], q[1];  // Edge from source to Node 1
cx q[0], q[3];  // Edge from source to Sink
cx q[1], q[2];  // Edge from Node 1 to Node 2
cx q[1], q[3];  // Edge from Node 1 to Sink
cx q[2], q[1];  // Edge from Node 2 to Node 1
cx q[2], q[3];  // Edge from Node 2 to Sink

// Layer 2: Applying rotations based on capacities
rz(1.5718) q[1];  // Capacity 1 from Node 1 to Sink
rz(1.1071) q[3];  // Capacity 2 from Node 0 to Sink
rz(0.7854) q[2];  // Capacity 3 from Node 2 to Sink

// Layer 3: Final measurements and adjustment
h q[0];  
h q[1];  
h q[2];
h q[3];

// Measure the qubits
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