I = imread('Foto.jpg');
I1 = imrotate(I, 45, 'bilinear');
I2 = imrotate(I, 90, 'bilinear');
I3 = imrotate(I, 180, 'bilinear');
subplot(1,4,1), imshow(I), title('Original');
subplot(1,4,2), imshow(I1), title('30 Degrees');
subplot(1,4,3), imshow(I2), title('90 Degrees');
subplot(1,4,4), imshow(I3), title('180 Degrees');