-- Macusi, Daniellika G.
-- Zarraga, Celyne R.
-- Section: CMSC 132 T-6L

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity t6l_macusi_zarraga_tb is
end;

architecture t6l_macusi_zarraga_tb of t6l_macusi_zarraga_tb is
	signal inBoggis, outBoggis, inBunce, outBunce, inBean, outBean, alarm: std_logic;

	component t6l_macusi_zarraga is

		port(alarm: out std_logic; inBoggis, outBoggis, inBunce, outBunce, inBean, outBean: in std_logic);
	
	end component;

	begin

		uut: component t6l_macusi_zarraga port map (alarm, inBoggis, outBoggis, inBunce, outBunce, inBean, outBean);

		process

			variable error_count: integer :=0;
			variable inputs: unsigned(5 downto 0);
			variable expected_alarm: std_logic;

		begin

			for count in 0 to 63 loop
			
			inputs := TO_UNSIGNED(count, 6);

			inBoggis <= inputs(5);
			outBoggis <= inputs(4);
			inBunce <= inputs(3);
			outBunce <= inputs(2);
			inBean <= inputs(1);
			outBean <= inputs(0);
			
			--if conditions to get expected_alarm value

			if(count=0) then	
				expected_alarm := '0';

			else
				if(count=3) then expected_alarm := '1';
				elsif(count>=6 and count<=7) then expected_alarm := '1';
				elsif(count=9) then expected_alarm := '1';
				elsif(count>=11 and count<=15) then expected_alarm := '1';
				elsif(count>=18 and count<=19) then expected_alarm := '1';
				elsif(count>=22 and count<=31) then expected_alarm := '1';
				elsif(count=33) then expected_alarm := '1';
				elsif(count>=35 and count<=39) then expected_alarm := '1';
				elsif(count=41) then expected_alarm := '1';
				elsif(count>=43 and count<=63) then expected_alarm := '1';
				else expected_alarm := '0';
				end if; 
			end if;

			wait for 10 ns;
			
			assert (expected_alarm = alarm) report "ERROR: Expected alarm " & std_logic'image(expected_alarm) & " at time " & time'image(now);
				
			if(expected_alarm /= alarm) then error_count := error_count + 1;
			
			end if;
			end loop;
		
			wait for 10 ns;
		
			assert (error_count=0) report "ERROR: There were " & integer'image(error_count) & " errors!";
				
			if(error_count = 0) then
				report "Simulation completed with NO errors.";
			end if;
		
			wait;
					
		end process;
	end architecture;
