-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Fri Aug 23 16:34:06 2024
-- Host        : jam-Precision-5510 running 64-bit Ubuntu 22.04.4 LTS
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/jam/Downloads/MIPScpu/project_1/project_1.sim/sim_1/synth/func/xsim/tb_Basic_Timer_func_synth.vhd
-- Design      : Basic_Timer
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Frequency_Divider is
  port (
    preset_clk : out STD_LOGIC;
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end Frequency_Divider;

architecture STRUCTURE of Frequency_Divider is
  signal clk_reg_i_1_n_0 : STD_LOGIC;
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \counter[3]_i_2_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal load : STD_LOGIC;
  signal \^preset_clk\ : STD_LOGIC;
begin
  preset_clk <= \^preset_clk\;
clk_reg0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002001001000001"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(0),
      I2 => counter_reg(1),
      I3 => counter_reg(2),
      I4 => Q(1),
      I5 => Q(0),
      O => load
    );
clk_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"54A8"
    )
        port map (
      I0 => load,
      I1 => Q(1),
      I2 => Q(0),
      I3 => \^preset_clk\,
      O => clk_reg_i_1_n_0
    );
clk_reg_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => clk_reg_i_1_n_0,
      Q => \^preset_clk\
    );
\counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFF70000FDBE"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => counter_reg(2),
      I3 => counter_reg(1),
      I4 => counter_reg(0),
      I5 => counter_reg(3),
      O => \counter[0]_i_1_n_0\
    );
\counter[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFF0000FFFD00"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => counter_reg(2),
      I3 => counter_reg(1),
      I4 => counter_reg(0),
      I5 => counter_reg(3),
      O => \counter[1]_i_1_n_0\
    );
\counter[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FF0F0F00FF0F0B0"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => counter_reg(2),
      I3 => counter_reg(1),
      I4 => counter_reg(0),
      I5 => counter_reg(3),
      O => \counter[2]_i_1_n_0\
    );
\counter[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      O => \counter[3]_i_1_n_0\
    );
\counter[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FFFFFF7F0000000"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => counter_reg(2),
      I3 => counter_reg(1),
      I4 => counter_reg(0),
      I5 => counter_reg(3),
      O => \counter[3]_i_2_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter[3]_i_1_n_0\,
      CLR => AR(0),
      D => \counter[0]_i_1_n_0\,
      Q => counter_reg(0)
    );
\counter_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter[3]_i_1_n_0\,
      CLR => AR(0),
      D => \counter[1]_i_1_n_0\,
      Q => counter_reg(1)
    );
\counter_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter[3]_i_1_n_0\,
      CLR => AR(0),
      D => \counter[2]_i_1_n_0\,
      Q => counter_reg(2)
    );
