function [res] = Cut3(img , allimages)
gs = rgb2gray(img);
%figure, imshow(gs), title("GS");
bw = gs<255;
bw = medfilt2(bw, [5,5]);
figure, imshow(bw);
windowSize = 51;
kernel = ones(windowSize) / windowSize ^ 2;
blurryImage = conv2(single(bw), kernel, 'same');
binaryImage = blurryImage > 0.5; % Rethreshold
figure, imshow(binaryImage)
figure, imshow(binaryImage), title("Binary");
stat = regionprops(binaryImage, "BoundingBox");
if ~isempty(stat)
    for i=1:size(stat, 1)
        bb = stat(i).BoundingBox;
        obj = imcrop(img, bb);
       %figure, imshow(obj);
        
    end
end
size(stat,1);
end