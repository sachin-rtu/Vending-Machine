`define CLOCK_PERIOD 10

module VendingMachine_Testbench();

    reg [3:0] item_number;
    reg five_in, ten_in, clock, reset;
    wire five_out, dispense;

    VendingMachine VM(
        .item_number(item_number),
        .five_in(five_in), 
        .ten_in(ten_in), 
        .clock(clock), 
        .reset(reset), 
        .five_out(five_out), 
        .dispense(dispense)
    );

    initial clock = 0;

    always #(`CLOCK_PERIOD/2) clock = ~clock;

    initial begin

        item_number = 4'b0001; //Item 1
        five_in = 0;
        ten_in = 0;
        reset = 1;
        #(`CLOCK_PERIOD);
        reset = 0;
        #(`CLOCK_PERIOD);

        $display("\n Testing item 1 (15rs)");

        $display("Test Case 1: Inserting 5rs coin");
        five_in = 1;
        ten_in = 0;
        #(`CLOCK_PERIOD);
        five_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after 5rs: five_out=%b, dispense=%b", five_out, dispense);

        $display("Test Case 2: Inserting 10rs coin (total=15rs)");
        five_in = 0;
        ten_in = 1;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after 15rs: five_out=%b, dispense=%b (should dispense)", five_out, dispense);

        reset = 1;
        #(`CLOCK_PERIOD);
        reset = 0;
        #(`CLOCK_PERIOD);

        $display("\n Testing Item 2 (20rs)");
        item_number = 4'b0010; // Item 2

        $display("Test Case 3: Inserting 10rs coin");
        five_in = 0;
        ten_in = 1;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after 10rs: five_out=%b, dispense=%b", five_out, dispense);

        $display("Test Case 4: Inserting Another 10rs coin (total=20rs)");
        five_in = 0;
        ten_in = 1;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after 20rs: five_out=%b, dispense=%b (should dispense)", five_out, dispense);

        reset = 1;
        #(`CLOCK_PERIOD);
        reset = 0;
        #(`CLOCK_PERIOD);

        $display("\n Testing Item 3 (25rs)");
        item_number = 4'b0100; // Item 3

        $display("Test Case 5: Inserting 10rs + 10rs + 5rs = 25rs");
        ten_in = 1;
        five_in = 0;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after first 10rs: five_out=%b, dispense=%b", five_out, dispense);

        ten_in = 1;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after second 10rs: five_out=%b, dispense=%b", five_out, dispense);

        five_in = 1;
        #(`CLOCK_PERIOD);
        five_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after 5rs (total=25rs): five_out=%b, dispense=%b (should dispense)", five_out, dispense);

        reset = 1;
        #(`CLOCK_PERIOD);
        reset = 0;
        #(`CLOCK_PERIOD);

        $display("\n Testing Item 4 (30rs)");
        item_number = 4'b1000; // Item 4

        $display("Test Case 6: Inserting 10rs + 10rs + 10rs  = 30rs");
        ten_in = 1;
        five_in = 0;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after first 10rs: five_out=%b, dispense=%b", five_out, dispense);

        ten_in = 1;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after second 10rs: five_out=%b, dispense=%b", five_out, dispense);

        ten_in = 1;
        five_in = 0;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);
        $display("State after third 10rs (total=30rs): five_out=%b, dispense=%b (should dispense)", five_out, dispense);
        
        reset = 1;
        #(`CLOCK_PERIOD);
        reset = 0;
        #(`CLOCK_PERIOD);

        $display("\n Testing Change return");
        item_number = 4'b0001; // Item 1 

        $display("Test Case : Overpayment test - 20rs for 15rs item");

        ten_in = 1;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);

        ten_in = 1;
        #(`CLOCK_PERIOD);
        ten_in = 0;
        #(`CLOCK_PERIOD);
        $display("After 20rs payment: five_out=%b, dispense=%b (should have change)",five_out, dispense);  

        $display("\n Testing Reset Functionality");
        reset = 1;
        #(`CLOCK_PERIOD);
        $display("After reset: five_out=%b, dispense=%b (should be 0,0)", five_out, dispense);
        reset = 0;
        #(`CLOCK_PERIOD)

        $display("\n Testing Invalid Item Selection");
        item_number = 4'b0000;
        five_in = 1;
        #(`CLOCK_PERIOD);
        five_in = 0;
        #(`CLOCK_PERIOD);
        $display("Invalid item test: five_out=%b, dispense=%b (should be 0,0)",five_out, dispense );

        #(`CLOCK_PERIOD);
        $display("\nTest completed.");

        $finish;
    end

    initial begin
        $dumpfile("VendingMachine.vcd");
        $dumpvars(0, VendingMachine_Testbench);
    end

    always @(posedge clock) begin
        if (five_out || dispense)
            $display("Time %0t: item=%b, five_out=%b, dispense=%b", $time, item_number, five_out, dispense);
    end

endmodule