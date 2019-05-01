-------------------------------------------------------------------------------
-- File       : IlaWrappersPkg.vhd
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: Package File
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

package IlaWrappersPkg is

   component Ila_256 is
      port (
         clk            : in  sl;
         trig_out       : out sl;
         trig_out_ack   : in  sl := '1';
         trig_in        : in  sl := '0';
         trig_in_ack    : out sl;
         probe0         : in  slv(63 downto 0) := (others => '0');
         probe1         : in  slv(63 downto 0) := (others => '0');
         probe2         : in  slv(63 downto 0) := (others => '0');
         probe3         : in  slv(63 downto 0) := (others => '0')
      );
   end component Ila_256;

end package IlaWrappersPkg;
