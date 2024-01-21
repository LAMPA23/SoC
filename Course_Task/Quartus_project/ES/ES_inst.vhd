	component ES is
		port (
			clk_clk          : in  std_logic                     := 'X'; -- clk
			reset_reset_n    : in  std_logic                     := 'X'; -- reset_n
			to_leds_readdata : out std_logic_vector(31 downto 0)         -- readdata
		);
	end component ES;

	u0 : component ES
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --     clk.clk
			reset_reset_n    => CONNECTED_TO_reset_reset_n,    --   reset.reset_n
			to_leds_readdata => CONNECTED_TO_to_leds_readdata  -- to_leds.readdata
		);

