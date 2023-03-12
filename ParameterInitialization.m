function [ic,ecolparams,econparams] = ParameterInitialization(country)

i=1;

%Parametros originales
ecolparams = [2.861325308717139e-002,   %01 - gRPP2
     1.734351784507601e-002,            %02 - gP2H2
     3.265224224356716e-002,            %03 - gP2H3
     5.732733145333690e-003,            %04 - gRPP3
     3.131235080180339e-001,            %05 - gP3H3
     9.174906638699569e-001,            %06 - gH2C1
     3.327275637705977e-001,            %07 - gH2C2
     2.350696927025789e-001,            %08 - gH3C2
     5.081656269272850e-002,            %09 - rIRPP2
     8.688268022462951e-001,            %10 - rIRPP3
     4.532e-001,                        %11 - mP2
     4.658138102587053e-001,            %12 - mP3
     1.000000000000000e-003,            %13 - mH2
     5.030915711147533e-001,            %14 - mH3
     2.302639355221487e-001,            %15 - mC1
     4.286472149788781e-001,            %16 - mC2
     0.0,                               %17 - mIRPRP
     1.233437625619434e+000,            %18 - RPIRP
     1.000000000000000e+001,            %19 - P2*
     0.26340461,                        %20 - gP1H2
     0.2];                              %21 - gH1C1
 
 %  Cambio en los parametros 
	ecolparams(10)=0.9;                          %10 - rIRPP3
	ecolparams(7)=1.3127275637705977e-001;       %07 - gH2C2
	ecolparams(14)=4.9030915711147533e-001;      %14 - mH3
	ecolparams(3)=3.7e-2;                        %03 - gP2H3
	ecolparams(9)=1.081656269272850e-002;        %09 - rIRPP2
	ecolparams(2)=2.934351784507601e-002;	     %02 - gP2H2
	ecolparams(3)=4.2e-2;                        %03 - gP2H3





	sol= [4.832248668616482e-001,      %01 - aw
     1.357181037387526e-001,           %02 - cw
     1.000000000000000e+000,           %03 - aP1
     1.000000000000000e+000,           %04 - bP1
     7.737088487049635e-001,           %05 - cP1 
     0.207876237,                      %06
     0.349388112,                      %07
     0.258916193,                      %08 - cP1p   
     7.524098562805767e-001,           %09 - aH1
     1.000000000000000e-003,           %10 - bH1
     2.527165128459011e-001,           %11 - cH1
     9.926234817539428e-001,           %12  - cH1p
     6.081040091094971e-001,           %13 - aIS
     2.972103070158917e-001,           %14 - bIS
     1.000000000000000e-003,           %15 - cIS
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
	econparams(6)=3*sol(6);             %06 - aP1p
    econparams(7)=3*sol(7);             %07 - bP1p
	econparams(8:11)=sol(8:11);
	econparams(12)=sol(6);              %12 - aH1p
	econparams(13)=sol(7);              %13 - bH1p
	econparams(14:17)=sol(12:15);
	econparams(18)=sol(6);              %18 - aISp
	econparams(19)=sol(7);              %19 - bISp
	econparams(20)=sol(16);             %20 - cISp
	dP1H1=0.269204722;
	econparams(21)=dP1H1/1000;          %21 - dP1H1
	econparams(25)=dP1H1/1000;          %25 - dP1IS
	econparams(29)=dP1H1/1000;          %29 - NA
	econparams(34)=dP1H1/1000;          %34 - NA
	econparams(39)=dP1H1/1000;          %39 - NA
	eP1H1=sol(7);
	econparams(22)=eP1H1;               %22 - eP1H1
	econparams(26)=eP1H1;               %26 - eP1IS
	fP1H1=sol(17);
	econparams(23)=fP1H1/1;             %23 - fP1H1
	econparams(27)=fP1H1/1;             %27 - fP1IS
	econparams(31)=fP1H1/1000;          %31 - NA
	econparams(36)=0.5*fP1H1/1000;      %36 - NA
	econparams(41)=0.5*fP1H1/1000;      %41 - NA
	econparams(24)=sol(18);             %24 - gP1H1
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
    
	econparams(45)=sol(23);             %45 - theta   
	econparams(46)=sol(24);             %46 - lambda 
	econparams(48)=sol(25);             %48 - mP1
	econparams(49)=sol(26);             %49 - mH1
	econparams(50)=0.22;                %50 - mHH
 
	econparams(44)=0.3;                 %44 - khat

	econparams(47)=0.000331678;         %47 - gRPP1
 
	econparams(51)=0;                   %51 - P1bar
	econparams(52)=0.4;                 %52 - H1bar
	econparams(53)=0;                   %53 - ISbar
	econparams(54)=0.01*4.507354330528614e-004; %54 - dw
 
	econparams(55)= 0.988429965;        %55 - etaa
	econparams(56)=1.128803224;         %56 - etab
	econparams(57)=0.01666;             %57 - etac
	econparams(58)=10.00717122;         %58 - phi
 
 
%
% initialize economic state [P1;H1;IS;HH]
%
	ic_econ =[0.80213,          %01 - P1
     0.25,                      %02 - H1 
     1.008970080362582e-001,    %03 - IS
     4.507354330528614e-001];   %04 - HH
                   
	%numHH= 10; 
    %numHH=25364.31018;
    numHH=1000;
 
	econparams(59)=0.20645585;          %59 - idealpercapmass
%
%	Calculate ecological equilibrium, without any of the domesticated or
%	industrial agents
    
	ecolparams(8)=ecolparams(8)+0.25*ecolparams(8);  %08 - gH3C2
    
 

ic_ecol = eq21apr2004V2(ecolparams); %ic_eco=[P2;P3;H2;H3;C1;C2;RP;IRP];

% 
%	ecolparams(18)=0  %set RPIRP to zero, without changing original equilibrium.  
%	Comment this out to run ecological model itself
%                   
%     econparams=zeros(59,1)			%uncomment these two lines to run the
%     econparams(45:46)=1			    %ecological model with no economics
 
%	P1, P2, P3, H1, H2, H3, C1, C2, HH, IS, RP, IRP, P1H1massdeficit, 
%	P1ISmassdeficit,P1HHmassdeficit, H1massdeficit, ISmassdeficit, numHH, percapmass
%	
	ic(1:12)=[ic_econ(1),   %01 - P1
    ic_ecol(1),         %02 - P2
    ic_ecol(2),         %03 - P3
    ic_econ(2),         %04 - H1
    ic_ecol(3),         %05 - H2
    ic_ecol(4),         %06 - H3
    ic_ecol(5),         %07 - C1
    ic_ecol(6),         %08 - C2
    ic_econ(4),         %09 - HH
    ic_econ(3),         %10 - IS
    ic_ecol(7),         %11 - RP
    ic_ecol(8)];        %12 - IRP

    ic(13)=0.0;         %13 - P1H1massdeficit
	ic(14)=0;           %14 - P1ISmassdeficit
	ic(15)=0;           %15 - P1HHmassdeficit
	ic(16)=0;           %16 - H1massdeficit
	ic(17)=0;           %17 - ISmassdeficit
	ic(18)=numHH;       %18 -numHH
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
    
    