    %% Create an isosceles triangle
    % Suppose we know the coordinates of points A(x1,y1) and B(x2,y2) of a triangle's
    % base, and the height of the triangle.
    % We will find the coordinates of the third point of the triangle, K(x3,y3).
    
    clear all;clc;
    
    y2=100;
    x2=70;
    y1=25;
    x1=19;
    height=20;
    
    step=0.5;
    theta = atan2(x2-x1, y2-y1);
    r = sqrt( (x1-x2)^2 + (y1-y2)^2);        % the length of side AB
    line = 0:step: r;
    line_y=(y1 + line*cos(theta))';
    line_x=(x1 + line*sin(theta))';
    side_AB=[line_x line_y];                 % some coordinates of side AB
    
    % The coordinates of side's AB center
    xc=(x1+x2)/2;
    yc=(y1+y2)/2;
    
    %The coordinates of the third point of the triangle, K
    y3=yc + sqrt((height^2)/(1+(((y1-yc)^2)/((x1-xc)^2))));
    x3=xc-(yc-y1)*(y3-yc)/(xc-x1);
    
    theta_k=atan2(x3-x1,y3-y1);
    r_1 = sqrt( (y1 - y3)^2 + (x1 - x3)^2);  % the length of side AK
    line_1 = 0:step:r_1;
    line_xk=(x1 + line_1*sin(theta_k))';
    line_yk=(y1 + line_1*cos(theta_k))';
    line_k=[line_xk line_yk];                % some coordinates of side AK

    theta_k2=atan2(x3-x2,y3-y2);
    r_2 = sqrt( (y2 - y3)^2 + (x2 - x3)^2);  % the length of side BK
    line_2 = 0:step:r_2;
    line_xk2=(x2 + line_2*sin(theta_k2))';
    line_yk2=(y2 + line_2*cos(theta_k2))';
    line_k2=[line_xk2 line_yk2];             % some coordinates of side BK
    
    % Let's plot all the sides of the triangle, together.
    plot(line_yk,line_xk);hold on;          % side BK
    plot(line_yk2,line_xk2);hold on;         % side AK
    plot(line_y,line_x,'--');                % side AB   
    
    message = sprintf('Difference of AC and BC : %d', r_1-r_2);
    disp(message);