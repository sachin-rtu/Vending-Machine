// ITEM ONE 
module Item_One(five_in, ten_in, clock, reset, five_out, dispense);
        input five_in, ten_in, clock, reset;
        output reg five_out, dispense;
        reg [4:0] current_state, next_state;

        localparam S0  = 5'b00001,
                S5  = 5'b00010,
                S10 = 5'b00100,
                S15 = 5'b01000,
                S20 = 5'b10000;

    always @(current_state or posedge clock or reset) begin
        if (reset) begin
            current_state <= S0;
        end
        else begin 
            current_state <= next_state;
        end
    end

    always @(five_in or ten_in) begin
        case (current_state)
            S0:
                if (five_in)    begin  next_state = S5;   {five_out, dispense} = 2'b00; end
                else if(ten_in) begin  next_state = S10;  {five_out, dispense} = 2'b00; end
                else            begin  next_state = S0;   {five_out, dispense} = 2'b00; end

            S5: 
                if (five_in)    begin  next_state = S10;  {five_out, dispense} = 2'b00; end
                else if(ten_in) begin  next_state = S15;  {five_out, dispense} = 2'b01; end
                else            begin  next_state = S5;   {five_out, dispense} = 2'b00; end

            S10: 
                if (five_in)    begin  next_state = S15;  {five_out, dispense} = 2'b01; end
                else if(ten_in) begin  next_state = S20;  {five_out, dispense} = 2'b11; end
                else            begin  next_state = S10;  {five_out, dispense} = 2'b00; end

            S15:
                begin  next_state = S0;  {five_out, dispense} = 2'b00; end
            
            S20:
                begin  next_state = S0;  {five_out, dispense} = 2'b00; end

            default: 
                begin  next_state = S0;  {five_out, dispense} = 2'b00; end
        endcase
    end
endmodule

//ITEM TWO
module Item_Two(five_in, ten_in, clock, reset, five_out, dispense);
    input five_in, ten_in, clock, reset;
    output reg five_out, dispense;

    reg[5:0] current_state, next_state;
    localparam S0  = 6'b000001,
               S5  = 6'b000010,
               S10 = 6'b000100,
               S15 = 6'b001000,
               S20 = 6'b010000,
               S25 = 6'b100000;
    always @(posedge clock or reset) begin
        if(reset) begin
            current_state <= S0;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(current_state or five_in or ten_in) begin
        case(current_state)
            S0:
                if(five_in)     begin next_state = S5;  {five_out,dispense} = 2'b00; end
                else if(ten_in) begin next_state = S10; {five_out,dispense} = 2'b00; end
                else            begin next_state = S0;  {five_out,dispense} = 2'b00; end

            S5:
                if(five_in)     begin next_state = S10; {five_out,dispense} = 2'b00; end
                else if(ten_in) begin next_state = S15; {five_out,dispense} = 2'b00; end
                else            begin next_state = S5;  {five_out,dispense} = 2'b00; end

            S10:
                if(five_in)     begin next_state = S15; {five_out,dispense} = 2'b00; end
                else if(ten_in) begin next_state = S20; {five_out,dispense} = 2'b01; end
                else            begin next_state = S10; {five_out,dispense} = 2'b00; end

            S15:
                if(five_in)     begin next_state = S20; {five_out,dispense} = 2'b01; end
                else if(ten_in) begin next_state = S25; {five_out,dispense} = 2'b11; end
                else            begin next_state = S15; {five_out,dispense} = 2'b00; end

            S20:
                begin next_state = S0; {five_out, dispense} = 2'b00; end

            S25:
                begin next_state = S0; {five_out, dispense} = 2'b00; end

            default:
                begin next_state = S0; {five_out, dispense} = 2'b00; end
            endcase

    end     
endmodule

// ITEM THREE
module Item_Three(five_in, ten_in, clock, reset, five_out, dispense);
    input five_in, ten_in, clock, reset;
    output reg five_out, dispense;

    reg[6:0] current_state, next_state;
    localparam S0  = 7'b0000001,
               S5  = 7'b0000010,
               S10 = 7'b0000100,
               S15 = 7'b0001000,
               S20 = 7'b0010000,
               S25 = 7'b0100000,
               S30 = 7'b1000000;

    always @(posedge clock or reset) begin
        if (reset) begin
            current_state <= S0;
        end
        else begin
          current_state <= next_state;
        end
    end

    always @(current_state or five_in or ten_in) begin
        case (current_state)
            S0: 
                if (five_in)    begin next_state = S5;  {five_out, dispense} = 2'b00; end
                else if(ten_in) begin next_state = S10; {five_out, dispense} = 2'b00; end
                else            begin next_state = S0;  {five_out, dispense} = 2'b00; end

            S5: 
                if (five_in)    begin next_state = S10; {five_out, dispense} = 2'b00; end
                else if(ten_in) begin next_state = S15; {five_out, dispense} = 2'b00; end
                else            begin next_state = S5;  {five_out, dispense} = 2'b00; end

            S10: 
                if (five_in)    begin next_state = S15; {five_out, dispense} = 2'b00; end
                else if(ten_in) begin next_state = S20; {five_out, dispense} = 2'b00; end
                else            begin next_state = S10; {five_out, dispense} = 2'b00; end

            S15: 
                if (five_in)    begin next_state = S20; {five_out, dispense} = 2'b00; end
                else if(ten_in) begin next_state = S25; {five_out, dispense} = 2'b01; end
                else            begin next_state = S15; {five_out, dispense} = 2'b00; end

            S20: 
                if (five_in)    begin next_state = S25; {five_out, dispense} = 2'b01; end
                else if(ten_in) begin next_state = S30; {five_out, dispense} = 2'b11; end
                else            begin next_state = S20; {five_out, dispense} = 2'b00; end

            S25:
                begin next_state = S0; {five_out, dispense} = 2'b00; end

            S30:
                begin next_state = S0; {five_out, dispense} = 2'b00; end

            default:
                begin next_state = S0; {five_out, dispense} = 2'b00; end
        endcase

    end
