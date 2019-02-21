
-----------------------------------------------------------------------------------------------

	  library IEEE;
	  use IEEE.std_logic_1164.all;
	  
	entity sistema_de_ativacao_de_cargas is port
	(
		lamp : inout std_logic_vector(0 to 7):="00000000";
		ar : inout std_logic_vector(0 to 2):="00000000";
		rx : in std_logic;
		clk : in std_logic
	);
	end sistema_de_ativacao_de_cargas;
	
	architecture  estrutura of sistema_de_ativacao_de_cargas is
	signal dados : std_logic_vector( 137 downto 0):="000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal  contador : integer := 0;
	signal controle_1 : integer := 0;
   signal controle_2 : integer := 1;
	signal aux_lamp : std_logic_vector(0 to 7);
	signal aux_ar : std_logic_vector(0 to 2);
		
	begin
----------------------------
	
	 processo_de_inicializacao : process
	begin
	
	wait until rx'event and rx='1' and  controle_1/= controle_2;
		 aux_lamp<=lamp;
		 aux_ar<= ar;
		 controle_1<=  controle_1 + 1;
				
	end process  processo_de_inicializacao;
----------------------------
	 ativar_registrador : process(clk)
	variable  contador_clk  : integer := 0;
	
	begin	
		
		if(clk'event and clk='1' and  controle_1= controle_2) then
			 contador_clk  :=  contador_clk  + 1;
			
			if( contador_clk =5208) then
				 contador_clk :=0;
			end if;
			
			if( contador_clk  = 2604) then
					
					 dados(137)<=rx;
					 dados(136 downto 0)<= dados(137 downto 1);
					
				 contador <=  contador+1;
			
				if( contador=138) then 
					 controle_2<=  controle_2 +1;
					 contador<=0;

				end if;
			end if;
		end if;
				
	end process  ativar_registrador;
  
---------------------------------------- lampadas --------------------------------------------00100000 11011111
				
		ativar_cargas : process( controle_2)
		begin
																																																																																																	----
		--lampada 1 

--                                           1 --    l 	  -- space  --   r    -    e         d    --   n    --   e    --   c    --   a
  
		if( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01100011" and  dados(27 downto 20)=not "01100101" and  dados(37 downto 30)=not "01101110" and  dados(47 downto 40)= not "01100100" and  dados(57 downto 50)= not "01100101" and  dados(67 downto 60)= not "01110010" and  dados(77 downto 70)= not "00100000" and  dados(87 downto 80)= not "01101100" and  dados(97 downto 90)= not "00110001") then  
			lamp(0)<='1';

--                                                    1   --    l   -- space  --    r   --   a    --   g    --   a    --    p   --   a

		elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01110000" and  dados(27 downto 20)=not "01100001" and  dados(37 downto 30)=not "01100111" and  dados(47 downto 40)= not "01100001" and  dados(57 downto 50)= not "01110010" and  dados(67 downto 60)= not "00100000" and  dados(77 downto 70)= not "01101100" and  dados(87 downto 80)= not "00110001") then 
			lamp(0)<='0';
			
			---- lampada 2
			
			elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01100011" and  dados(27 downto 20)=not "01100101" and  dados(37 downto 30)=not "01101110" and  dados(47 downto 40)= not "01100100" and  dados(57 downto 50)= not "01100101" and  dados(67 downto 60)= not "01110010" and  dados(77 downto 70)= not "00100000" and  dados(87 downto 80)= not "01101100" and  dados(97 downto 90)= not "00110010") then  
			lamp(1)<='1';

--                                                    1   --    l   -- space  --    r   --   a    --   g    --   a    --    p   --   a

		elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01110000" and  dados(27 downto 20)=not "01100001" and  dados(37 downto 30)=not "01100111" and  dados(47 downto 40)= not "01100001" and  dados(57 downto 50)= not "01110010" and  dados(67 downto 60)= not "00100000" and  dados(77 downto 70)= not "01101100" and  dados(87 downto 80)= not "00110010") then 
			lamp(1)<='0';
			
			---- lamapada 3
			
			
			elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01100011" and  dados(27 downto 20)=not "01100101" and  dados(37 downto 30)=not "01101110" and  dados(47 downto 40)= not "01100100" and  dados(57 downto 50)= not "01100101" and  dados(67 downto 60)= not "01110010" and  dados(77 downto 70)= not "00100000" and  dados(87 downto 80)= not "01101100" and  dados(97 downto 90)= not "00110011") then  
			lamp(2)<='1';

--                                                    1   --    l   -- space  --    r   --   a    --   g    --   a    --    p   --   a

		elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01110000" and  dados(27 downto 20)=not "01100001" and  dados(37 downto 30)=not "01100111" and  dados(47 downto 40)= not "01100001" and  dados(57 downto 50)= not "01110010" and  dados(67 downto 60)= not "00100000" and  dados(77 downto 70)= not "01101100" and  dados(87 downto 80)= not "00110011") then 
			lamp(2)<='0';
			
			
			------ lampada 4
			
			
			elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01100011" and  dados(27 downto 20)=not "01100101" and  dados(37 downto 30)=not "01101110" and  dados(47 downto 40)= not "01100100" and  dados(57 downto 50)= not "01100101" and  dados(67 downto 60)= not "01110010" and  dados(77 downto 70)= not "00100000" and  dados(87 downto 80)= not "01101100" and  dados(97 downto 90)= not "00110100") then  
			lamp(3)<='1';

--                                                    1   --    l   -- space  --    r   --   a    --   g    --   a    --    p   --   a

		elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01110000" and  dados(27 downto 20)=not "01100001" and  dados(37 downto 30)=not "01100111" and  dados(47 downto 40)= not "01100001" and  dados(57 downto 50)= not "01110010" and  dados(67 downto 60)= not "00100000" and  dados(77 downto 70)= not "01101100" and  dados(87 downto 80)= not "00110100") then 
			lamp(3)<='0';
			
			
			----- lampada 5
			
			
			elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01100011" and  dados(27 downto 20)=not "01100101" and  dados(37 downto 30)=not "01101110" and  dados(47 downto 40)= not "01100100" and  dados(57 downto 50)= not "01100101" and  dados(67 downto 60)= not "01110010" and  dados(77 downto 70)= not "00100000" and  dados(87 downto 80)= not "01101100" and  dados(97 downto 90)= not "00110101") then  
			lamp(4)<='1';

--                                                    1   --    l   -- space  --    r   --   a    --   g    --   a    --    p   --   a

		elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01110000" and  dados(27 downto 20)=not "01100001" and  dados(37 downto 30)=not "01100111" and  dados(47 downto 40)= not "01100001" and  dados(57 downto 50)= not "01110010" and  dados(67 downto 60)= not "00100000" and  dados(77 downto 70)= not "01101100" and  dados(87 downto 80)= not "00110101") then 
			lamp(4)<='0';
			
			
			------ lampada 6
			
			elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01100011" and  dados(27 downto 20)=not "01100101" and  dados(37 downto 30)=not "01101110" and  dados(47 downto 40)= not "01100100" and  dados(57 downto 50)= not "01100101" and  dados(67 downto 60)= not "01110010" and  dados(77 downto 70)= not "00100000" and  dados(87 downto 80)= not "01101100" and  dados(97 downto 90)= not "00110110") then  
			lamp(5)<='1';

--                                                    1   --    l   -- space  --    r   --   a    --   g    --   a    --    p   --   a

		elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01110000" and  dados(27 downto 20)=not "01100001" and  dados(37 downto 30)=not "01100111" and  dados(47 downto 40)= not "01100001" and  dados(57 downto 50)= not "01110010" and  dados(67 downto 60)= not "00100000" and  dados(77 downto 70)= not "01101100" and  dados(87 downto 80)= not "00110110") then 
			lamp(5)<='0';
			
			
			------ lampada 7
			
			
			elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01100011" and  dados(27 downto 20)=not "01100101" and  dados(37 downto 30)=not "01101110" and  dados(47 downto 40)= not "01100100" and  dados(57 downto 50)= not "01100101" and  dados(67 downto 60)= not "01110010" and  dados(77 downto 70)= not "00100000" and  dados(87 downto 80)= not "01101100" and  dados(97 downto 90)= not "00110111") then  
			lamp(6)<='1';

--                                                    1   --    l   -- space  --    r   --   a    --   g    --   a    --    p   --   a

		elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01110000" and  dados(27 downto 20)=not "01100001" and  dados(37 downto 30)=not "01100111" and  dados(47 downto 40)= not "01100001" and  dados(57 downto 50)= not "01110010" and  dados(67 downto 60)= not "00100000" and  dados(77 downto 70)= not "01101100" and  dados(87 downto 80)= not "00110111") then 
			lamp(6)<='0';
			
			
			-------- lampada 8
			
			elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01100011" and  dados(27 downto 20)=not "01100101" and  dados(37 downto 30)=not "01101110" and  dados(47 downto 40)= not "01100100" and  dados(57 downto 50)= not "01100101" and  dados(67 downto 60)= not "01110010" and  dados(77 downto 70)= not "00100000" and  dados(87 downto 80)= not "01101100" and  dados(97 downto 90)= not "00111000") then  
			lamp(7)<='1';

--                                                    1   --    l   -- space  --    r   --   a    --   g    --   a    --    p   --   a

		elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01110000" and  dados(27 downto 20)=not "01100001" and  dados(37 downto 30)=not "01100111" and  dados(47 downto 40)= not "01100001" and  dados(57 downto 50)= not "01110010" and  dados(67 downto 60)= not "00100000" and  dados(77 downto 70)= not "01101100" and  dados(87 downto 80)= not "00111000") then 
			lamp(7)<='0';
		
		-------------- ar 0
		
	elsif( dados(7 downto 0)= not "01101100" and  dados(17 downto 10)=not "01101001" and  dados(27 downto 20)=not "01100111" and  dados(37 downto 30)=not "01100001" and  dados(47 downto 40)= not "01110010" and  dados(57 downto 50) = not "00100000" and  dados(67 downto 60)= not "01100001" and  dados(77 downto 70)= not "01110010" and  dados(87 downto 80) = not "00110001") then  
	ar(0)<= '1';
	
	elsif( dados(7 downto 0) = not "01100100" and  dados(17 downto 10)=not "01100101" and  dados(27 downto 20)= not "01110011" and  dados(37 downto 30)= not "01101100" and  dados(47 downto 40)=not "01101001" and  dados(57 downto 50)=not "01100111" and  dados(67 downto 60)=not "01100001" and  dados(77 downto 70)= not "01110010" and  dados(87 downto 80) = not "00100000" and  dados(97 downto 90)= not "01100001" and  dados(107 downto 100)= not "01110010" and  dados(117 downto 110) = not "00110001") then  
	ar(0)<= '0';
	
	-------------- ar 1
		
	elsif( dados(7 downto 0)= not "01101100" and  dados(17 downto 10)=not "01101001" and  dados(27 downto 20)=not "01100111" and  dados(37 downto 30)=not "01100001" and  dados(47 downto 40)= not "01110010" and  dados(57 downto 50) = not "00100000" and  dados(67 downto 60)= not "01100001" and  dados(77 downto 70)= not "01110010" and  dados(87 downto 80) = not "00110010") then  
	ar(1)<= '1';
	
	elsif( dados(7 downto 0) = not "01100100" and  dados(17 downto 10)=not "01100101" and  dados(27 downto 20)= not "01110011" and  dados(37 downto 30)= not "01101100" and  dados(47 downto 40)=not "01101001" and  dados(57 downto 50)=not "01100111" and  dados(67 downto 60)=not "01100001" and  dados(77 downto 70)= not "01110010" and  dados(87 downto 80) = not "00100000" and  dados(97 downto 90)= not "01100001" and  dados(107 downto 100)= not "01110010" and  dados(117 downto 110) = not "00110010") then  
	ar(1)<= '0';
	
	-------------- ar 2
		
	elsif( dados(7 downto 0)= not "01101100" and  dados(17 downto 10)=not "01101001" and  dados(27 downto 20)=not "01100111" and  dados(37 downto 30)=not "01100001" and  dados(47 downto 40)= not "01110010" and  dados(57 downto 50) = not "00100000" and  dados(67 downto 60)= not "01100001" and  dados(77 downto 70)= not "01110010" and  dados(87 downto 80) = not "00110011") then  
	ar(2)<= '1';
	
	elsif( dados(7 downto 0) = not "01100100" and  dados(17 downto 10)=not "01100101" and  dados(27 downto 20)= not "01110011" and  dados(37 downto 30)= not "01101100" and  dados(47 downto 40)=not "01101001" and  dados(57 downto 50)=not "01100111" and  dados(67 downto 60)=not "01100001" and  dados(77 downto 70)= not "01110010" and  dados(87 downto 80) = not "00100000" and  dados(97 downto 90)= not "01100001" and  dados(107 downto 100)= not "01110010" and  dados(117 downto 110) = not "00110011") then  
	ar(2)<= '0';
	------------ 
	------------ acender lamp
	------------ acender todas as lampadas
	elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01100011" and  dados(27 downto 20)=not "01100101" and  dados(37 downto 30)=not "01101110" and  dados(47 downto 40)= not "01100100" and  dados(57 downto 50)= not "01100101" and  dados(67 downto 60)= not "01110010" and  dados(77 downto 70)= not "00100000" and  dados(87 downto 80)= not "01101100" and  dados(97 downto 90)= not "01100001" and  dados(107 downto 100) = not "01101101" and  dados(117 downto 110) = not "01110000")then
	lamp<= "11111111";
	
	elsif( dados(7 downto 0)= not "01100001" and  dados(17 downto 10)=not "01110000" and  dados(27 downto 20)=not "01100001" and  dados(37 downto 30)=not "01100111" and  dados(47 downto 40)= not "01100001" and  dados(57 downto 50)= not "01110010" and  dados(67 downto 60)= not "00100000" and  dados(77 downto 70)= not "01101100" and  dados(87 downto 80)= not "01100001" and  dados(97 downto 90)= not "01101101" and  dados(107 downto 100) = not "01110000")then
   lamp<= "00000000";
						
						
	--------------- ligar ar
   elsif( dados(7 downto 0)= not "01101100" and  dados(17 downto 10)=not "01101001" and  dados(27 downto 20)=not "01100111" and  dados(37 downto 30)=not "01100001" and  dados(47 downto 40)= not "01110010" and  dados(57 downto 50)= not "00100000" and  dados(67 downto 60)= not "01100001" and  dados(77 downto 70)= not "01110010" and  dados(87 downto 80)= not "11111111") then
	ar <= "111";
	
	--------------- desligar ar
	elsif( dados(7 downto 0)= not "01100100" and  dados(17 downto 10)=not "01100101" and  dados(27 downto 20)=not "01110011" and  dados(37 downto 30)=not "01101100" and  dados(47 downto 40)= not "01101001" and  dados(57 downto 50)= not "01100111" and  dados(67 downto 60)= not "01100001" and  dados(77 downto 70)= not "01110010" and  dados(87 downto 80)= not "00100000" and  dados(97 downto 90)= not "01100001" and  dados(107 downto 100) = not "01110010" and  dados(117 downto 110)= not "11111111") then
	ar <= "000";
	
		else
			lamp<= aux_lamp;
			ar<= aux_ar;
		end if;
		
		end process ativar_cargas;
		----------------------------------------------
		


	
end  estrutura;






