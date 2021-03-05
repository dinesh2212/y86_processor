module needs(
    input [3:0] icode,
    output needvalC,
    output needregid;
)

if(icode == 0) begin
    needvalC = 0;
    needregid = 0;
end

else if(icode == 1) begin
    needvalC = 0;
    needregid = 0;
end

else if(icode == 2) begin
    needvalC = 0;
    needregid = 1;
end

else if(icode == 3) begin
    needvalC = 1;
    needregid = 1;
end

else if(icode == 4) begin
    needvalC = 1;
    needregid = 1;
end

else if(icode == 5) begin
    needvalC = 1;
    needregid = 1;
end

else if(icode == 6) begin
    needvalC = 0;
    needregid = 1;
end

else if(icode == 7) begin
    needvalC = 1;
    needregid = 0;
end

else if(icode == 8) begin
    needvalC = 1;
    needregid = 0;
end

else if(icode == 9) begin
    needvalC = 0;
    needregid = 0;
end

else if(icode == 10) begin
    needvalC = 0;
    needregid = 1;
end

else if(icode == 11) begin
    needvalC = 0;
    needregid = 1;
end