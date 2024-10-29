clc;clear;close all;
disp('Program started');
% sim=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
sim.simxFinish(-1); % just in case, close all opened connections
clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);
global h1 h2 h3 h4
if (clientID>-1)
    disp('Connected to remote API server');
    simTime=500;
    Handle=ObjectHandle(clientID,sim);
    C1_L=readfis('C1_L_NFA.fis');
    C1_R=readfis('C1_R_NFA.fis');
    C2_L=readfis('C2_L_2.fis');
    C2_R=readfis('C2_R_2.fis');
    Simulation(clientID,sim,Handle,C1_L,C1_R,C2_L,C2_R);
    sim.simxGetPingTime(clientID);
    sim.simxFinish(clientID);
    disp('Finished');
else
    disp('Failed connecting to remote API server');
end
sim.delete();
    