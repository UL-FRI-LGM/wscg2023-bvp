import vtk
import vtk.util.numpy_support as vtknp
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

vtkarray = vtknp.numpy_to_vtk(data.ravel())
vtkimage = vtk.vtkImageData()
vtkimage.SetOrigin(0, 0, 0)
vtkimage.SetSpacing(1, 1, 1)
vtkimage.SetDimensions(*dimensions)
vtkimage.AllocateScalars(vtknp.get_vtk_array_type(data.dtype), 1)
vtkimage.GetPointData().SetScalars(vtkarray)

writer = vtk.vtkXMLImageDataWriter()
writer.SetFileName(args.output)
writer.SetInputData(vtkimage)
writer.SetCompressorTypeToNone()
writer.SetEncodeAppendedData(False)
writer.Write()
