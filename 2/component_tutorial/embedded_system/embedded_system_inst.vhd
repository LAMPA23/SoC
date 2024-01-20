	component embedded_system is
		port (
			clk_clk         : in  std_logic                     := 'X';             -- clk
			reset_reset_n   : in  std_logic                     := 'X';             -- reset_n
			to_hex_readdata : out std_logic_vector(31 downto 0);                    -- readdata
			switches_export : in  std_logic_vector(3 downto 0)  := (others => 'X')  -- export
		);
	end component embedded_system;

	u0 : component embedded_system
		port map (
			clk_clk         => CONNECTED_TO_clk_clk,         --      clk.clk
			reset_reset_n   => CONNECTED_TO_reset_reset_n,   --    reset.reset_n
			to_hex_readdata => CONNECTED_TO_to_hex_readdata, --   to_hex.readdata
			switches_export => CONNECTED_TO_switches_export  -- switches.export
		);

