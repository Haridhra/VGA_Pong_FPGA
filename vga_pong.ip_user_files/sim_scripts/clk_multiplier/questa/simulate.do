onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib clk_multiplier_opt

do {wave.do}

view wave
view structure
view signals

do {clk_multiplier.udo}

run -all

quit -force
