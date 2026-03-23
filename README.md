# tensorflow-cuda

Custom Docker image for TensorFlow + Jupyter with extra CUDA and data-science packages.

## Base Image

- `tensorflow/tensorflow:latest-gpu-jupyter`

## Installed Packages

- `nvidia-cudnn-cu12`
- `nvidia-cublas-cu12`
- `nvidia-cufft-cu12`
- `nvidia-curand-cu12`
- `nvidia-cusolver-cu12`
- `nvidia-cusparse-cu12`
- `matplotlib`
- `scikit-learn`
- `seaborn`
- `pandas`
- `scipy`

## Local Build

```bash
docker buildx build --platform linux/amd64 -t tensorflow-cuda:local . --load
```

## Local Run

```bash
docker run --rm -it \
  --platform linux/amd64 \
  -p 8888:8888 \
  -e JUPYTER_PASSWORD='change-me' \
  tensorflow-cuda:local
```

Notebook URL:

- `http://localhost:8888`