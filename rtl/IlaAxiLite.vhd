-------------------------------------------------------------------------------
-- File       : IlaAxiLite.vhd
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: ILA wired for monitoring AxiLite signals
-------------------------------------------------------------------------------
-- This file is part of 'ILA Wrappers for SURF Library'.
-- It is subject to the license terms in the LICENSE.txt file found in the 
-- top-level directory of this distribution and at: 
--    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html. 
-- No part of 'ILA Wrappers for SURF Library', including this file, 
-- may be copied, modified, propagated, or distributed except according to 
-- the terms contained in the LICENSE.txt file.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library surf;
use surf.StdRtlPkg.all;
use surf.AxiLitePkg.all;

use work.IlaWrappersPkg.all;

entity IlaAxiLite is
   port (
      axilClk    : in  sl;
      trigIn     : in  sl := '0';
      trigInAck  : out sl;
      trigOut    : out sl;
      trigOutAck : in  sl := '1';
      mAxilRead  : in  AxiLiteReadMasterType;
      sAxilRead  : in  AxiLiteReadSlaveType;
      mAxilWrite : in  AxiLiteWriteMasterType;
      sAxilWrite : in  AxiLiteWriteSlaveType;
      spare0     : in  slv(23 downto 0) := (others => '0');
      spare1     : in  slv(23 downto 0) := (others => '0');
      spare2     : in  slv(23 downto 0) := (others => '0')
   );
end entity IlaAxiLite;

architecture IlaAxiLiteImpl of IlaAxiLite is
begin
   U_ILA : component Ila_256
      port map (
         clk                  => axilClk,
         trig_in              => trigIn,
         trig_in_ack          => trigInAck,
         trig_out             => trigOut,
         trig_out_ack         => trigOutAck,

         probe0(31 downto  0) => mAxilRead.araddr,
         probe0(34 downto 32) => mAxilRead.arprot,
         probe0(          35) => mAxilRead.arvalid,
         probe0(          36) => sAxilRead.arready,
         probe0(39 downto 37) => (others => '0'),
         probe0(63 downto 40) => spare0,

         probe1(31 downto  0) => sAxilRead.rdata,
         probe1(33 downto 32) => sAxilRead.rresp,
         probe1(          34) => sAxilRead.rvalid,
         probe1(          35) => mAxilRead.rready,
         probe1(39 downto 36) => (others => '0'),
         probe1(63 downto 40) => spare1,

         probe2(31 downto  0) => mAxilWrite.awaddr,
         probe2(34 downto 32) => mAxilWrite.awprot,
         probe2(          35) => mAxilWrite.awvalid,
         probe2(          36) => sAxilWrite.awready,
         probe2(39 downto 37) => (others => '0'),
         probe2(63 downto 40) => spare2,

         probe3(31 downto  0) => mAxilWrite.wdata,
         probe3(35 downto 32) => mAxilWrite.wstrb,
         probe3(          36) => mAxilWrite.wvalid,
         probe3(          37) => sAxilWrite.wready,

         probe3(39 downto 38) => sAxilWrite.bresp,
         probe3(          40) => sAxilWrite.bvalid,
         probe3(          41) => mAxilWrite.bready,
         probe3(63 downto 42) => (others => '0')
      );
end architecture IlaAxiLiteImpl;
