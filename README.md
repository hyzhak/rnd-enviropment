# RND Environment
Research and development (RND) environment.
I'm using those dockers on remote desktop computer with GPU 

## Features
- run scientific docker on remote host
- preserve datasets to `/var/datasets`
  and models to `/var/models` 
- I'm using dockerfile [floydhub/pytorch:1.0.0-gpu.cuda9cudnn7-py3.37](https://docs.floydhub.com/guides/pytorch/)
  which has many scientific and deep learning tools
  (`pytorch`, `scikit-learn`, `tensorflow` and etc).
- jupyter on `http://{server-ip}:8888/`
- tensorBoard on `http://{server-ip}:6006/`
  
  [More details about it](https://docs.floydhub.com/guides/pytorch/)  
