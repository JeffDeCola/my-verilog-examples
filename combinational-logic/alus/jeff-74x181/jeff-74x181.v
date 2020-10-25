// 4-bit arithmetic logic unit and function generator
// Provides 16 binary logic operations and
// 16 arithmetic operations on two 4-bit words.

module jeff_74x181(
    input                a0,                  // WORD 1
    input                a1,                  // 
    input                a2,                  // 
    input                a3,                  // 
    input                b0,                  // WORD 2
    input                b1,                  // 
    input                b2,                  // 
    input                b3,                  // 
    input                s0,                  // FUNCTION SELECT
    input                s1,                  // 
    input                s2,                  // 
    input                s3,                  //
    input                m,                   // MODE: 0 is arithmetic, 1 is logic
    input                ci,                  // CARRY IN
    output               f0,                  // OUTPUT
    output               f1,                  // 
    output               f2,                  // 
    output               f3,                  // 
    output               co,                  // CARRY OUT
    output               aeqb,                // WHEN A = B
    output               p,                   // PROPAGATE
    output               g                    // GENERATE
);


// I DESIGNED THIS FRO THE 1972 TI SPEC SHEET


endmodule
