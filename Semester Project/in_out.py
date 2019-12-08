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

# n = 64
# for i in range(1,n-2):
#     k = 0 + (i * n)
#     for j in range(1,n-2):
#         l0 = k - n + j - 1
#         l1 = k - n + j
#         l2 = k - n + (j + 1)
#         l3 = k + (j - 1)
#         l4 = k + j
#         l5 = k + (j + 1)
#         l6 = k + n + (j - 1)
#         l7 = k + n + j
#         l8 = k + n + (j + 1)
#         print(l0, l1, l2,l3,l4,l5,l6,l7,l8)


n = 64
def convmatrix(i,j):
    k = 0 + (i * n)
    l0 = k - n + j - 1
    l1 = k - n + j
    l2 = k - n + (j + 1)
    l3 = k + (j - 1)
    l4 = k + j
    l5 = k + (j + 1)
    l6 = k + n + (j - 1)
    l7 = k + n + j
    l8 = k + n + (j + 1)
    print(l0, l1, l2,l3,l4,l5,l6,l7,l8)

convmatrix(1,1)
convmatrix(62,62)