%{
Kian Mehrabani & Ana Nicosia
3/16/17
GE 1502 - 9:15 am
Tic-Tac-Toe Game
%}
figure(1)
clf
hold on
axis off
axis([0 300 0 300])
text(55,175,sprintf([
          'INSTRUCTIONS:\n'...
          '1. Press Start to begin.\n'...
          '2. Player One, click on any box to make an "X"\n'...
          '3. Player Two, click on any box to make an "O"\n'...
          '4. Continue until a winner or tie game is decided\n'...
          '5. Press the Restart button to play again or Quit to exit.\n']));
line([55 246], [120 120]);
line([55 246], [40 40]);
line([55 55], [40 120]);
line([246 246], [40 120]);
x = 0;
y = 0;
while ~(55 <= x && x <= 246 && 40 <= y && y <= 120)
    [x,y] = ginput(1);
end
clear
clf


while true
    clf
    axis off
    axis([0 300 0 300])
    hold on
    line([100 100],[0 300])
    line([200 200],[0 300])
    line([0 300],[100 100])
    line([0 300],[200 200])

    turn = 0;
    player = mod(turn,2);
    board = zeros(3,3);

    while(true)
        [x,y] = ginput(1);
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
        if     isequal(board(1,:),[ 1 1 1 ])...
            || isequal(board(2,:),[ 1 1 1 ])...
            || isequal(board(3,:),[ 1 1 1 ])... 
            || isequal(board(:,1),[ 1; 1; 1 ])...
            || isequal(board(:,2),[ 1; 1; 1 ])...
            || isequal(board(:,3),[ 1; 1; 1 ])...
            || isequal(board(1,1),board(2,2),board(3,3),1)...
            || isequal(board(3,1),board(2,2),board(1,3),1)
                clf
                hold on
                axis off
                axis([0 300 0 300])
                text(-15,175,'Player One Wins!','FontSize',45,'Color','red');
                %disp('Player One Wins!');
                break
        elseif    isequal(board(1,:),[ 2 2 2])...
               || isequal(board(2,:),[ 2 2 2])...
               || isequal(board(3,:),[ 2 2 2])...
               || isequal(board(:,1),[ 2; 2; 2 ])...
               || isequal(board(:,2),[ 2; 2; 2])...
               || isequal(board(:,3),[ 2; 2; 2 ])...
               || isequal(board(1,1),board(2,2),board(3,3),2)...
               || isequal(board(3,1),board(2,2),board(1,3),2)
                   clf
                   hold on
                   axis off
                   axis([0 300 0 300])
                   text(-15,175,'Player Two Wins!','FontSize',45,'Color','blue');
                   %disp('Player Two Wins!');
                   break
        elseif ~ismember(board,0)
            clf
            hold on
            axis off
            axis([0 300 0 300])
            text(50,175,'Tie Game!','FontSize',45,'Color','black');
            %disp('Tie Game!');
            break
        end
        turn = turn + 1;
        player = mod(turn,2);
    end
    line([55 246],[120 120])
    line([55 246],[40 40])
    line([55 55],[40 120])
    line([246 246],[40 120])
    line([150.5 150.5],[40 120])
    [x,y] = ginput(1);
    if 55 <= x && x <= 150.5 && 40 <= y && y <= 120
        continue
    elseif 150.5 <= x && x <= 246 && 40 <= y && y <= 120
        break
    end
end
function y = draw(x,y,player)
    if player == 0
        a = x * 100 + 5:x * 100 + 95;
        b = a - x * 100 + y * 100;
        h1 = plot(a,b,'r');
        h2 = plot(a,200 * y + 100 - b,'r');
        set(h1,'linewidth',2);
        set(h2,'linewidth',2);
    else
        a = x * 100 + 50;
        b = y * 100 + 50;
        th = 0 : pi/50 : 2*pi;
        h = plot(40*cos(th) + a,40*sin(th) + b,'b');
        set(h,'linewidth',2);
    end
end
