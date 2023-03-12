function [ic,ecolparams,econparams] = Test(country)

i=1;

%Parametros originales
ecolparams = [0.009933643,   %01 - gRPP2
     0.058687036,            %02 - gP2H2
     0.0168,                 %03 - gP2H3
     0.000778772,            %04 - gRPP3
     0.125249403,            %05 - gP3H3
     0.366996266,            %06 - gH2C1
     0.052509103,            %07 - gH2C2
     0.117534846,            %08 - gH3C2
     0.021472781,            %09 - rIRPP2
     0.357331692,            %10 - rIRPP3
     0.197313146,            %11 - mP2
     0.186325524,            %12 - mP3
     0.0004,                 %13 - mH2
     0.196123663,            %14 - mH3
     0.092105574,            %15 - mC1
     0.171458886,            %16 - mC2
     0.0,                    %17 - mIRPRP
     0.49337505,            %18 - RPIRP
     1.000000000000000e+001,   %19 - P2*
     0.079785,                        %20 - gP1H2
     0.19963];                              %21 - gH1C1
 
 %  Cambio en los parametros 
% 	ecolparams(10)=0.9;                          %10 - rIRPP3
% 	ecolparams(7)=1.3127275637705977e-001;       %07 - gH2C2
% 	ecolparams(14)=4.9030915711147533e-001;      %14 - mH3
% 	ecolparams(3)=3.7e-2;                        %03 - gP2H3
% 	ecolparams(9)=1.081656269272850e-002;        %09 - rIRPP2
% 	ecolparams(2)=2.934351784507601e-002;	     %02 - gP2H2
% 	ecolparams(3)=4.2e-2;                        %03 - gP2H3





	sol= [0.43853,      %01 - aw
     0.135718104,           %02 - cw
     0.4968,           %03 - aP1
     0.67631,           %04 - bP1
     0.12318,           %05 - cP1 
     0.207876237,                      %06
     0.349388112,                      %07
     0.033805381,                      %08 - cP1p   
     1.4359,           %09 - aH1
     0.001,           %10 - bH1
     0.252716513,           %11 - cH1
     0.26657	,           %12  - cH1p
     1.17,           %13 - aIS
     0.297210307,           %14 - bIS
     0.001,           %15 - cIS
     5.646817673172643e-001,           %16 - 
     0.825044346,                      %17
     0.219180582,                      %18
     1.286507253686182e-001,           %19
     1.474467159083802e-002,           %20
     3.995283985198757e-001,           %21
     1.555235114499388e-001,           %22
     1.019919611353713e-001,           %23
     6.766772330024032e-001,           %24
     0.000118394,                      %25
     9.838862467656756e-003,           %26
     9.000000000000011e-001];          %27

	econparams(1:5)=sol(1:5);
	econparams(6)=0.050392;             %06 - aP1p
    econparams(7)=0.149737492;             %07 - bP1p
	econparams(8:11)=sol(8:11);
	econparams(12)=0.24182;              %12 - aH1p
	econparams(13)=0.049912497;              %13 - bH1p
	econparams(14:17)=sol(12:15);
	econparams(18)=0.3109;              %18 - aISp
	econparams(19)=0.0044;              %19 - bISp
	econparams(20)=0.3313;             %20 - cISp
	dP1H1=0.269204722;
	econparams(21)=0.000191077;          %21 - dP1H1
	econparams(25)=dP1H1/1000;          %25 - dP1IS
	econparams(29)=dP1H1/1000;          %29 - NA
	econparams(34)=dP1H1/1000;          %34 - NA
	econparams(39)=dP1H1/1000;          %39 - NA
	eP1H1=sol(7);
	econparams(22)=0.049912497;               %22 - eP1H1
	econparams(26)=eP1H1;               %26 - eP1IS
	fP1H1=sol(17);
	econparams(23)=0.81332;             %23 - fP1H1
	econparams(27)=fP1H1/1;             %27 - fP1IS
	econparams(31)=fP1H1/1000;          %31 - NA
	econparams(36)=0.5*fP1H1/1000;      %36 - NA
	econparams(41)=0.5*fP1H1/1000;      %41 - NA
	econparams(24)=2.9657;             %24 - gP1H1
	econparams(28)=sol(19);             %28 - gP1IS
	econparams(30)=sol(20)/1000*10000;  %30 - NA
	econparams(35)=sol(20)/1000*10000;  %35 - NA
	econparams(40)=sol(20)/1000*10000;  %40 - NA
	mH1HH=sol(21);
	econparams(32)=0.5*mH1HH/1000;      %32 - NA
	econparams(37)=mH1HH/1000;          %37 - NA
	econparams(42)=0.5*mH1HH/1000;      %42 - NA
	nISHH=sol(22);
	econparams(33)=0.5*nISHH/1000;      %33 - NA
	econparams(38)=0.5*nISHH/1000;      %38 - NA
	econparams(43)=nISHH/1000;          %43 - NA
    
	econparams(45)=0.101991961;             %45 - theta   
	econparams(46)=0.676677233;             %46 - lambda 
	econparams(48)=0.001018295;             %48 - mP1
	econparams(49)=0.009838862;             %49 - mH1
	econparams(50)=0.01;                %50 - mHH
 
	econparams(44)=.1;                 %44 - khat

	econparams(47)=0.003541127;         %47 - gRPP1
 
	econparams(51)=0;                   %51 - P1bar
	econparams(52)=0.4;                 %52 - H1bar
	econparams(53)=0;                   %53 - ISbar
	econparams(54)=4.51E-06; %54 - dw
 
	econparams(55)= 0.000271386*52;        %55 - etaa
	econparams(56)=0.00010454*52;         %56 - etab
	econparams(57)=0.01666;             %57 - etac
	econparams(58)=10;         %58 - phi
 
 