\counter_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter[3]_i_1_n_0\,
      CLR => AR(0),
      D => \counter[3]_i_2_n_0\,
      Q => counter_reg(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Basic_Timer is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    BTCTL_cs : in STD_LOGIC;
    BTCNT_cs : in STD_LOGIC;
    BTCCR0_cs : in STD_LOGIC;
    BTCCR1_cs : in STD_LOGIC;
    DataWrite : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Set_BTIFG : out STD_LOGIC;
    PWMout : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Basic_Timer : entity is true;
end Basic_Timer;

architecture STRUCTURE of Basic_Timer is
  signal BTCCR0_cs_IBUF : STD_LOGIC;
  signal \BTCCR0_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[10]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[11]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[12]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[13]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[14]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[15]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[16]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[17]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[18]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[19]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[20]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[21]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[22]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[23]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[24]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[25]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[26]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[27]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[28]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[29]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[30]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[31]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal \BTCCR0_reg_reg_n_0_[9]\ : STD_LOGIC;
  signal BTCCR1_cs_IBUF : STD_LOGIC;
  signal BTCCR1_reg : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[10]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[11]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[12]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[13]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[14]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[15]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[16]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[17]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[18]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[19]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[20]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[21]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[22]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[23]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[24]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[25]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[26]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[27]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[28]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[29]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[30]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[31]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal \BTCCR1_reg_reg_n_0_[9]\ : STD_LOGIC;
  signal BTCNT_cs_IBUF : STD_LOGIC;
  signal BTCNT_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \BTCNT_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal BTCTL_cs_IBUF : STD_LOGIC;
  signal \BTCTL_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \BTCTL_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \BTCTL_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \BTCTL_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \BTCTL_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \BTCTL_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal BTOUTEN : STD_LOGIC;
  signal BTOUTMD : STD_LOGIC;
  signal DataWrite_IBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PWMout0 : STD_LOGIC;
  signal PWMout1 : STD_LOGIC;
  signal PWMout_OBUF : STD_LOGIC;
  signal PWMout_reg_i_10_n_0 : STD_LOGIC;
  signal PWMout_reg_i_11_n_0 : STD_LOGIC;
  signal PWMout_reg_i_12_n_0 : STD_LOGIC;
  signal PWMout_reg_i_12_n_1 : STD_LOGIC;
  signal PWMout_reg_i_12_n_2 : STD_LOGIC;
  signal PWMout_reg_i_12_n_3 : STD_LOGIC;
  signal PWMout_reg_i_13_n_0 : STD_LOGIC;
  signal PWMout_reg_i_14_n_0 : STD_LOGIC;
  signal PWMout_reg_i_15_n_0 : STD_LOGIC;
  signal PWMout_reg_i_16_n_0 : STD_LOGIC;
  signal PWMout_reg_i_17_n_0 : STD_LOGIC;
  signal PWMout_reg_i_17_n_1 : STD_LOGIC;
  signal PWMout_reg_i_17_n_2 : STD_LOGIC;
  signal PWMout_reg_i_17_n_3 : STD_LOGIC;
  signal PWMout_reg_i_18_n_0 : STD_LOGIC;
  signal PWMout_reg_i_19_n_0 : STD_LOGIC;
  signal PWMout_reg_i_1_n_0 : STD_LOGIC;
  signal PWMout_reg_i_20_n_0 : STD_LOGIC;
  signal PWMout_reg_i_21_n_0 : STD_LOGIC;
  signal PWMout_reg_i_22_n_0 : STD_LOGIC;
  signal PWMout_reg_i_23_n_0 : STD_LOGIC;
  signal PWMout_reg_i_24_n_0 : STD_LOGIC;
  signal PWMout_reg_i_25_n_0 : STD_LOGIC;
  signal PWMout_reg_i_26_n_0 : STD_LOGIC;
  signal PWMout_reg_i_27_n_0 : STD_LOGIC;
  signal PWMout_reg_i_28_n_0 : STD_LOGIC;
  signal PWMout_reg_i_29_n_0 : STD_LOGIC;
  signal PWMout_reg_i_2_n_2 : STD_LOGIC;
  signal PWMout_reg_i_2_n_3 : STD_LOGIC;
  signal PWMout_reg_i_3_n_2 : STD_LOGIC;
  signal PWMout_reg_i_3_n_3 : STD_LOGIC;
  signal PWMout_reg_i_4_n_0 : STD_LOGIC;
  signal PWMout_reg_i_4_n_1 : STD_LOGIC;
  signal PWMout_reg_i_4_n_2 : STD_LOGIC;
  signal PWMout_reg_i_4_n_3 : STD_LOGIC;
  signal PWMout_reg_i_5_n_0 : STD_LOGIC;
  signal PWMout_reg_i_6_n_0 : STD_LOGIC;
  signal PWMout_reg_i_7_n_0 : STD_LOGIC;
  signal PWMout_reg_i_8_n_0 : STD_LOGIC;
  signal PWMout_reg_i_8_n_1 : STD_LOGIC;
  signal PWMout_reg_i_8_n_2 : STD_LOGIC;
  signal PWMout_reg_i_8_n_3 : STD_LOGIC;
  signal PWMout_reg_i_9_n_0 : STD_LOGIC;
  signal Set_BTIFG_OBUF : STD_LOGIC;
  signal Set_BTIFG_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal Set_BTIFG_OBUF_inst_i_3_n_0 : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal preset_clk : STD_LOGIC;
  signal preset_clk_BUFG : STD_LOGIC;
  signal reset_IBUF : STD_LOGIC;
  signal \timer_cnt[31]_i_1_n_0\ : STD_LOGIC;
  signal \timer_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \timer_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \timer_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \timer_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \timer_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \timer_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \timer_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \timer_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \timer_cnt_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \timer_cnt_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \timer_cnt_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \timer_cnt_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \timer_cnt_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \timer_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \timer_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \timer_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \timer_cnt_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \timer_cnt_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \timer_cnt_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \timer_cnt_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \timer_cnt_reg[31]_i_2_n_2\ : STD_LOGIC;
  signal \timer_cnt_reg[31]_i_2_n_3\ : STD_LOGIC;
  signal \timer_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \timer_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \timer_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \timer_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \timer_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \timer_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \timer_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \timer_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal NLW_PWMout_reg_i_12_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_PWMout_reg_i_17_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_PWMout_reg_i_2_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_PWMout_reg_i_2_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_PWMout_reg_i_3_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_PWMout_reg_i_3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_PWMout_reg_i_4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_PWMout_reg_i_8_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_timer_cnt_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_timer_cnt_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of PWMout_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of PWMout_reg : label is "VCC:GE GND:CLR";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \timer_cnt_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \timer_cnt_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \timer_cnt_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \timer_cnt_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \timer_cnt_reg[28]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \timer_cnt_reg[31]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \timer_cnt_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \timer_cnt_reg[8]_i_1\ : label is 35;
begin
BTCCR0_cs_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => BTCCR0_cs,
      O => BTCCR0_cs_IBUF
    );
\BTCCR0_reg[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => BTCNT_cs_IBUF,
      I1 => BTCCR0_cs_IBUF,
      I2 => BTCTL_cs_IBUF,
      O => \BTCCR0_reg[31]_i_1_n_0\
    );
\BTCCR0_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(0),
      Q => \BTCCR0_reg_reg_n_0_[0]\
    );
\BTCCR0_reg_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(10),
      Q => \BTCCR0_reg_reg_n_0_[10]\
    );
\BTCCR0_reg_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(11),
      Q => \BTCCR0_reg_reg_n_0_[11]\
    );
\BTCCR0_reg_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(12),
      Q => \BTCCR0_reg_reg_n_0_[12]\
    );
\BTCCR0_reg_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(13),
      Q => \BTCCR0_reg_reg_n_0_[13]\
    );
\BTCCR0_reg_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(14),
      Q => \BTCCR0_reg_reg_n_0_[14]\
    );
\BTCCR0_reg_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(15),
      Q => \BTCCR0_reg_reg_n_0_[15]\
    );
\BTCCR0_reg_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(16),
      Q => \BTCCR0_reg_reg_n_0_[16]\
    );
\BTCCR0_reg_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(17),
      Q => \BTCCR0_reg_reg_n_0_[17]\
    );
\BTCCR0_reg_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(18),
      Q => \BTCCR0_reg_reg_n_0_[18]\
    );
\BTCCR0_reg_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(19),
      Q => \BTCCR0_reg_reg_n_0_[19]\
    );
\BTCCR0_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(1),
      Q => \BTCCR0_reg_reg_n_0_[1]\
    );
\BTCCR0_reg_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(20),
      Q => \BTCCR0_reg_reg_n_0_[20]\
    );
