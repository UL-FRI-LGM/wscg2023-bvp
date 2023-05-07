import h5py
import numpy as np
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-i', '--input', required=True)
parser.add_argument('-o', '--output', required=True)
parser.add_argument('-d', '--dimensions', required=True)
parser.add_argument('-c', '--chunks', default='128x128x128')
args = parser.parse_args()

dimensions = tuple(map(int, args.dimensions.split('x')))
chunks = tuple(map(int, args.chunks.split('x')))

indata = np.fromfile(args.input, dtype=np.uint8)
data = np.reshape(indata, dimensions)

with h5py.File(args.output, 'w') as f:
    dataset = f.create_dataset('default', data=data, shape=dimensions)
    # note that chunks are ignored
