function [BgDataAll] = LoadCytFiles()
% Descarga los .fcs que esten en esta carpeta en una sola estructura
tubos=dir('*.fcs*'); %Nombre del plato que se quiera extraer
   
for i=1:length(tubos)
   % i/length(tubos) %para saber cuanto lleva
    
%     if i==1 %selecciona los campos de la info que no son utiles
%         j=1;
%         [datos info] = fca_readfcs(wells(j+2).name); %aunque datosEscalados no se guarda porque no sabemos ni qu'e con ellos todav'ia
%         campos = fieldnames(info);
%         FieldsToDelete = campos([1 3 9 13 15 16 17:end])
%     end
    
    [datos info] = fca_readfcs(tubos(i).name); %aunque datosEscalados no se guarda porque no sabemos ni qu'e con ellos todav'ia
    if ~isempty(datos)%porque salio un archivo que "no es de tipo fcs soportado" whatever that means
        %info=rmfield(info, FieldsToDelete);
        BgDataAll(i).dat = datos;
        BgDataAll(i).info = info;
    else
    	BgDataAll(i).info.filename=0;
    end

end

end






