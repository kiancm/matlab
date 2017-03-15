h = input('h: ');
if h >= 0
    r = 12.5;
    rh = r + (10.5 / 14) * (h - 19);
    vco = 0;
    if h > 19 && h <= 33
        vco = (1 / 3) * pi * (h - 19) * (r^2 + r * rh + rh^2);
    end
    v = pi * r^2 * (h>19) * 19 + (h<=19) * h + vco;
    fprintf('h: %.3f\nv: %.3f\n',[h,v]);
else
    disp('error: input less than 0');
end