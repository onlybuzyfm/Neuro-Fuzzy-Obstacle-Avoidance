function obstacle_distance = ObstacleDistance(SensorDetectionState,SensorDetectedPoint)
    obstacle_distance = ones(1,3);    
    i = 1;
        while i<=3
            if SensorDetectionState(:,i)==1
                obstacle_distance(:,i) = norm(SensorDetectedPoint(i,:));
            end
            i = i+1;
        end

    end