\BTCCR0_reg_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(21),
      Q => \BTCCR0_reg_reg_n_0_[21]\
    );
\BTCCR0_reg_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(22),
      Q => \BTCCR0_reg_reg_n_0_[22]\
    );
\BTCCR0_reg_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(23),
      Q => \BTCCR0_reg_reg_n_0_[23]\
    );
\BTCCR0_reg_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(24),
      Q => \BTCCR0_reg_reg_n_0_[24]\
    );
\BTCCR0_reg_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(25),
      Q => \BTCCR0_reg_reg_n_0_[25]\
    );
\BTCCR0_reg_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(26),
      Q => \BTCCR0_reg_reg_n_0_[26]\
    );
\BTCCR0_reg_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(27),
      Q => \BTCCR0_reg_reg_n_0_[27]\
    );
\BTCCR0_reg_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(28),
      Q => \BTCCR0_reg_reg_n_0_[28]\
    );
\BTCCR0_reg_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(29),
      Q => \BTCCR0_reg_reg_n_0_[29]\
    );
\BTCCR0_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(2),
      Q => \BTCCR0_reg_reg_n_0_[2]\
    );
\BTCCR0_reg_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(30),
      Q => \BTCCR0_reg_reg_n_0_[30]\
    );
\BTCCR0_reg_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(31),
      Q => \BTCCR0_reg_reg_n_0_[31]\
    );
\BTCCR0_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(3),
      Q => \BTCCR0_reg_reg_n_0_[3]\
    );
\BTCCR0_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(4),
      Q => \BTCCR0_reg_reg_n_0_[4]\
    );
\BTCCR0_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(5),
      Q => \BTCCR0_reg_reg_n_0_[5]\
    );
\BTCCR0_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(6),
      Q => \BTCCR0_reg_reg_n_0_[6]\
    );
\BTCCR0_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(7),
      Q => \BTCCR0_reg_reg_n_0_[7]\
    );
\BTCCR0_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(8),
      Q => \BTCCR0_reg_reg_n_0_[8]\
    );
\BTCCR0_reg_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCCR0_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(9),
      Q => \BTCCR0_reg_reg_n_0_[9]\
    );
BTCCR1_cs_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => BTCCR1_cs,
      O => BTCCR1_cs_IBUF
    );
\BTCCR1_reg[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => BTCNT_cs_IBUF,
      I1 => BTCTL_cs_IBUF,
      I2 => BTCCR1_cs_IBUF,
      I3 => BTCCR0_cs_IBUF,
      O => BTCCR1_reg
    );
\BTCCR1_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(0),
      Q => \BTCCR1_reg_reg_n_0_[0]\
    );
\BTCCR1_reg_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(10),
      Q => \BTCCR1_reg_reg_n_0_[10]\
    );
\BTCCR1_reg_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(11),
      Q => \BTCCR1_reg_reg_n_0_[11]\
    );
\BTCCR1_reg_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(12),
      Q => \BTCCR1_reg_reg_n_0_[12]\
    );
\BTCCR1_reg_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(13),
      Q => \BTCCR1_reg_reg_n_0_[13]\
    );
\BTCCR1_reg_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(14),
      Q => \BTCCR1_reg_reg_n_0_[14]\
    );
\BTCCR1_reg_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(15),
      Q => \BTCCR1_reg_reg_n_0_[15]\
    );
\BTCCR1_reg_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(16),
      Q => \BTCCR1_reg_reg_n_0_[16]\
    );
\BTCCR1_reg_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(17),
      Q => \BTCCR1_reg_reg_n_0_[17]\
    );
\BTCCR1_reg_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(18),
      Q => \BTCCR1_reg_reg_n_0_[18]\
    );
\BTCCR1_reg_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(19),
      Q => \BTCCR1_reg_reg_n_0_[19]\
    );
\BTCCR1_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(1),
      Q => \BTCCR1_reg_reg_n_0_[1]\
    );
\BTCCR1_reg_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(20),
      Q => \BTCCR1_reg_reg_n_0_[20]\
    );
\BTCCR1_reg_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(21),
      Q => \BTCCR1_reg_reg_n_0_[21]\
    );
\BTCCR1_reg_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(22),
      Q => \BTCCR1_reg_reg_n_0_[22]\
    );
\BTCCR1_reg_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(23),
      Q => \BTCCR1_reg_reg_n_0_[23]\
    );
\BTCCR1_reg_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(24),
      Q => \BTCCR1_reg_reg_n_0_[24]\
    );
\BTCCR1_reg_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(25),
      Q => \BTCCR1_reg_reg_n_0_[25]\
    );
\BTCCR1_reg_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(26),
      Q => \BTCCR1_reg_reg_n_0_[26]\
    );
\BTCCR1_reg_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(27),
      Q => \BTCCR1_reg_reg_n_0_[27]\
    );
\BTCCR1_reg_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(28),
      Q => \BTCCR1_reg_reg_n_0_[28]\
    );
\BTCCR1_reg_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(29),
      Q => \BTCCR1_reg_reg_n_0_[29]\
    );
\BTCCR1_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(2),
      Q => \BTCCR1_reg_reg_n_0_[2]\
    );
\BTCCR1_reg_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(30),
      Q => \BTCCR1_reg_reg_n_0_[30]\
    );
\BTCCR1_reg_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(31),
      Q => \BTCCR1_reg_reg_n_0_[31]\
    );
\BTCCR1_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(3),
      Q => \BTCCR1_reg_reg_n_0_[3]\
    );
\BTCCR1_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(4),
      Q => \BTCCR1_reg_reg_n_0_[4]\
    );
\BTCCR1_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(5),
      Q => \BTCCR1_reg_reg_n_0_[5]\
    );
\BTCCR1_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(6),
      Q => \BTCCR1_reg_reg_n_0_[6]\
    );
