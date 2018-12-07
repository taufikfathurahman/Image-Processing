% Image enhanchment using histogram equalization

I = imread('Foto.jpg');
J = histeq(I);
figure
subplot(1,2,1), imshow(I), title('B4 (Without GPU)');
subplot(1,2,2), imshow(J), title('After (Without GPU)');

% Using GPU
I = gpuArray(imread('Foto.jpg'));
J = histeq(I);
figure
subplot(1,2,1), imshow(I), title('B4 (Using GPU)');
subplot(1,2,2), imshow(J), title('After (Using GPU)');
