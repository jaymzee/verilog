#include "Vcounter.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char *argv[], char *env[]) {
    Verilated::commandArgs(argc, argv);
    Vcounter *top = new Vcounter();

    Verilated::traceEverOn(true);   // compute traced signals
    VerilatedVcdC* vcd = new VerilatedVcdC();
    top->trace(vcd, 99);        // trace 99 levels of hierarchy
    vcd->open("counter.vcd");   // dump file

    int time = 0;

    top->clk = 0;
    top->rst_ = 1;
    top->en_ = 1;
    top->up = 1;
    top->eval();
    vcd->dump(time++);

    top->rst_ = 0;
    top->eval();
    vcd->dump(time++);

    top->rst_ = 1;
    top->eval();
    vcd->dump(time++);

    top->en_ = 0;
    top->eval();
    vcd->dump(time++);

    for (int i = 0; i < 16; i++) {
        top->clk = 1;
        top->eval();
        printf("%d: %d\n", time, top->count);
        vcd->dump(time++);

        top->clk = 0;
        top->eval();
        vcd->dump(time++);
    }

    vcd->close();
    delete top;
    exit(0);
}