\BTCCR1_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(7),
      Q => \BTCCR1_reg_reg_n_0_[7]\
    );
\BTCCR1_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(8),
      Q => \BTCCR1_reg_reg_n_0_[8]\
    );
\BTCCR1_reg_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCCR1_reg,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(9),
      Q => \BTCCR1_reg_reg_n_0_[9]\
    );
BTCNT_cs_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => BTCNT_cs,
      O => BTCNT_cs_IBUF
    );
\BTCNT_reg[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => BTCNT_cs_IBUF,
      I1 => BTCTL_cs_IBUF,
      O => \BTCNT_reg[31]_i_1_n_0\
    );
\BTCNT_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(0),
      Q => BTCNT_reg(0)
    );
\BTCNT_reg_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(10),
      Q => BTCNT_reg(10)
    );
\BTCNT_reg_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(11),
      Q => BTCNT_reg(11)
    );
\BTCNT_reg_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(12),
      Q => BTCNT_reg(12)
    );
\BTCNT_reg_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(13),
      Q => BTCNT_reg(13)
    );
\BTCNT_reg_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(14),
      Q => BTCNT_reg(14)
    );
\BTCNT_reg_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(15),
      Q => BTCNT_reg(15)
    );
\BTCNT_reg_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(16),
      Q => BTCNT_reg(16)
    );
\BTCNT_reg_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(17),
      Q => BTCNT_reg(17)
    );
\BTCNT_reg_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(18),
      Q => BTCNT_reg(18)
    );
\BTCNT_reg_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(19),
      Q => BTCNT_reg(19)
    );
\BTCNT_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(1),
      Q => BTCNT_reg(1)
    );
\BTCNT_reg_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(20),
      Q => BTCNT_reg(20)
    );
\BTCNT_reg_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(21),
      Q => BTCNT_reg(21)
    );
\BTCNT_reg_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(22),
      Q => BTCNT_reg(22)
    );
\BTCNT_reg_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(23),
      Q => BTCNT_reg(23)
    );
\BTCNT_reg_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(24),
      Q => BTCNT_reg(24)
    );
\BTCNT_reg_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(25),
      Q => BTCNT_reg(25)
    );
\BTCNT_reg_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(26),
      Q => BTCNT_reg(26)
    );
\BTCNT_reg_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(27),
      Q => BTCNT_reg(27)
    );
\BTCNT_reg_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(28),
      Q => BTCNT_reg(28)
    );
\BTCNT_reg_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(29),
      Q => BTCNT_reg(29)
    );
\BTCNT_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(2),
      Q => BTCNT_reg(2)
    );
\BTCNT_reg_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(30),
      Q => BTCNT_reg(30)
    );
\BTCNT_reg_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(31),
      Q => BTCNT_reg(31)
    );
\BTCNT_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(3),
      Q => BTCNT_reg(3)
    );
\BTCNT_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(4),
      Q => BTCNT_reg(4)
    );
\BTCNT_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(5),
      Q => BTCNT_reg(5)
    );
\BTCNT_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(6),
      Q => BTCNT_reg(6)
    );
\BTCNT_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(7),
      Q => BTCNT_reg(7)
    );
\BTCNT_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(8),
      Q => BTCNT_reg(8)
    );
\BTCNT_reg_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \BTCNT_reg[31]_i_1_n_0\,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(9),
      Q => BTCNT_reg(9)
    );
BTCTL_cs_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => BTCTL_cs,
      O => BTCTL_cs_IBUF
    );
\BTCTL_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCTL_cs_IBUF,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(0),
      Q => \BTCTL_reg_reg_n_0_[0]\
    );
\BTCTL_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCTL_cs_IBUF,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(1),
      Q => \BTCTL_reg_reg_n_0_[1]\
    );
\BTCTL_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCTL_cs_IBUF,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(2),
      Q => \BTCTL_reg_reg_n_0_[2]\
    );
\BTCTL_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCTL_cs_IBUF,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(3),
      Q => \BTCTL_reg_reg_n_0_[3]\
    );
\BTCTL_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCTL_cs_IBUF,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(4),
      Q => \BTCTL_reg_reg_n_0_[4]\
    );
\BTCTL_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCTL_cs_IBUF,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(5),
      Q => \BTCTL_reg_reg_n_0_[5]\
    );
\BTCTL_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCTL_cs_IBUF,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(6),
      Q => BTOUTEN
    );
\BTCTL_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => BTCTL_cs_IBUF,
      CLR => reset_IBUF,
      D => DataWrite_IBUF(7),
      Q => BTOUTMD
    );
\DataWrite_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(0),
      O => DataWrite_IBUF(0)
    );
\DataWrite_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(10),
      O => DataWrite_IBUF(10)
    );
\DataWrite_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(11),
      O => DataWrite_IBUF(11)
    );
\DataWrite_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(12),
      O => DataWrite_IBUF(12)
    );
\DataWrite_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(13),
      O => DataWrite_IBUF(13)
    );
\DataWrite_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(14),
      O => DataWrite_IBUF(14)
    );
\DataWrite_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(15),
      O => DataWrite_IBUF(15)
    );
\DataWrite_IBUF[16]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(16),
      O => DataWrite_IBUF(16)
    );
\DataWrite_IBUF[17]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(17),
      O => DataWrite_IBUF(17)
    );
\DataWrite_IBUF[18]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(18),
      O => DataWrite_IBUF(18)
    );
\DataWrite_IBUF[19]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(19),
      O => DataWrite_IBUF(19)
    );
\DataWrite_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(1),
      O => DataWrite_IBUF(1)
    );
\DataWrite_IBUF[20]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(20),
      O => DataWrite_IBUF(20)
    );
