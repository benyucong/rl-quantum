# Running a CUDA-Q Container with Singularity (No Admin Required)

You can use [**Singularity**](https://github.com/sylabs/singularity) to run a CUDA-Q container in a folder **without needing administrator permissions**.


## Step 1: Create a Definition File

Once you have Singularity installed, create a file named `cuda-quantum.def` with the following content:

```def
Bootstrap: docker
From: nvcr.io/nvidia/nightly/cuda-quantum:cu12-latest

%runscript
    mount devpts /dev/pts -t devpts
    cp -r /home/cudaq/* .
    bash
````

## Step 2: Build the Container

Run the following command to build the container image:

```bash
singularity build --fakeroot cuda-quantum.sif cuda-quantum.def
```

## Step 3: Run the Container

You can run the container using:

```bash
singularity run --writable --fakeroot cuda-quantum.sif
```

After running this command, you should see additional files in your folder, such as a `README`, as well as example code and tutorials.

## Step 4: Enable GPU Acceleration

To enable support for GPU-accelerated backends, use the `--nv` flag:

```bash
singularity run --writable --fakeroot --nv cuda-quantum.sif
nvidia-smi
```

This ensures the container has access to the NVIDIA GPU on your system. 