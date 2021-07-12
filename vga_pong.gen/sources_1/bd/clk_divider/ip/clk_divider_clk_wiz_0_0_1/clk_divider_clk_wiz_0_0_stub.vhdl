-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Thu Feb  4 21:55:42 2021
-- Host        : Harid-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {d:/Harid/Hobby Projects/Electronics/FPGA
--               Projetcs/vga_controller/vga_controller.gen/sources_1/bd/clk_divider/ip/clk_divider_clk_wiz_0_0_1/clk_divider_clk_wiz_0_0_stub.vhdl}
-- Design      : clk_divider_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_divider_clk_wiz_0_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_divider_clk_wiz_0_0;

architecture stub of clk_divider_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,locked,clk_in1";
begin
end;
