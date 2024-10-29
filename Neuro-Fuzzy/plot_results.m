
% trajectory points
[xrNF,yrNF] = getpoints(h1);

% velocity vd time points
[tNF,vrNF] = getpoints(h2);



%% velocity

plot(tNF,vrNF,'b')


%% trajectory lenght
mean_vel = mean(vrNF)
rms_vel = rms(vrNF)
% Initialize the trajectory length
trajectoryLength = 0;

% Compute the Euclidean distance between consecutive points
for i = 2:length(xrNF)
    dx = xrNF(i) - xrNF(i-1);
    dy = yrNF(i) - yrNF(i-1);
    distance = sqrt(dx^2 + dy^2);
    trajectoryLength = trajectoryLength + distance;
end
trajectoryLength

straigthLenght = sqrt((xrNF(1)-xrNF(end))^2 + (yrNF(1)-yrNF(end))^2)

lengthRatio = straigthLenght/trajectoryLength

trajectoryTime = tNF(end)

%%
% Calculate acceleration using numerical differentiation
acceleration = diff(vrNF) ./ diff(tNF);

% Since diff reduces the length of the output by 1, we need to adjust the time vector
time_acceleration = tNF(1:end-1) + diff(tNF) / 2;

 plot(time_acceleration, acceleration)
grid on

acc_mean = rms(acceleration)