import cv2 as cv

image2d = cv.imread('image.png', flags=cv.IMREAD_GRAYSCALE)
# ret,image2d = cv.threshold(image2d,0,255,cv.THRESH_BINARY)
# print(image2d)

# Write and Read (‘w+’) :
#      Open the file for reading and writing.
#      For existing file, data is truncated and over-written.
#      The handle is positioned at the beginning of the file.

f = open("in.txt","w+")
for rows in image2d:
    for pixel in rows:
        # print(j)
        binary = "{0:08b}".format(pixel)
        f.writelines([str(binary), '\n'])
f.close()
