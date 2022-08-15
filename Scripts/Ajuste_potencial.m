%% AJUSTE POTENCIAL BINOMIAL
imshow(Im_cont);
[xi,yi] = getpts;
p=polyfit(xi,yi,2);
y_poli = polyval(p,xi);