\DataWrite_IBUF[21]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(21),
      O => DataWrite_IBUF(21)
    );
\DataWrite_IBUF[22]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(22),
      O => DataWrite_IBUF(22)
    );
\DataWrite_IBUF[23]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(23),
      O => DataWrite_IBUF(23)
    );
\DataWrite_IBUF[24]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(24),
      O => DataWrite_IBUF(24)
    );
\DataWrite_IBUF[25]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(25),
      O => DataWrite_IBUF(25)
    );
\DataWrite_IBUF[26]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(26),
      O => DataWrite_IBUF(26)
    );
\DataWrite_IBUF[27]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(27),
      O => DataWrite_IBUF(27)
    );
\DataWrite_IBUF[28]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(28),
      O => DataWrite_IBUF(28)
    );
\DataWrite_IBUF[29]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(29),
      O => DataWrite_IBUF(29)
    );
\DataWrite_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(2),
      O => DataWrite_IBUF(2)
    );
\DataWrite_IBUF[30]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(30),
      O => DataWrite_IBUF(30)
    );
\DataWrite_IBUF[31]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(31),
      O => DataWrite_IBUF(31)
    );
\DataWrite_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(3),
      O => DataWrite_IBUF(3)
    );
\DataWrite_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(4),
      O => DataWrite_IBUF(4)
    );
\DataWrite_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(5),
      O => DataWrite_IBUF(5)
    );
\DataWrite_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(6),
      O => DataWrite_IBUF(6)
    );
\DataWrite_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(7),
      O => DataWrite_IBUF(7)
    );
\DataWrite_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(8),
      O => DataWrite_IBUF(8)
    );
\DataWrite_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DataWrite(9),
      O => DataWrite_IBUF(9)
    );
FrqPreset_ins: entity work.Frequency_Divider
     port map (
      AR(0) => reset_IBUF,
      CLK => clk_IBUF_BUFG,
      Q(1) => \BTCTL_reg_reg_n_0_[4]\,
      Q(0) => \BTCTL_reg_reg_n_0_[3]\,
      preset_clk => preset_clk
    );
PWMout_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => PWMout_OBUF,
      O => PWMout
    );
PWMout_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => PWMout_reg_i_1_n_0,
      G => BTOUTEN,
      GE => '1',
      Q => PWMout_OBUF
    );
PWMout_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"33A3"
    )
        port map (
      I0 => PWMout0,
      I1 => PWMout1,
      I2 => BTOUTEN,
      I3 => BTOUTMD,
      O => PWMout_reg_i_1_n_0
    );
PWMout_reg_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(27),
      I1 => \BTCCR1_reg_reg_n_0_[27]\,
      I2 => \BTCCR1_reg_reg_n_0_[29]\,
      I3 => BTCNT_reg(29),
      I4 => \BTCCR1_reg_reg_n_0_[28]\,
      I5 => BTCNT_reg(28),
      O => PWMout_reg_i_10_n_0
    );
PWMout_reg_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(24),
      I1 => \BTCCR1_reg_reg_n_0_[24]\,
      I2 => \BTCCR1_reg_reg_n_0_[26]\,
      I3 => BTCNT_reg(26),
      I4 => \BTCCR1_reg_reg_n_0_[25]\,
      I5 => BTCNT_reg(25),
      O => PWMout_reg_i_11_n_0
    );
PWMout_reg_i_12: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => PWMout_reg_i_12_n_0,
      CO(2) => PWMout_reg_i_12_n_1,
      CO(1) => PWMout_reg_i_12_n_2,
      CO(0) => PWMout_reg_i_12_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_PWMout_reg_i_12_O_UNCONNECTED(3 downto 0),
      S(3) => PWMout_reg_i_22_n_0,
      S(2) => PWMout_reg_i_23_n_0,
      S(1) => PWMout_reg_i_24_n_0,
      S(0) => PWMout_reg_i_25_n_0
    );
PWMout_reg_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(21),
      I1 => \BTCCR0_reg_reg_n_0_[21]\,
      I2 => \BTCCR0_reg_reg_n_0_[23]\,
      I3 => BTCNT_reg(23),
      I4 => \BTCCR0_reg_reg_n_0_[22]\,
      I5 => BTCNT_reg(22),
      O => PWMout_reg_i_13_n_0
    );
PWMout_reg_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(18),
      I1 => \BTCCR0_reg_reg_n_0_[18]\,
      I2 => \BTCCR0_reg_reg_n_0_[20]\,
      I3 => BTCNT_reg(20),
      I4 => \BTCCR0_reg_reg_n_0_[19]\,
      I5 => BTCNT_reg(19),
      O => PWMout_reg_i_14_n_0
    );
PWMout_reg_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(15),
      I1 => \BTCCR0_reg_reg_n_0_[15]\,
      I2 => \BTCCR0_reg_reg_n_0_[17]\,
      I3 => BTCNT_reg(17),
      I4 => \BTCCR0_reg_reg_n_0_[16]\,
      I5 => BTCNT_reg(16),
      O => PWMout_reg_i_15_n_0
    );
PWMout_reg_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(12),
      I1 => \BTCCR0_reg_reg_n_0_[12]\,
      I2 => \BTCCR0_reg_reg_n_0_[14]\,
      I3 => BTCNT_reg(14),
      I4 => \BTCCR0_reg_reg_n_0_[13]\,
      I5 => BTCNT_reg(13),
      O => PWMout_reg_i_16_n_0
    );
PWMout_reg_i_17: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => PWMout_reg_i_17_n_0,
      CO(2) => PWMout_reg_i_17_n_1,
      CO(1) => PWMout_reg_i_17_n_2,
      CO(0) => PWMout_reg_i_17_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_PWMout_reg_i_17_O_UNCONNECTED(3 downto 0),
      S(3) => PWMout_reg_i_26_n_0,
      S(2) => PWMout_reg_i_27_n_0,
      S(1) => PWMout_reg_i_28_n_0,
      S(0) => PWMout_reg_i_29_n_0
    );
