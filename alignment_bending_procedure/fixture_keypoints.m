function keypoints=fixture_keypoints(fixture_height, fixture_offset, n_keypoints)

    keypoints=zeros(2*n_keypoints,1);
    
    radius = 0.285;

    %linspace of angles
    
    angles = linspace(-pi/3,pi/3,n_keypoints);
    
    for i=1:2:2*n_keypoints
        
        y=radius*sin(angles((i+1)/2));
        z=radius*cos(angles((i+1)/2));
        
        keypoints(i)=y+fixture_offset;
        keypoints(i+1)=z+fixture_height;
        
    end
    
end
