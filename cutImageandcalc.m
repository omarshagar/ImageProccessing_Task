function [res] =cutImageandcalc (img,allimages)
H=360;
W=700;
 th=250;
% th
filt = fspecial('average');
fimg = imfilter(img, filt);
black_bg_img = fimg;
res=0;
black_bg_img(fimg >= th) = 0;
black_bg_img((fimg > 0) & (fimg < th)) = 255;
gs = rgb2gray(black_bg_img);
bw = gs>0;
stat = regionprops(bw, "BoundingBox");
if ~isempty(stat)
    for i=2:size(stat, 1)
        bb = stat(i).BoundingBox;
        obj = imcrop(img, bb);
        obj=imresize(obj,[H W]);
        imshow(obj)
        res=res+valueOfImage(obj,allimages);
       % cuttedImages(end+1) =obj ;
       % figure, imshow(obj);
    end
end

end 