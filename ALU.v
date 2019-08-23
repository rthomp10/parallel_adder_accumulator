
module ALU;

//I didn't make enough time to write this one out, but this is
// suppose to load 256 bit matricix representationgs into ram
// and HAND over those matricies to each module cyclically using 
// the positive edge of the clock.
//
//The results would then be stored as 512 bit matrix 
// represnetaions with an offset if multiplying was involved
// matrix module had the outuput. Even though the results "can" 
// be reused, the next results will only make sense if the reused 
// inputs were from a module that didn't induce an offset. 
//
//A real ALU would include space for an opcode and utilize a 
// select module to perform its read, writes, and executions.
//
//I'll keep working on this regardless of the due date. I 
// appreciate the objective! It demonstrated how impactful Mr. 
// Hinkle's computer architecture class was. I wish that was 
// taught with verilog! Now I'm interested in designing my own silly 
// architecture.
//
// RECOMENDATION: For the future students, ask them to design a time keeping clock using a 32.768KHz XTAL as an input. 
