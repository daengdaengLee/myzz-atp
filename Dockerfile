FROM nvcr.io/nvidia/pytorch:20.12-py3

ARG WORKSPACE_PATH=/workspace
ARG MEGATRON_REPO_NAME=Megatron-DeepSpeed
ARG MEGATRON_REPO_URI=https://github.com/microsoft/${MEGATRON_REPO_NAME}.git
ARG DEEPSPEED_REPO_NAME=DeepSpeed
ARG DEEPSPEED_REPO_URI=https://github.com/microsoft/${DEEPSPEED_REPO_NAME}.git

WORKDIR ${WORKSPACE_PATH}

RUN git clone ${MEGATRON_REPO_URI} \
    && git clone ${DEEPSPEED_REPO_URI} \
    && pip install -r ${MEGATRON_REPO_NAME}/requirements.txt \
    && pip install ./${DEEPSPEED_REPO_NAME}
