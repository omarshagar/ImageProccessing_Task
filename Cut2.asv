function [res]= Cut2(im,allimages)
img=im;
gs = rgb2gray(img);
%figure, imshow(gs), title("GS");
bw = gs<255;
res=0;
bw = medfilt2(bw, [5,5]);
%figure, imshow(bw);
stat = regionprops(bw, "BoundingBox");
if ~isempty(stat)
    for i=1:size(stat, 1)
        bb = stat(i).BoundingBox;
        obj = imcrop(img, bb);
        res=res+valueOfImage(obj ,allimages);
        %if i == 1
        %    rotate(obj)
        %end
       figure, imshow(obj);
    end
end
size(stat,1);
end