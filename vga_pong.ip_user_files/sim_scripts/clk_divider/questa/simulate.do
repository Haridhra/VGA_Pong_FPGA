onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib clk_divider_opt

do {wave.do}

view wave
view structure
view signals

do {clk_divider.udo}

run -all

quit -force
