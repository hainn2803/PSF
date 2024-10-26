conda install pytorch==1.12.0 torchvision==0.13.0 torchaudio==0.12.0 cudatoolkit=11.3 -c pytorch
pip install -r requirements.txt
conda install -c iopath iopath
conda install -c bottler nvidiacub
cd metrics/PyTorchEMD
python3 setup.py install
cp build/**/emd_cuda.cpython-36m-x86_64-linux-gnu.so .