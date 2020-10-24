// 8-bit microprocessor ta161
// 4-bit synchronous counter

module ta161 (
    input           CLR,                 // ASYYNC CLEAR
    input           LD,                  // LOAD
    input           ENT,                 // ENABLE T
    input           ENP,                 // ENABLE P
    input           CLK,                 // CLK
    input           A, B, C, D,          // DATA IN
    output          QA, QB, QC, QD,      // DATA OUT
    output          RC0                  // RIPPLE CARRY OUTPUT
);

// WIRES
reg QA, QB, QC, QD;

always @ (posedge CLK or posedge CLR) begin
    if (CLR) begin
        QA <= 1'b0;
        QB <= 1'b0;
        QC <= 1'b0;
        QD <= 1'b0;
    end else if (ENT or ENP) begin
        if (LD)

    end 


    end
end

endmodule