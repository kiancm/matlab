h = input('h: ');
rcy = 12.5;
rco = 23;
rh = rco + (10.5 / 14) * (h - 19);
vco = 0;
if h > 19
   vco = (1 / 3) * (h - 19) * (rco^2 + rco * rh + rh^2);
end
v = pi * rcy^2 * h + vco;
fprintf('h: %.3f\nv: %.3f\n',[h,v]);