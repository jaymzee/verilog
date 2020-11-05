#include "Vcounter.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char *argv[], char *env[]) {
    Verilated::commandArgs(argc, argv);
    Vcounter *top = new Vcounter();

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC();

    top->trace(tfp, 99);
    tfp->open("counter.vcd");

    int time = 0;

    top->clk = 0;
    top->rst_ = 1;
    top->en_ = 1;
    top->up = 1;
    top->eval();
    tfp->dump(time++);
    top->rst_ = 0;
    top->eval();
    tfp->dump(time++);
    top->rst_ = 1;
    top->eval();
    tfp->dump(time++);
    top->en_ = 0;
    top->eval();
    tfp->dump(time++);

    for (int i = 0; i < 16; i++) {
        top->clk = 1;
        top->eval();
        tfp->dump(time++);
        top->clk = 0;
        top->eval();
        tfp->dump(time++);
    }

    tfp->close();
    delete top;
    exit(0);
}
