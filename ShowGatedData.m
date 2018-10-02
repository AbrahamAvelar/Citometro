function ShowGatedData(Data, Gate, x, y, xscale, yscale, fignum)
% ShowGatedData(Data, Gate, x, y, xscale, yscale, fignum)
if nargin<7
    
else
    figure(fignum)
end

plot( Data(:,x), Data(:,y), 'ok', 'markersize',1 )
hold on
plot( Gate(:,1),Gate(:,2), '-r' )
set(gca, 'xscale',xscale, 'yscale', yscale)


end