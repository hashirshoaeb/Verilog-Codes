import cv2 as cv
import numpy as np
count = 0
image = np.zeros((62, 62))
file = open("out.txt", "r")
for line in file:
    if not (line[0] == '/' or line[0] == 'x'):
        # print(line,  "  ", count)
        i = int(count / 62)
        j = (count) % 62
        # print(i , j )
        print(line)
        if line == "00000001\n":
            image[i][j] = 255

        count = count + 1




cv.imwrite("out.png", image)