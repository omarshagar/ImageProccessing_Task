clear all; 
close all;

allimages=init();
H=360;
W=700;
im=imread('all-front-back.jpg');
images=preprocessing(im,[H,W]);
rss=0;
for i=1:size(images,4) 
    figure;imshow(images(:,:,:,i));
rss=rss+valueOfImage(images(:,:,:,i),allimages);
end
%v=valueOfImage(imread('200-back.jpg'),allimages);
%v
%h=cutImageandcalc(im,allimages);
%h
rss