# Requirements:
This code is largely build based on [PVD](https://github.com/alexzhou907/PVD).

`conda install pytorch==1.7.1 torchvision==0.8.2 torchaudio==0.7.2 cudatoolkit=11.0 -c pytorch`
`pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 --index-url https://download.pytorch.org/whl/cu118`
`conda install pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 cudatoolkit=11.3 -c pytorch`

If using V100, then use: `conda install pytorch==1.7.0 torchvision==0.8.0 torchaudio==0.7.0 cudatoolkit=11.0 -c pytorch`

Otherwise, if using A100, then use: `conda install pytorch==1.12.0 torchvision==0.13.0 torchaudio==0.12.0 cudatoolkit=11.3 -c pytorch`

Make sure to have CUDA Version compatible to torch version. If want to upgrade CUDA Version to 11.8: `conda install -c "nvidia/label/cuda-11.8.0" cuda-toolkit`


```
python==3.8
matplotlib==2.2.5
tqdm==4.32.1
open3d==0.9.0
trimesh==3.7.12
scipy==1.5.1
ninja==1.10.2
numpy==1.23.1
```

We also need to install pytorch3D for Chamfer Distance Loss, we recommend to follow the offical
install guideline [here](https://github.com/facebookresearch/pytorch3d/blob/main/INSTALL.md)

Install PyTorchEMD by
```
cd metrics/PyTorchEMD
python setup.py install
cp build/**/emd_cuda.cpython-36m-x86_64-linux-gnu.so .
```
## Note when installing PytorchEMD:

build PyTorchEMD successfully with PyTorch 1.11 and CUDA 11.0. I modified cuda/emd_kernel.cu as follows:
Comment #include <THC/THC.h>
Replace all THCudaCheck with C10_CUDA_CHECK


## Data

We use the data follow PVD and PointFlow, which can be downloaded [here](https://github.com/stevenygd/PointFlow). Extract and put the data in ./data/ folder/


## Train:

First Stage, train the flow model. We do not add EMA here for a simple and quick converge as illustration.
```bash
$ python train_flow.py --category car|chair|airplane
```
Assume the checkpoint is saved as flow_checkpoint.pth (you can find it in the ./output/train_flow/ )

Second Stage, straight the flow, first sample the data pairs. We provide a single GPU version, in practice, we use
multiGPU to speed up.

```bash
$ python sample_flow.py --category car|chair|airplane --model flow_checkpoint.pth
```
Then run the reflow procedure:

```bash
$ python train_reflow.py --category car|chair|airplane --model flow_checkpoint.pth
```
Assume the checkpoint is saved as reflow_checkpoint.pth (you can find it in the ./output/train_reflow/ )

Third Stage, distill the flow.
```bash
$ python train_distill.py --category car|chair|airplane --model reflow_checkpoint.pth
```

Assume the checkpoint is saved as distill_checkpoint.pth (you can find it in the ./output/train_distill/ )


## Test:

```bash
$ python test_flow.py --category car|chair|airplane --model {flow|reflow|distill}_checkpoint.pth --step 1|20|50|100|500|1000
```

You can adjust the step in this test code. For flow, reflow model, we can still expect a good few-step generation.