endmodule

//ITEM FOUR
module Item_Four(five_in, ten_in, clock, reset, five_out, dispense);
    input five_in, ten_in, clock, reset;
    output reg five_out, dispense;

    reg[7:0] current_state, next_state;
    localparam S0  = 8'b00000001,
               S5  = 8'b00000010,
               S10 = 8'b00000100,
               S15 = 8'b00001000,
               S20 = 8'b00010000,
               S25 = 8'b00100000,
               S30 = 8'b01000000,
               S35 = 8'b10000000;

    always @(posedge clock or reset) begin
        if (reset) begin
            current_state <= S0;
        end
        else begin
          current_state <= next_state;
        end
    end

    always @(current_state or five_in or ten_in) begin
        case (current_state)
            S0: 
                if (five_in)    begin next_state = S5;  {five_out, dispense} = 2'b00; end
                else if(ten_in) begin next_state = S10; {five_out, dispense} = 2'b00; end
                else            begin next_state = S0;  {five_out, dispense} = 2'b00; end

            S5: 
                if (five_in)    begin next_state = S10; {five_out, dispense} = 2'b00; end
                else if(ten_in) begin next_state = S15; {five_out, dispense} = 2'b00; end
                else            begin next_state = S5;  {five_out, dispense} = 2'b00; end

            S10: 
                if (five_in)    begin next_state = S15; {five_out, dispense} = 2'b00; end
                else if(ten_in) begin next_state = S20; {five_out, dispense} = 2'b00; end
                else            begin next_state = S10; {five_out, dispense} = 2'b00; end

            S15: 
                if (five_in)    begin next_state = S20; {five_out, dispense} = 2'b00; end
                else if(ten_in) begin next_state = S25; {five_out, dispense} = 2'b00; end
                else            begin next_state = S15; {five_out, dispense} = 2'b00; end

            S20: 
                if (five_in)    begin next_state = S25; {five_out, dispense} = 2'b00; end
                else if(ten_in) begin next_state = S30; {five_out, dispense} = 2'b01; end
                else            begin next_state = S20; {five_out, dispense} = 2'b00; end

            S25:
                if (five_in)    begin next_state = S30; {five_out, dispense} = 2'b01; end
                else if(ten_in) begin next_state = S35; {five_out, dispense} = 2'b11; end
                else            begin next_state = S25; {five_out, dispense} = 2'b00; end

            S30:
                begin next_state = S0; {five_out, dispense} = 2'b00; end

            S35:
                begin next_state = S0; {five_out, dispense} = 2'b00; end

            default:
                begin next_state = S0; {five_out, dispense} = 2'b00; end
        endcase

    end
endmodule

module VendingMachine(item_number, five_in, ten_in, clock, reset, five_out, dispense);
    input [3:0] item_number;
    input five_in, ten_in, clock, reset;
    output reg five_out, dispense;
        wire No1, No2, No3, No4, D1, D2, D3, D4;

    Item_One   IO (.five_in(five_in), .ten_in(ten_in), .clock(clock), .reset(reset), .five_out(No1), .dispense(D1));
    Item_Two   ITW(.five_in(five_in), .ten_in(ten_in), .clock(clock), .reset(reset), .five_out(No2), .dispense(D2));
    Item_Three ITH(.five_in(five_in), .ten_in(ten_in), .clock(clock), .reset(reset), .five_out(No3), .dispense(D3));
    Item_Four  IF (.five_in(five_in), .ten_in(ten_in), .clock(clock), .reset(reset), .five_out(No4), .dispense(D4));

    always @(*) begin
        case (item_number)
            4'b0001: begin
                five_out = No1;
                dispense = D1;
            end
            4'b0010: begin
                five_out = No2;
                dispense = D2;
            end
            4'b0100: begin
                five_out = No3;
                dispense = D3;
            end
            4'b1000: begin
                five_out = No4;
                dispense = D4;
            end
            default: begin
                five_out = 1'b0;
                dispense = 1'b0;
            end
        endcase
    end
endmodule