%
% initialize economic state [P1;H1;IS;HH]
%
% 	ic_econ =[0.80213,          %01 - P1
%      0.25,                      %02 - H1 
%      1.008970080362582e-001,    %03 - IS
%      4.507354330528614e-001];   %04 - HH
                   
	%numHH= 10; 
    %numHH=25364.31018;
    numHH=1000;
 
	econparams(59)=4.51E-05*10000/numHH;          %59 - idealpercapmass
%
%	Calculate ecological equilibrium, without any of the domesticated or
%	industrial agents
    

%%%Revisar
	%ecolparams(8)=ecolparams(8)+0.25*ecolparams(8);  %08 - gH3C2
    
 

%ic_ecol = eq21apr2004V2(ecolparams); %ic_eco=[P2;P3;H2;H3;C1;C2;RP;IRP];

% 
%	ecolparams(18)=0  %set RPIRP to zero, without changing original equilibrium.  
%	Comment this out to run ecological model itself
%                   
%     econparams=zeros(59,1)			%uncomment these two lines to run the
%     econparams(45:46)=1			    %ecological model with no economics
 
%	P1, P2, P3, H1, H2, H3, C1, C2, HH, IS, RP, IRP, P1H1massdeficit, 
%	P1ISmassdeficit,P1HHmassdeficit, H1massdeficit, ISmassdeficit, numHH, percapmass
%	
	ic(1:12)=[0.127639522,   %01 - P1
    6.637479579,         %02 - P2
    1.181396149,         %03 - P3
    1.248945367,         %04 - H1
    0.065892868,         %05 - H2
    1.073417243,         %06 - H3
    1.358944396,         %07 - C1
    0.611883366,         %08 - C2
    0.4507,               %09 - HH
    0.508187978,         %10 - IS
    20.10894289,         %11 - RP
    0.881746274];        %12 - IRP

    ic(13)=0.0;         %13 - P1H1massdeficit
	ic(14)=0;           %14 - P1ISmassdeficit
	ic(15)=0;           %15 - P1HHmassdeficit
	ic(16)=0;           %16 - H1massdeficit
	ic(17)=0;           %17 - ISmassdeficit
	ic(18)=1000;       %18 -numHH
	%ic(19)=4.055586606327234e-003;  %19 - percapmass
    ic(19)=ic(9)/ic(18);
    ic(20)=800;         %20 - FS
    
    %Variables de estratificacion 
    ic(21)=0.75*ic(18); %21 numHH1
    ic(22)=0.25*ic(18); %22 numHH2
    
if country == 0
    ic(23) = 0.750*ic(9);       %HH1
    ic(24) = 0.250*ic(9);       %HH2
end

if country == 1
    ic(23) = 0.646*ic(9);       %HH1
    ic(24) = 0.354*ic(9);       %HH2
end

if country == 2
    ic(23) = 0.686*ic(9);       %HH1
    ic(24) = 0.314*ic(9);       %HH2
end

if country == 3
    ic(23) = 0.701*ic(9);       %HH1
    ic(24) = 0.299*ic(9);       %HH2
end
    
    