%EFA
%Codigo para realizar el Analisis de la Huella Ecologica

function trend = EFA_Mass(BCData, EFData)

if length(BCData)~=length(EFData)
    error('Los vectores BC y EF deben tener la misma dimensión');
end

BC=sum(BCData');
EF=sum(EFData');
trend=BC-EF;

%figure 
%plot(year,BC,year,EF);
%figure
%plot(year,trend);

%axis([year(1) year(end) 10 14])
%title('Foot Print Analysis');
%xlabel('Time'); ylabel('Mass');
end