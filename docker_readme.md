## dockerを利用した環境構築
```bash
docker build -t conda_cuda118 .

docker run -it \
--gpus all \
-v $(pwd):/work \
-p 6006:6006 \
--shm-size=12g \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix/:/tmp/.X11-unix \
--name sugar \
conda_cuda118:latest

# コンテナ内で
conda update -n base -c conda-forge conda

python install.py

conda init

exit # コンテナを出る

docker start -ai sugar

# コンテナ内で
conda activate sugar
```
