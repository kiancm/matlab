function y = draw(x,y,player)
    xcolor = [randi(255) randi(255) randi(255)] / 255;
    ocolor = [randi(255) randi(255) randi(255)] / 255;
    if player == 0
        a = x * 100 + 5 : x * 100 + 95;
        b = a - x * 100 + y * 100;
        h1 = plot(a,b,'Color',xcolor);
        h2 = plot(a,200 * y + 100 - b,'Color',xcolor);
        set(h1,'linewidth',2);
        set(h2,'linewidth',2);
    else
        a = x * 100 + 50;
        b = y * 100 + 50;
        th = 0 : pi/50 : 2*pi;
        h = plot(40*cos(th) + a,40*sin(th) + b,'Color',ocolor);
        set(h,'linewidth',2);
    end
end
