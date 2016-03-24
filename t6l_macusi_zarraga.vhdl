-- Macusi, Daniellika G.
-- Zarraga, Celyne R.
-- Section: CMSC 132 T-6L

library IEEE; use IEEE.std_logic_1164.all;

entity t6l_macusi_zarraga is
	
	port(alarm: out std_logic; inBoggis, outBoggis, inBunce, outBunce, inBean, outBean: in std_logic);

end entity;

architecture macusi_zarraga_buzzerSwitch of t6l_macusi_zarraga is 

	begin

		alarm <= ((inBoggis or inBunce or inBean) and (outBoggis or outBunce or outBean));		-- alarm = (inBoggis + inBunce + inBean) * (outBoggis + outBunce + outBean)		
			-- if there are at least one in buzzer and one out buzzer that is on, then the alarm will be triggered
		
end architecture;
	
