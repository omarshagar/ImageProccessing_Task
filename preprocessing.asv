function [outputs] = preprocessing(inImage, outSize)

    [height, width] = size(inImage);
    
    [labels, count] = im2label(inImage);
    
    minOrientation = 0.0;
    
    minArea = height * width * 0.004;
    
    outputs = ones([outSize, 3, 1]);
    outputs = uint8(outputs);

    for i=1:count
    
        ith_mask = (labels == i);
    
        area = sum(ith_mask(:));
        
        if area < minArea
            
            continue;
    
        end
    
        ith_mask = repmat(ith_mask, [1, 1, 3]);
        ith_mask = uint8(ith_mask);
    
        ith_image = ith_mask .* inImage;
    
        tresh = 0.004;
        
        ith_binary = im2bw(uint8(ith_image), tresh);
        
        [L, n] = bwlabel(ith_binary, 8);
        
        pixels_per_object = sum(bsxfun(@eq, L(:), 1:n));
        
        [~, indices] = max(pixels_per_object);  
       
        biggest_region = (L == indices);
        
        % region-props
        stats = regionprops(biggest_region, 'Orientation');
        
        orientation = stats.Orientation;
    
        if orientation < minOrientation
    
            [ith_image] = imrotate(uint8(ith_image), -orientation);
      
        end
        
        ith_binary = im2bw(uint8(ith_image));
        
        %% Crop Image One More Time
        stats = regionprops(ith_binary, 'Area', 'BoundingBox');
        
        [~, indices] = sort([stats.Area],'descend');
        
        boundingBox = stats(indices(1)).BoundingBox;
        
        croppedImage = imcrop(ith_image, boundingBox);       
        croppedImage = imresize(croppedImage, outSize);
        
        croppedImage = uint8(croppedImage);        
        
        %% Append Image To The Outputs Array
        outputs(:, :, :, i) = croppedImage;
    
    end
    
    %% If Single Image
    [ ~, ~, ~,count] = size(outputs);
    
    if count == 1
    
        image = imresize(inImage, outSize);
    
        outputs(:, :, :, 1) = uint8(image);

    end

end