# xarm_ros2_docker
Docker image containing driver and scripts for xArm (ROS2)

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)


<!-- ABOUT THE PROJECT -->
## About The Project
This repository is to launch [xarm_ros2](https://github.com/xArm-Developer/xarm_ros2) inside docker container.


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)

### Installation

1. Clone the repo
```sh
git clone https://github.com/matsuolab/xarm_ros2_docker.git
```
The default ROS version is humble (22.04). 

2. Build docker image

```sh
./BUILD-DOCKER-IMAGE.sh
```

3. Run docker container
```sh
./RUN-DOCKER-CONTAINER.sh
```

## Usage

1. Controlling xArm by moveit.

- real arm
```bash
ros2 launch xarm_moveit_config xarm6_moveit_realmove.launch.py robot_ip:=192.168.1.117 [add_gripper:=true]
```