PWMout_reg_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(21),
      I1 => \BTCCR1_reg_reg_n_0_[21]\,
      I2 => \BTCCR1_reg_reg_n_0_[23]\,
      I3 => BTCNT_reg(23),
      I4 => \BTCCR1_reg_reg_n_0_[22]\,
      I5 => BTCNT_reg(22),
      O => PWMout_reg_i_18_n_0
    );
PWMout_reg_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(18),
      I1 => \BTCCR1_reg_reg_n_0_[18]\,
      I2 => \BTCCR1_reg_reg_n_0_[20]\,
      I3 => BTCNT_reg(20),
      I4 => \BTCCR1_reg_reg_n_0_[19]\,
      I5 => BTCNT_reg(19),
      O => PWMout_reg_i_19_n_0
    );
PWMout_reg_i_2: unisim.vcomponents.CARRY4
     port map (
      CI => PWMout_reg_i_4_n_0,
      CO(3) => NLW_PWMout_reg_i_2_CO_UNCONNECTED(3),
      CO(2) => PWMout0,
      CO(1) => PWMout_reg_i_2_n_2,
      CO(0) => PWMout_reg_i_2_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_PWMout_reg_i_2_O_UNCONNECTED(3 downto 0),
      S(3) => '0',
      S(2) => PWMout_reg_i_5_n_0,
      S(1) => PWMout_reg_i_6_n_0,
      S(0) => PWMout_reg_i_7_n_0
    );
PWMout_reg_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(15),
      I1 => \BTCCR1_reg_reg_n_0_[15]\,
      I2 => \BTCCR1_reg_reg_n_0_[17]\,
      I3 => BTCNT_reg(17),
      I4 => \BTCCR1_reg_reg_n_0_[16]\,
      I5 => BTCNT_reg(16),
      O => PWMout_reg_i_20_n_0
    );
PWMout_reg_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(12),
      I1 => \BTCCR1_reg_reg_n_0_[12]\,
      I2 => \BTCCR1_reg_reg_n_0_[14]\,
      I3 => BTCNT_reg(14),
      I4 => \BTCCR1_reg_reg_n_0_[13]\,
      I5 => BTCNT_reg(13),
      O => PWMout_reg_i_21_n_0
    );
PWMout_reg_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(9),
      I1 => \BTCCR0_reg_reg_n_0_[9]\,
      I2 => \BTCCR0_reg_reg_n_0_[11]\,
      I3 => BTCNT_reg(11),
      I4 => \BTCCR0_reg_reg_n_0_[10]\,
      I5 => BTCNT_reg(10),
      O => PWMout_reg_i_22_n_0
    );
PWMout_reg_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(6),
      I1 => \BTCCR0_reg_reg_n_0_[6]\,
      I2 => \BTCCR0_reg_reg_n_0_[8]\,
      I3 => BTCNT_reg(8),
      I4 => \BTCCR0_reg_reg_n_0_[7]\,
      I5 => BTCNT_reg(7),
      O => PWMout_reg_i_23_n_0
    );
PWMout_reg_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(3),
      I1 => \BTCCR0_reg_reg_n_0_[3]\,
      I2 => \BTCCR0_reg_reg_n_0_[5]\,
      I3 => BTCNT_reg(5),
      I4 => \BTCCR0_reg_reg_n_0_[4]\,
      I5 => BTCNT_reg(4),
      O => PWMout_reg_i_24_n_0
    );
PWMout_reg_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(0),
      I1 => \BTCCR0_reg_reg_n_0_[0]\,
      I2 => \BTCCR0_reg_reg_n_0_[2]\,
      I3 => BTCNT_reg(2),
      I4 => \BTCCR0_reg_reg_n_0_[1]\,
      I5 => BTCNT_reg(1),
      O => PWMout_reg_i_25_n_0
    );
PWMout_reg_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(9),
      I1 => \BTCCR1_reg_reg_n_0_[9]\,
      I2 => \BTCCR1_reg_reg_n_0_[11]\,
      I3 => BTCNT_reg(11),
      I4 => \BTCCR1_reg_reg_n_0_[10]\,
      I5 => BTCNT_reg(10),
      O => PWMout_reg_i_26_n_0
    );
PWMout_reg_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(6),
      I1 => \BTCCR1_reg_reg_n_0_[6]\,
      I2 => \BTCCR1_reg_reg_n_0_[8]\,
      I3 => BTCNT_reg(8),
      I4 => \BTCCR1_reg_reg_n_0_[7]\,
      I5 => BTCNT_reg(7),
      O => PWMout_reg_i_27_n_0
    );
PWMout_reg_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(3),
      I1 => \BTCCR1_reg_reg_n_0_[3]\,
      I2 => \BTCCR1_reg_reg_n_0_[5]\,
      I3 => BTCNT_reg(5),
      I4 => \BTCCR1_reg_reg_n_0_[4]\,
      I5 => BTCNT_reg(4),
      O => PWMout_reg_i_28_n_0
    );
PWMout_reg_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(0),
      I1 => \BTCCR1_reg_reg_n_0_[0]\,
      I2 => \BTCCR1_reg_reg_n_0_[2]\,
      I3 => BTCNT_reg(2),
      I4 => \BTCCR1_reg_reg_n_0_[1]\,
      I5 => BTCNT_reg(1),
      O => PWMout_reg_i_29_n_0
    );
