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
