function data = calculateExpFit(data, platos, lecturas)
% data = calculateExpFit(data, platos, lecturas)

    for  i = platos
        tosave_a=[];
        tosave_b=[];
        for w=1:length( data(i).vivas )
            temp = fit(data(i).t(lecturas)', data(i).vivas(lecturas,w), 'exp1');
            tosave_a = [tosave_a; temp.a];
            tosave_b = [tosave_b; temp.b];
        end
        data(i).fit_a=tosave_a;
        data(i).deathRate=tosave_b;
    end

end