PWMout_reg_i_3: unisim.vcomponents.CARRY4
     port map (
      CI => PWMout_reg_i_8_n_0,
      CO(3) => NLW_PWMout_reg_i_3_CO_UNCONNECTED(3),
      CO(2) => PWMout1,
      CO(1) => PWMout_reg_i_3_n_2,
      CO(0) => PWMout_reg_i_3_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_PWMout_reg_i_3_O_UNCONNECTED(3 downto 0),
      S(3) => '0',
      S(2) => PWMout_reg_i_9_n_0,
      S(1) => PWMout_reg_i_10_n_0,
      S(0) => PWMout_reg_i_11_n_0
    );
PWMout_reg_i_4: unisim.vcomponents.CARRY4
     port map (
      CI => PWMout_reg_i_12_n_0,
      CO(3) => PWMout_reg_i_4_n_0,
      CO(2) => PWMout_reg_i_4_n_1,
      CO(1) => PWMout_reg_i_4_n_2,
      CO(0) => PWMout_reg_i_4_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_PWMout_reg_i_4_O_UNCONNECTED(3 downto 0),
      S(3) => PWMout_reg_i_13_n_0,
      S(2) => PWMout_reg_i_14_n_0,
      S(1) => PWMout_reg_i_15_n_0,
      S(0) => PWMout_reg_i_16_n_0
    );
PWMout_reg_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => BTCNT_reg(30),
      I1 => \BTCCR0_reg_reg_n_0_[30]\,
      I2 => BTCNT_reg(31),
      I3 => \BTCCR0_reg_reg_n_0_[31]\,
      O => PWMout_reg_i_5_n_0
    );
PWMout_reg_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(27),
      I1 => \BTCCR0_reg_reg_n_0_[27]\,
      I2 => \BTCCR0_reg_reg_n_0_[29]\,
      I3 => BTCNT_reg(29),
      I4 => \BTCCR0_reg_reg_n_0_[28]\,
      I5 => BTCNT_reg(28),
      O => PWMout_reg_i_6_n_0
    );
PWMout_reg_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => BTCNT_reg(24),
      I1 => \BTCCR0_reg_reg_n_0_[24]\,
      I2 => \BTCCR0_reg_reg_n_0_[26]\,
      I3 => BTCNT_reg(26),
      I4 => \BTCCR0_reg_reg_n_0_[25]\,
      I5 => BTCNT_reg(25),
      O => PWMout_reg_i_7_n_0
    );
PWMout_reg_i_8: unisim.vcomponents.CARRY4
     port map (
      CI => PWMout_reg_i_17_n_0,
      CO(3) => PWMout_reg_i_8_n_0,
      CO(2) => PWMout_reg_i_8_n_1,
      CO(1) => PWMout_reg_i_8_n_2,
      CO(0) => PWMout_reg_i_8_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_PWMout_reg_i_8_O_UNCONNECTED(3 downto 0),
      S(3) => PWMout_reg_i_18_n_0,
      S(2) => PWMout_reg_i_19_n_0,
      S(1) => PWMout_reg_i_20_n_0,
      S(0) => PWMout_reg_i_21_n_0
    );
PWMout_reg_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => BTCNT_reg(30),
      I1 => \BTCCR1_reg_reg_n_0_[30]\,
      I2 => BTCNT_reg(31),
      I3 => \BTCCR1_reg_reg_n_0_[31]\,
      O => PWMout_reg_i_9_n_0
    );
Set_BTIFG_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Set_BTIFG_OBUF,
      O => Set_BTIFG
    );
Set_BTIFG_OBUF_inst_i_1: unisim.vcomponents.MUXF7
     port map (
      I0 => Set_BTIFG_OBUF_inst_i_2_n_0,
      I1 => Set_BTIFG_OBUF_inst_i_3_n_0,
      O => Set_BTIFG_OBUF,
      S => \BTCTL_reg_reg_n_0_[2]\
    );
Set_BTIFG_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BTCNT_reg(11),
      I1 => BTCNT_reg(7),
      I2 => \BTCTL_reg_reg_n_0_[1]\,
      I3 => BTCNT_reg(3),
      I4 => \BTCTL_reg_reg_n_0_[0]\,
      I5 => BTCNT_reg(0),
      O => Set_BTIFG_OBUF_inst_i_2_n_0
    );
Set_BTIFG_OBUF_inst_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BTCNT_reg(25),
      I1 => BTCNT_reg(23),
      I2 => \BTCTL_reg_reg_n_0_[1]\,
      I3 => BTCNT_reg(19),
      I4 => \BTCTL_reg_reg_n_0_[0]\,
      I5 => BTCNT_reg(15),
      O => Set_BTIFG_OBUF_inst_i_3_n_0
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
preset_clk_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => preset_clk,
      O => preset_clk_BUFG
    );
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
    );
\timer_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => BTCNT_reg(0),
      O => plusOp(0)
    );
\timer_cnt[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \BTCTL_reg_reg_n_0_[5]\,
      O => \timer_cnt[31]_i_1_n_0\
    );
\timer_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(0),
      Q => BTCNT_reg(0),
      R => '0'
    );
\timer_cnt_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(10),
      Q => BTCNT_reg(10),
      R => '0'
    );
\timer_cnt_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(11),
      Q => BTCNT_reg(11),
      R => '0'
    );
\timer_cnt_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(12),
      Q => BTCNT_reg(12),
      R => '0'
    );
\timer_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_cnt_reg[8]_i_1_n_0\,
      CO(3) => \timer_cnt_reg[12]_i_1_n_0\,
      CO(2) => \timer_cnt_reg[12]_i_1_n_1\,
      CO(1) => \timer_cnt_reg[12]_i_1_n_2\,
      CO(0) => \timer_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(12 downto 9),
      S(3 downto 0) => BTCNT_reg(12 downto 9)
    );
\timer_cnt_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(13),
      Q => BTCNT_reg(13),
      R => '0'
    );
