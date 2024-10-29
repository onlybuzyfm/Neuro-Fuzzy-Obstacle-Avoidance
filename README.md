# Fuzzy Obstacle Avoidance

## Introduction
This project implements a fuzzy logic-based obstacle avoidance system for robotic navigation. Using fuzzy inference, the system makes real-time adjustments to a robot’s movement based on distance readings from surrounding obstacles. The approach ensures smooth and adaptive navigation in dynamic environments, allowing the robot to avoid collisions effectively.

The key of this work is the fast data generation approach to produce sythetic data to train a Neuro-fuzzy system based on simple observations of low-cost ultrasonic sensors and the  robot´s model.

## Getting Started
To execute the code, ensure you have MATLAB and Copelia Sim installed. The main entry point of the project is the `main.m` file, which initializes the environment and runs the obstacle avoidance system.

There are three models to try: 

1. Neuro-fuzzy
2. Mandami
3. Conditional

Each one is located in a separated folder with their respective `.fis` files. All the models are configured to be executed along with Copelia Sim.

## Execution
1. Clone or download the repository.
2. Execute any scencario located in `Copealia-scenarios` folder
3. Open MATLAB and navigate to the project folder.
4. Run the `main.m` file to execute the obstacle avoidance algorithm.

