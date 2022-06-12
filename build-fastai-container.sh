#!/bin/bash

sudo apptainer build fastai-selfcontainer.sif fastai-selfcontainer.def && apptainer overlay create --size 16384 fastai-selfcontainer.sif
