function Simulation(clientID,sim,Handle)



%Object Handles
RobotHandle = Handle(:,1);
SensorHandle = Handle(:,2:4);
MotorHandle = Handle(:,5:6);
TargetHandle = Handle(:,7);

figure ;
h1 = animatedline("Color",'b','LineWidth',2);
axis([-12.5,12.5,-12.5,12.5]);
set(gca, 'XDir','reverse','YDir','reverse')
xlabel('x');ylabel('y');title('Trayectory');
grid on
box on

figure ;
h2 = animatedline("Color",'g','LineWidth',1);
xlabel('Tiempo(s)');ylabel('Velocity(m/s)');title('Velocity Robot');
grid on
box on



RobotPosition=zeros(1,3);
TargetPositionRobotFrame=zeros(1,3);
SensorDetectionState=zeros(1,3);
SensorDetectedPoint=zeros(3,3,1);
SD=zeros(1,4);
Distance=zeros(1,1);

Vel=zeros(1,3);

itr=0;

elapsedTime = 0;
tic;

while true
    itr=itr+1;
    if itr==1
        opmode = sim.simx_opmode_streaming;
    else
        opmode = sim.simx_opmode_buffer;
    end

    [~,RobotPosition(1,:)] = sim.simxGetObjectPosition(clientID,RobotHandle(1,:),-1,opmode);
    [~,TargetPositionRobotFrame(1,:)]= sim.simxGetObjectPosition(clientID,TargetHandle(1,1),RobotHandle(1,:),opmode);
    Distance(1,:)=norm(norm(TargetPositionRobotFrame(1,:)));
    [~,Vel(1,:)]=sim.simxGetObjectVelocity(clientID,RobotHandle(1,:),opmode);
    [~,SensorDetectionState(1,1),SensorDetectedPoint(1,:,1),~,~] = sim.simxReadProximitySensor(clientID,SensorHandle(1,1),opmode);
    [~,SensorDetectionState(1,2),SensorDetectedPoint(2,:,1),~,~] = sim.simxReadProximitySensor(clientID,SensorHandle(1,2),opmode);
    [~,SensorDetectionState(1,3),SensorDetectedPoint(3,:,1),~,~] = sim.simxReadProximitySensor(clientID,SensorHandle(1,3),opmode);

    OD(1,:) = ObstacleDistance(SensorDetectionState(1,:),SensorDetectedPoint(:,:,1));
    HA=-atan2(TargetPositionRobotFrame(1,2),TargetPositionRobotFrame(1,1));


    SD(1,1)=(OD(1,1)-0.3)/(1-0.3);
    SD(1,2)=(OD(1,2)-0.3)/(1-0.3);
    SD(1,3)=(OD(1,3)-0.3)/(1-0.3);

    if SD(1,1)>1
        SD(1,1)=1;
    end
    if SD(1,2) > 1
        SD(1,2)=1;
    end
    if SD(1,3) > 1
        SD(1,3)=1;
    end

    if SD(1,1)<0 || SD(1,1)==0
        SD(1,1)=0.01;
    end
    if SD(1,2)<0 || SD(1,2)==0
        SD(1,2)=0.01;
    end
    if SD(1,3)<0 || SD(1,3)==0
        SD(1,3)=0.01;
    end

    SD(1,4)=HA;

    if SensorDetectionState(1,1) == 0 && SensorDetectionState(1,2) == 0 && SensorDetectionState(1,3) == 0

        W2_R=rw_eval_NO(SD);
        W2_L=lw_eval_NO(SD);

        if  Distance(1,:)>1
            sim.simxSetJointTargetVelocity(clientID,MotorHandle(1,1),W2_L,sim.simx_opmode_oneshot);
            sim.simxSetJointTargetVelocity(clientID,MotorHandle(1,2),W2_R,sim.simx_opmode_oneshot);
        else
            sim.simxSetJointTargetVelocity(clientID,MotorHandle(1,1),W2_L*Distance(1,:),sim.simx_opmode_oneshot);
            sim.simxSetJointTargetVelocity(clientID,MotorHandle(1,2),W2_R*Distance(1,:),sim.simx_opmode_oneshot);
        end

    else


        if SD(1,4) > 0 && SD(1,4)<0.5
            SD(1,4)= 3;
        end

        if SD(1,4) < 0 && SD(1,4)>-0.5
            SD(1,4)=-3;
        end

        W1_R=rw_eval(SD);
        W1_L=lw_eval(SD);
        sim.simxSetJointTargetVelocity(clientID,MotorHandle(1,1),W1_L,sim.simx_opmode_oneshot);
        sim.simxSetJointTargetVelocity(clientID,MotorHandle(1,2),W1_R,sim.simx_opmode_oneshot);

    end

    if Distance(1,:)<0.3 &&  Distance(1,:)>0.1
        sim.simxSetJointTargetVelocity(clientID,MotorHandle(1,1),0,sim.simx_opmode_oneshot);
        sim.simxSetJointTargetVelocity(clientID,MotorHandle(1,2),0,sim.simx_opmode_oneshot);
        break
    end

    if double(RobotPosition(1,1))~=0 && double(RobotPosition(1,2))~=0

        addpoints(h1,double(RobotPosition(1,1)),double(RobotPosition(1,2)));
        addpoints(h2,elapsedTime,double(norm(Vel(1,1))));
        drawnow limitrate;
        elapsedTime = toc;

    end

end