\timer_cnt_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(14),
      Q => BTCNT_reg(14),
      R => '0'
    );
\timer_cnt_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(15),
      Q => BTCNT_reg(15),
      R => '0'
    );
\timer_cnt_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(16),
      Q => BTCNT_reg(16),
      R => '0'
    );
\timer_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_cnt_reg[12]_i_1_n_0\,
      CO(3) => \timer_cnt_reg[16]_i_1_n_0\,
      CO(2) => \timer_cnt_reg[16]_i_1_n_1\,
      CO(1) => \timer_cnt_reg[16]_i_1_n_2\,
      CO(0) => \timer_cnt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(16 downto 13),
      S(3 downto 0) => BTCNT_reg(16 downto 13)
    );
\timer_cnt_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(17),
      Q => BTCNT_reg(17),
      R => '0'
    );
\timer_cnt_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(18),
      Q => BTCNT_reg(18),
      R => '0'
    );
\timer_cnt_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(19),
      Q => BTCNT_reg(19),
      R => '0'
    );
\timer_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(1),
      Q => BTCNT_reg(1),
      R => '0'
    );
\timer_cnt_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(20),
      Q => BTCNT_reg(20),
      R => '0'
    );
\timer_cnt_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_cnt_reg[16]_i_1_n_0\,
      CO(3) => \timer_cnt_reg[20]_i_1_n_0\,
      CO(2) => \timer_cnt_reg[20]_i_1_n_1\,
      CO(1) => \timer_cnt_reg[20]_i_1_n_2\,
      CO(0) => \timer_cnt_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(20 downto 17),
      S(3 downto 0) => BTCNT_reg(20 downto 17)
    );
\timer_cnt_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(21),
      Q => BTCNT_reg(21),
      R => '0'
    );
\timer_cnt_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(22),
      Q => BTCNT_reg(22),
      R => '0'
    );
\timer_cnt_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(23),
      Q => BTCNT_reg(23),
      R => '0'
    );
\timer_cnt_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(24),
      Q => BTCNT_reg(24),
      R => '0'
    );
\timer_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_cnt_reg[20]_i_1_n_0\,
      CO(3) => \timer_cnt_reg[24]_i_1_n_0\,
      CO(2) => \timer_cnt_reg[24]_i_1_n_1\,
      CO(1) => \timer_cnt_reg[24]_i_1_n_2\,
      CO(0) => \timer_cnt_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(24 downto 21),
      S(3 downto 0) => BTCNT_reg(24 downto 21)
    );
\timer_cnt_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(25),
      Q => BTCNT_reg(25),
      R => '0'
    );
\timer_cnt_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(26),
      Q => BTCNT_reg(26),
      R => '0'
    );
\timer_cnt_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(27),
      Q => BTCNT_reg(27),
      R => '0'
    );
\timer_cnt_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(28),
      Q => BTCNT_reg(28),
      R => '0'
    );
\timer_cnt_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_cnt_reg[24]_i_1_n_0\,
      CO(3) => \timer_cnt_reg[28]_i_1_n_0\,
      CO(2) => \timer_cnt_reg[28]_i_1_n_1\,
      CO(1) => \timer_cnt_reg[28]_i_1_n_2\,
      CO(0) => \timer_cnt_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(28 downto 25),
      S(3 downto 0) => BTCNT_reg(28 downto 25)
    );
\timer_cnt_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(29),
      Q => BTCNT_reg(29),
      R => '0'
    );
\timer_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(2),
      Q => BTCNT_reg(2),
      R => '0'
    );
\timer_cnt_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(30),
      Q => BTCNT_reg(30),
      R => '0'
    );
\timer_cnt_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(31),
      Q => BTCNT_reg(31),
      R => '0'
    );
\timer_cnt_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_cnt_reg[28]_i_1_n_0\,
      CO(3 downto 2) => \NLW_timer_cnt_reg[31]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \timer_cnt_reg[31]_i_2_n_2\,
      CO(0) => \timer_cnt_reg[31]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_timer_cnt_reg[31]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => plusOp(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => BTCNT_reg(31 downto 29)
    );
\timer_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(3),
      Q => BTCNT_reg(3),
      R => '0'
    );
\timer_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(4),
      Q => BTCNT_reg(4),
      R => '0'
    );
\timer_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \timer_cnt_reg[4]_i_1_n_0\,
      CO(2) => \timer_cnt_reg[4]_i_1_n_1\,
      CO(1) => \timer_cnt_reg[4]_i_1_n_2\,
      CO(0) => \timer_cnt_reg[4]_i_1_n_3\,
      CYINIT => BTCNT_reg(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(4 downto 1),
      S(3 downto 0) => BTCNT_reg(4 downto 1)
    );
\timer_cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(5),
      Q => BTCNT_reg(5),
      R => '0'
    );
\timer_cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(6),
      Q => BTCNT_reg(6),
      R => '0'
    );
\timer_cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(7),
      Q => BTCNT_reg(7),
      R => '0'
    );
\timer_cnt_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(8),
      Q => BTCNT_reg(8),
      R => '0'
    );
\timer_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_cnt_reg[4]_i_1_n_0\,
      CO(3) => \timer_cnt_reg[8]_i_1_n_0\,
      CO(2) => \timer_cnt_reg[8]_i_1_n_1\,
      CO(1) => \timer_cnt_reg[8]_i_1_n_2\,
      CO(0) => \timer_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(8 downto 5),
      S(3 downto 0) => BTCNT_reg(8 downto 5)
    );
\timer_cnt_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => preset_clk_BUFG,
      CE => \timer_cnt[31]_i_1_n_0\,
      D => plusOp(9),
      Q => BTCNT_reg(9),
      R => '0'
    );
end STRUCTURE;
