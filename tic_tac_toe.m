%{
Kian Mehrabani & Ana Nicosia
3/16/17
GE 1502 - 9:15 am
Tic-Tac-Toe Game
%}
figure(1)
axis off;
hold on;
axis([0 300 0 300]);
line([100 100],[0 300])
line([200 200],[0 300])
line([0 300],[100 100])
line([0 300],[200 200])

turn = 0;
player = mod(turn,2);
board = zeros(3,3);

while(true)
    I = ginput(1);
    x = I(1);
    y = I(2);
    switch(true)
        case x > 200
            if  y > 200 
                if board(1,3) == 0
                    draw(2,2,player);
                    if player == 0 board(1,3) = 1; else board(1,3) = 2; end
                else
                    turn = turn - 1;
                end
            elseif  y > 100 
                if board(2,3) == 0
                    draw(2,1,player);
                    if player == 0 board(2,3) = 1; else board(2,3) = 2; end
                else
                    turn = turn - 1;
                end
            else
                if board(3,3) == 0
                    draw(2,0,player);
                    if player == 0 board(3,3) = 1; else board(3,3) = 2; end
                else
                    turn = turn - 1;
                end
            end
        case x > 100
            if  y > 200 
                if  board(1,2) == 0
                    draw(1,2,player);
                    if player == 0 board(1,2) = 1; else board(1,2) = 2; end
                else
                    turn = turn - 1;
                end
            elseif  y > 100 
                if board(2,2) == 0
                    draw(1,1,player);
                    if player == 0 board(2,2) = 1; else board(2,2) = 2; end
                else 
                    turn = turn - 1;
                end
            else
                if board(3,2) == 0
                    draw(1,0,player);
                    if player == 0 board(3,2) = 1; else board(3,2) = 2; end;
                else
                    turn = turn - 1;
                end
            end
        case x < 100
            if  y > 200 
                if board(1,1) == 0
                    draw(0,2,player);
                    if player == 0 board(1,1) = 1; else board(1,1) = 2; end
                else
                    turn = turn - 1;
                end
            elseif  y > 100 
                if board(2,1) == 0
                    draw(0,1,player);
                    if player == 0 board(2,1) = 1; else board(2,1) = 2; end
                else 
                    turn = turn - 1;
                end
            else
                if board(3,1) == 0
                    draw(0,0,player);
                    if player == 0 board(3,1) = 1; else board(3,1) = 2; end
                else
                    turn = turn - 1;
                end
            end
    end
    if isequal(board(1,:),[ 1 1 1 ])
        disp('Player One Wins!');
        break;
    elseif isequal(board(1,:),[ 2 2 2])
        disp('Player Two Wins!');
        break;
    elseif isequal(board(2,:),[ 1 1 1 ])
        disp('Player One Wins!');
        break;
    elseif isequal(board(2,:),[ 2 2 2])
        disp('Player Two Wins!');
        break;
    elseif isequal(board(3,:),[ 1 1 1 ])
        disp('Player One Wins!');
        break;
    elseif isequal(board(3,:),[ 2 2 2])
        disp('Player Two Wins!');
        break;
    elseif isequal(board(:,1),[ 1; 1; 1 ])
        disp('Player One Wins!');
        break;
    elseif isequal(board(:,1),[ 2; 2; 2 ])
        disp('Player Two Wins!');
        break;
    elseif isequal(board(:,2),[ 1; 1; 1 ])
        disp('Player One Wins!');
        break;
    elseif isequal(board(:,2),[ 2; 2; 2])
        disp('Player Two Wins!');
        break;
    elseif isequal(board(:,3),[ 1; 1; 1 ])
        disp('Player One Wins!');
        break;
    elseif isequal(board(:,3),[ 2; 2; 2 ])
        disp('Player Two Wins!');
        break;
    elseif isequal(board(1,1),board(2,2),board(3,3),1)
        disp('Player One Wins!');
        break;
    elseif isequal(board(1,1),board(2,2),board(3,3),2)
        disp('Player Two Wins!');
        break;
    elseif isequal(board(3,1),board(2,2),board(1,3),1)
        disp('Player One Wins!');
        break;
    elseif isequal(board(3,1),board(2,2),board(1,3),2)
        disp('Player Two Wins!');
        break;
    elseif ~ismember(board,0)
        disp('Tie Game!');
        break;
    end
    turn = turn + 1;
    player = mod(turn,2);
end
clear;

function y = draw(x,y,player)
    if player == 0
        a = x*100+5:x*100+100-5;
        b = a - x * 100 + y * 100;
        h1 = plot(a,b,'r');
        h2 = plot(a,-1 * b + 200 * y + 100,'r');
        set(h1,'linewidth',2);
        set(h2,'linewidth',2);
    else
        a = x * 100 + 50;
        b = y * 100 + 50;
        th = 0:pi/100:2*pi;
        h = plot(40*cos(th)+a,40*sin(th)+b,'b');
        set(h,'linewidth',2);
    end
end
