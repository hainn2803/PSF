conda create -p ./envs/PSFpython=3.8
conda activate PSF

conda install pytorch==1.12.0 torchvision==0.13.0 torchaudio==0.12.0 cudatoolkit=11.3 -c pytorch
pip install -r requirements.txt
conda install -c iopath iopath
conda install -c bottler nvidiacub
cd metrics/PyTorchEMD
python3 setup.py install
cp build/lib.linux-x86_64-cpython-38/emd_cuda.cpython-38-x86_64-linux-gnu.so .