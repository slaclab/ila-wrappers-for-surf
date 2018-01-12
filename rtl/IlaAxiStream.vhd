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
   U_ILA : component IlaAxiStreamIP
      port map (
         clk                  => axisClk,
         trig_in              => trigIn,
         trig_in_ack          => trigInAck,
         trig_out             => trigOut,
         trig_out_ack         => trigOutAck,

         probe0               => mAxis.tData( 63 downto  0),
         probe1               => mAxis.tData(127 downto 64),
         probe2               => mAxis.tStrb,
         probe3               => mAxis.tKeep,
         probe4               => mAxis.tDest,
         probe5               => mAxis.tId,
         probe6               => mAxis.tUser(63 downto  0),
         probe7(0)            => mAxis.tLast,
         probe8(0)            => mAxis.tValid,
         probe9(0)            => sAxis.tReady
      );
end architecture IlaAxiStreamImpl;
