function [BgDataAll] = LoadCytFiles(Reader, rango)
% Descarga los .fcs que esten en la carpeta actual en una sola estructura
% Reader = 0 usar el lector viejito que sacamos del github de MSpringer lab
% si no dice nada, entonces usa el fca_readfcs que es que que ya usabamos
% rango es por si quieres solo leer algunos de los fcs, por ejemplo los
% primeros 25 serìa 1:25

tubos=dir('*.fcs*'); %Nombre del plato que se quiera extraer

if nargin<1 
    Reader=1;
end
if nargin<2
    rango=1:length(tubos);
end
index=0;
for i= rango %1:length(tubos)
    index=index+1;
   % i/length(tubos) %para saber cuanto lleva
    
%     if i==1 %selecciona los campos de la info que no son utiles
%         j=1;
%         [datos info] = fca_readfcs(wells(j+2).name); %aunque datosEscalados no se guarda porque no sabemos ni qu'e con ellos todav'ia
%         campos = fieldnames(info);
%         FieldsToDelete = campos([1 3 9 13 15 16 17:end])
%     end
    if Reader
        [datos info] = fca_readfcs(tubos(i).name); %aunque datosEscalados no se guarda porque no sabemos ni qu'e con ellos todav'ia
        if ~isempty(datos)%porque salio un archivo que "no es de tipo fcs soportado" whatever that means
            %info=rmfield(info, FieldsToDelete);
            BgDataAll(index).dat = datos;
            BgDataAll(index).info = info;
        else
            BgDataAll(index).info.filename=0;
        end
    else
        [datos, info, metad]=fcsreadMS(tubos(i).name);
        BgDataAll(index).dat = datos(1:size(datos),:);
        BgDataAll(index).info= info;
        BgDataAll(index).meta= metad;
        BgDataAll(index).filename=tubos(i).name;
    end

end

end
