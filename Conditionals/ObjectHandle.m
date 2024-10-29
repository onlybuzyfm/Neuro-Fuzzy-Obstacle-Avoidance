function Handle = ObjectHandle(clientID,sim)
    RobotHandle = zeros(1,1);
    SensorHandle = zeros(1,3);
    MotorHandle = zeros(1,2);
    TargetHandle = zeros(1,1);
   %%Getting Object Handles
   %Robot Handles
    [~,RobotHandle(1,:)]=sim.simxGetObjectHandle(clientID,'Robot1',sim.simx_opmode_blocking);

    
   %SensorHandles
    [~, SensorHandle(1,1)] = sim.simxGetObjectHandle(clientID,'sensor_left_0', sim.simx_opmode_blocking);
    [~, SensorHandle(1,2)] = sim.simxGetObjectHandle(clientID,'sensor_front_0', sim.simx_opmode_blocking);
    [~, SensorHandle(1,3)] = sim.simxGetObjectHandle(clientID,'sensor_right_0', sim.simx_opmode_blocking);
    
  
   %MotorHandles
    [~,MotorHandle(1,1)]=sim.simxGetObjectHandle(clientID,'leftMotor',sim.simx_opmode_blocking);
    [~,MotorHandle(1,2)]=sim.simxGetObjectHandle(clientID,'rightMotor',sim.simx_opmode_blocking);
    
    
   %TargetHandles
    [~,TargetHandle(1,1)]=sim.simxGetObjectHandle(clientID,'dummy2',sim.simx_opmode_blocking);


    Handle=[RobotHandle, SensorHandle, MotorHandle, TargetHandle];
end

