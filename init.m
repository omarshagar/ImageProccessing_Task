function [images]=init()
%1. Upright front-back Single
H=360;
W=700;
imagefiles = dir('*.jpg'); 
images.val=[];
images.vec=[[]];
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   stringval=split(currentfilename,'-');
   val=str2double(stringval(1));
   if isnan(val)
       continue;
   end
    currentimage = imread(currentfilename);
    
  
    % currentimage=imresize(currentimage,[H,W]);
    % currentimage = medfilt2( currentimage, [5,5]);
    %flt=fspecial('average',[5 5]);
    %currentimage=imfilter(currentimage,flt);
    tmp=preprocessing(currentimage,[H W]);
    currentimage=tmp(:,:,:,1);
   % figure;imshow(currentimage);

   % filt=fspecial('average');
   %currentimage=imfilter(currentimage,filt);
   
  
   vec=imageToVector(currentimage);
  % figure ;imshow(currentimage);
   images.vec=[images.vec vec];
   images.val=[images.val  val];
end
end