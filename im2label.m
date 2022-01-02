function [labels, count] = im2label(imageIn)
    
    %% Image to Gray Scale
    Igray = rgb2gray(imageIn);

    %% Convert to binary image
    tresh = 0.99;

    Imask = imbinarize(Igray, tresh);
    
    %% Edge detection
    Imask = edge(uint8(Imask), 'canny');

    Imask = imfill(Imask,'holes');
    
    [labels, count] = bwlabel(Imask);
    
end