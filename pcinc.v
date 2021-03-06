module pc_inc(
    input [63:0] pc,
    input needregid,
    input needvalC,
    output valP;
)

valP = pc + 10;