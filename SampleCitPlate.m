function [sampledData] = SampleCitPlate( PL, FieldName, samplesize )

sampledData=[];
FieldName2=fieldnames(PL.( str2mat(FieldName))) ;
for i=1:length(PL)
    for w=1:length(PL(i).( str2mat(FieldName) ) )
        num=floor(rand(samplesize,1).*length(PL.( str2mat(FieldName))(i).( str2mat(FieldName2))(w).dat));
        num(num<1 | num>size( PL.( str2mat(FieldName))(i).( str2mat(FieldName2))(w).dat, 1 ) )=[];
        sampledData=[sampledData; PL.( str2mat(FieldName))(i).( str2mat(FieldName2))(w).dat(num,:)];  
    end
end

end