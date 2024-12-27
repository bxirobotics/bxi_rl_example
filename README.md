# 半醒科技机器人免费试用活动

为降低各学校与科研机构机器人本体使用门槛，半醒科技推出机器人真机**免费试用**活动（目前仅限强化学习算法）。   
- 用户只需:    
    * 提供训练好的模型参数文件，即可远程在机器人真机上验证算法。    
- 用户无需：    
    * 购买机器人本体;
    * 安装、调试硬件;
    * 学习特定硬件的驱动、SDK等;
    * 摔倒、损坏后花大量时间维修硬件;    

## 试用活动说明
用户参考我司提供的示例代码，开发算法，在我司提供的mujoco模拟环境中运行，通过验证后可联系我司提交试用申请。双方安排时间，选择以下方式在真机上验证算法：1、远程视频我方操作，或2、我方直接验证后给用户发送测试效果，或3、您到我司现场调试。

### 环境配置
训练环境无要求。    
仿真环境运行要求，按下列要求配置后可零成本迁移到真机验证算法
1. 系统版本: `Ubuntu 22.04`
2. `ROS2 Humble` 安装教程可参考官网`https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html` 主要需安装两个包 `ros-humble-desktop` `ros-dev-tools`
3. 安装仿真依赖: `libglfw3-dev`
4. 下载仿真环境: `git clone https://github.com/bxirobotics/bxi_sim_pkg.git`
5. 下载使用示例: `git clone https://github.com/bxirobotics/bxi_rl_example.git`
6. ROS 2 的 Python 节点会依赖PYTHONPATH 环境变量。需要把实际的 site-packages 的路径添加到PYTHONPATH 环境变量。例如 python venv 环境下，需要将path/to/site-packages 路径添加到 PYTHONPATH：    
`export PYTHONPATH=$(python3 -c "import site; print(site.getsitepackages()[0])"):$PYTHONPATH`     
7. 安装 `torch`。如果是虚拟环境, `python`版本需和`ROS2 python3.10`一致

### 仿真测试
1. 设置仿真运行环境     
`source /path/to/bxi_sim_pkg/setup.bash` 
2. 编译示例代码     
`cd bxi_rl_example` `bash build.sh`
3. 把ROS2 bxi_rl_example包的环境设置为当前环境     
`source /path/to/bxi_rl_example/install/setup.bash`
4. 运行     
`ros2 launch bxi_example_py example_launch.py`     

![GIF 2024-12-27 12-09-13_small](https://github.com/user-attachments/assets/54f09647-62da-41bb-90ed-a8a570b87c6a)

### 通过测试的标准
1. 能够在仿真环境稳定运行的策略文件能通过试用申请。仿真效果不好、抗干扰能力差或者输出指令存在高频震荡的策略不能上机测试。
2. 以下是一些具体的评价方式（所有效果可以和示例相对比）
* 机器人应能稳定地原地踏步、静止站立和低速行走；
* 使用`ROS2`可视化工具`plotjuggler`观察各关节角度和扭矩的输入输出情况，波形稳定，不出现持续的异常震荡；
* 能够抗一定外力干扰(在仿真中双击鼠标左键选中躯干（躯干高亮则为选中），按住`ctrl`后鼠标单击躯干再拖动可以给躯干施加一定干扰力);

### 真机试用流程
1. 用户`fork`我司代码库`https://github.com/bxirobotics/bxi_rl_example.git`添加自己的策略和运行文件（`resources/`目录下有处理好的机器人描述文件），在模拟器中成功稳定运行(必须完成)；
2. 联系我司免费试用，联系方式见下面。
   试用申请需要的信息：    
* 对于学校/机构：学校/机构名称（学校需提供指导老师名称）+ 试用者姓名    
* 对于个人：试用者姓名和身份信息    
* 需要验证的`git`仓库地址，我方pull参数到真机验证
3. 经沟通确认信息，且我司在模拟器中验证您的算法运行稳定后，进行上机测试。
  测试方式：        
* 联系您一起远程视频真机验证算法，或者
* 您到我司现场调试，或者    
* 我司真机验证后给用户发送测试效果，包括视频等。    
注意：相关测试视频可能会发布到我方的社交平台，提交试用申请则视为接受我司定义的规则。规则可能修改。

### 注意事项
1. 电机`P/D`参数不宜给太高否则容易震荡，其中腿部`P/D`参数不超过`200/3`，脚踝不超过`20/1`
2. 尽量不要在虚拟机或其他低性能电脑上运行仿真，仿真采用异步实时进行，性能差可能导致推理速度与仿真速度不匹配

### 联系方式
微信：banxingrobotics    
![半醒机器人微信小图](https://github.com/user-attachments/assets/781308fb-c7d7-42b3-b858-536594ebb074)    
QQ群号：948832249    
请备注：人形真机算法    

### 免责声明
本活动为免费活动，本公司保留最终解释权，包括但不限于视情况调整免费试用次数或人数限制
