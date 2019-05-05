-------------------------------------------------------------------------------
-- File       : IlaAxiStream.vhd
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: ILA wired for monitoring AxiStream signals
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
use work.StdRtlPkg.all;
use work.AxiStreamPkg.all;
use work.IlaWrappersPkg.all;

entity IlaAxiStream is
   port (
      axisClk    : in  sl;
      trigIn     : in  sl := '0';
      trigInAck  : out sl;
      trigOut    : out sl;
      trigOutAck : in  sl := '1';
      mAxis      : in  AxiStreamMasterType;
      sAxis      : in  AxiStreamSlaveType
   );
end entity IlaAxiStream;

architecture IlaAxiStreamImpl of IlaAxiStream is
begin
   U_ILA : component Ila_256
      port map (
         clk                  => axisClk,
         trig_in              => trigIn,
         trig_in_ack          => trigInAck,
         trig_out             => trigOut,
         trig_out_ack         => trigOutAck,

         probe0               => mAxis.tData( 63 downto  0),
         probe1               => mAxis.tData(127 downto 64),
         probe2(15 downto  0) => mAxis.tStrb( 15 downto  0),
         probe2(31 downto 16) => mAxis.tKeep( 15 downto  0),
         probe2(39 downto 32) => mAxis.tDest,
         probe2(47 downto 40) => mAxis.tId,
         probe2(          48) => mAxis.tLast,
         probe2(          49) => mAxis.tValid,
         probe2(          50) => sAxis.tReady,
         probe2(63 downto 51) => (others => '0'),

         probe3               => mAxis.tUser(63 downto  0)
      );
end architecture IlaAxiStreamImpl;
