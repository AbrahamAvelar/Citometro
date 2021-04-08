function data=loadBatchAnalysis(archivo,Events, gate_col_1,gate_col_2,platesize)
% Toma nombre del archivo del BatchAnalysis y te devuelve una estructura
% data
% Los platos se tienen que llamar "PL1_20210301_1506_CUALQUIEROTRACOSA"
% es decir, tienen que empezar así: "PLX_YYYYMMDD_HHMM" 

[BA txtBA] =xlsread(archivo);%BA=BatchAnalysis

muertas=[];
vivas=[];
eventos=[];
Platenumbers=[];
times=[];
ordenPls=[];
times2=[];
for i = 1:platesize:length(BA) 
    % hace 3 matrices con todos los datos
    vivas=[vivas; BA(i:i+platesize-1,gate_col_1)'];
    muertas=[muertas; BA(i:i+platesize-1,gate_col_2)'];
    eventos=[eventos; BA(i:i+platesize-1,Events)'];
    
    % Colecta numero de platos 
    thisplate= cell2mat(txtBA(i+1,2));
    txtplate = strsplit(thisplate,'_');
    temp=cell2mat(txtplate(1))
    ordenPls = [ordenPls  str2num(temp(3:end))]
    
    % Extrae, Calcula y acomoda la fecha
    temp=txtBA(i+1,4);
    temp2=strsplit(cell2mat(temp),',');
    temp3=strsplit(cell2mat(temp2(2)),' ');
    temp4=cell2mat(temp2(1));
    mes=temp4(1:3)
    year=cell2mat(temp3(1))
    temp5=strsplit(temp4,' ')
    if length(temp5(2)) ==1
        day=strcat('0',cell2mat(temp5(2)))
    else
        day=cell2mat(temp5(2))
    end
    times2=[times2 datenum(strcat(year,mes,day), 'yyyymmmdd') ];
end
times2=times2-min(times2);
for pl=unique(ordenPls)
    indexes=find(ordenPls == pl);
    data(pl).muertas=muertas(indexes,:);
    data(pl).vivas=vivas(indexes,:);
    data(pl).eventos=eventos(indexes,:);
    data(pl).t=times2(indexes);
end 

end