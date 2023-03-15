%% ECO-INDICATORS ANALYSIS

% - FI
% - EFA
% - GNRP
% - Wages
% - GHG

%% Fisher Informtaion
%Data matrix for Fisher Information calculation
FIData = Data;

%Evaluación de la FI para datos discretos a traves del tiempo
%Fisher=FIDiscrete(year,FIData);
%[Fisher,FIyear,FItrend]=FIDiscrete(year,FIData);

% Fisher Information traditional
FIbase = funFIbase(FIData)*1000;
sumfi=0;
for h=1:length(FIbase)
    sumfi=sumfi+FIbase(h);
    FIbase(h)=sumfi;
end
clear FIData

%% Ecological FootPrint Analysis
%Data matrixes for EFA calcultaion

%EFData=[RPP1 P1H1 P1IS P1HH P2H1 H1HH RPIS ISIRP EEIRP];        %Datos de Huella Ecologica
    EFData=[Data(:,24) Data(:,2) Data(:,4) Data(:,5) Data(:,7) ...
        Data(:,14) Data(:,27) Data(:,23) Data(:,61)];
%BCData=[P1 P2 H1 RP ERP];     %Datos de Biocapacidad
    BCData=[Data(:,68) Data(:,69) Data(:,71) Data(:,78) Data(:,91)];

% EFA
EFA=EFA_Mass(BCData, EFData);
clear EFData BCData
%% Green Net Regional Product
%P1, H1, IS, EEproduction

Goods=[Data(:,68) Data(:,71) Data(:,77) Data(:,59)];
Prices=[Data(:,39) Data(:,40) Data(:,41) Data(:,55)];

GNRP=sum((Goods.*Prices)'); 
clear Goods Prices
%% Wages

W=Data(:,44)';

%% GHG

GHG=Data(:,93)';

%%
EcInd=[FIbase' EFA' GNRP' W' GHG'];
clear FIbase EFA GNRP W GHG