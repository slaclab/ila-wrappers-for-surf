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
use work.StdRtlPkg.all;
use work.AxiLitePkg.all;
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
      sAxilWrite : in  AxiLiteWriteSlaveType
   );
end entity IlaAxiLite;

architecture IlaAxiLiteImpl of IlaAxiLite is
begin
   U_ILA : component IlaAxiLiteIP
      port map (
         clk            => axilClk,
         trig_in        => trigIn,
         trig_in_ack    => trigInAck,
         trig_out       => trigOut,
         trig_out_ack   => trigOutAck,
         probe0         => mAxilRead.araddr,
         probe1         => mAxilRead.arprot,
         probe2(0)      => mAxilRead.arvalid,
         probe3(0)      => sAxilRead.arready,

         probe4         => sAxilRead.rdata,
         probe5         => sAxilRead.rresp,
         probe6(0)      => sAxilRead.rvalid,
         probe7(0)      => mAxilRead.rready,

         probe8         => mAxilWrite.awaddr,
         probe9         => mAxilWrite.awprot,
         probe10(0)     => mAxilWrite.awvalid,
         probe11(0)     => sAxilWrite.awready,

         probe12        => mAxilWrite.wdata,
         probe13        => mAxilWrite.wstrb,
         probe14(0)     => mAxilWrite.wvalid,
         probe15(0)     => sAxilWrite.wready,

         probe16        => sAxilWrite.bresp,
         probe17(0)     => sAxilWrite.bvalid,
         probe18(0)     => mAxilWrite.bready
      );
end architecture IlaAxiLiteImpl;
