transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/Testbench_EightbitKogStonAddSub.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/Node.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/TwoByOneMux.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/OrGate.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/NotGate.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/AndGate.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/EightbitKogStonAddSub.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/AndMux.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/OrMux.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/NotMux.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/XorMux.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/PreProcess.vhd}
vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/PostProcess.vhd}

vcom -93 -work work {G:/My Drive/sem4/CS 254/Lab5/EightbitKogStonAddSub/Testbench_EightbitKogStonAddSub.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run 2000 ns
