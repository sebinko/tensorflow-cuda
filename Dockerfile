FROM tensorflow/tensorflow:latest-gpu-jupyter@sha256:742a91e780b2d1d51a3352d1daf71415a73cc50594a3d7c0110d5f9949b7435b

ENV PIP_NO_CACHE_DIR=1
ENV PIP_ROOT_USER_ACTION=ignore

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install \
        nvidia-cudnn-cu12 \
        nvidia-cublas-cu12 \
        nvidia-cufft-cu12 \
        nvidia-curand-cu12 \
        nvidia-cusolver-cu12 \
        nvidia-cusparse-cu12 \
        matplotlib \
        scikit-learn \
        seaborn \
        pandas \
        scipy

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root"]
