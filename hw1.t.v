`include "hw1.v"

module demorgan_test ();

  // Instantiate device/module under test
  reg A, B;                // Primary test inputs
  wire nA, nB, nAandnB;    // Test outputs
  demorgan1 dut1(A, B, nA, nB, nAandnB);  // Module to be tested

  reg C, D;
  wire CorD, nCorD;
  demorgan2 dut2(C, D, CorD, nCorD);

  reg E, F;                // PrimCry test inputs
  wire nE, nF, nEornF;    // Test outputs
  demorgan3 dut3(E, F, nE, nF, nEornF);  // Module to be tested

  reg G, H;
  wire GandH, nGandH;
  demorgan4 dut4(G, H, GandH, nGandH);


  // Run sequence of test stimuli
  initial begin
    $display("~A*~B");
    $display("A B | ~A ~B | ~A*~B ");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);

    $display("");
    $display("~(A+B)");
    $display("A B | A + B | ~(A+B) ");          
    C=0;D=0; #1                                 
    $display("%b %b |   %b   |    %b  ", C,D, CorD, nCorD);
    C=0;D=1; #1                                 
    $display("%b %b |   %b   |    %b  ", C,D, CorD, nCorD);
    C=1;D=0; #1
    $display("%b %b |   %b   |    %b  ", C,D, CorD, nCorD);
    C=1;D=1; #1
    $display("%b %b |   %b   |    %b  ", C,D, CorD, nCorD);

    $display("");
    $display("~A*~B and ~(A+B) are the same."); 
    $display("");

    $display("");
    $display("~A + ~B");
    $display("A B | ~A ~B | ~A + ~B ");         
    E=0;F=0; #1                                 
    $display("%b %b |  %b  %b |    %b  ", E,F, nE, nF, nEornF);
    E=0;F=1; #1                                 
    $display("%b %b |  %b  %b |    %b  ", E,F, nE, nF, nEornF);
    E=1;F=0; #1
    $display("%b %b |  %b  %b |    %b  ", E,F, nE, nF, nEornF);
    E=1;F=1; #1
    $display("%b %b |  %b  %b |    %b  ", E,F, nE, nF, nEornF);

    $display("");
    $display("~(A*B)");
    $display("A B | A * B | ~(A*B) ");          
    G=0;H=0; #1                                 
    $display("%b %b |   %b   |    %b  ", G,H, GandH, nGandH);
    G=0;H=1; #1                                 
    $display("%b %b |   %b   |    %b  ", G,H, GandH, nGandH);
    G=1;H=0; #1
    $display("%b %b |   %b   |    %b  ", G,H, GandH, nGandH);
    G=1;H=1; #1
    $display("%b %b |   %b   |    %b  ", G,H, GandH, nGandH);

    $display("");
    $display("~A+~B and ~(A*B) are the same.");


  end
endmodule// End demorgan_test