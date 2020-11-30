if grating==0;
coordinate_united_x_=[];
coordinate_united_y_=[];

for ll=1:1:number_of_layers
    coordinate_united_x_=[coordinate_united_x_,eval(['coordinate_x_' num2str(ll)])];
    coordinate_united_y_=[coordinate_united_y_,eval(['coordinate_y_' num2str(ll)])];
end


% vytvořit společné souřadnice coordinate_x a coordinate_y
coordinate_united_x=unique(sort(coordinate_united_x_));
coordinate_united_y=unique(sort(coordinate_united_y_));

new_r_index_1=zeros(length(coordinate_united_y)-1,length(coordinate_united_x)-1);

for ll=1:1:number_of_layers
    
    new_r_index=zeros(length(coordinate_united_y)-1,length(coordinate_united_x)-1);
    x_r_index=zeros(length(coordinate_united_x)-1);
    y_r_index=zeros(length(coordinate_united_y)-1);
    
    
    coordinate_x_ll=eval(['coordinate_x_' num2str(ll)]);
    coordinate_y_ll=eval(['coordinate_y_' num2str(ll)]);
    r_index_ll=eval(['r_index_' num2str(ll)]);
    
    for i=1:1:length(coordinate_united_x)-1
        pos_x=(coordinate_united_x(i)+coordinate_united_x(i+1))/2;
        x_r_index(i)=find(coordinate_x_ll<pos_x,1,'last');
        %x_r_index(i)=binarySearch(coordinate_x_ll, pos_x, 'last','down');
    end
    
    for i=1:1:length(coordinate_united_y)-1
        pos_y=(coordinate_united_y(i)+coordinate_united_y(i+1))/2;
        y_r_index(i)=find(coordinate_y_ll<pos_y,1,'last');
        %y_r_index(i)=binarySearch(coordinate_y_ll, pos_y, 'last','down');
    end
    
    for i=1:1:length(coordinate_united_x)-1
        %pos_x=(coordinate_united_x(i)+coordinate_united_x(i+1))/2;
        %x_r_index=binarySearch(coordinate_x_ll, pos_x, 'last','down');
        j=1:1:length(coordinate_united_y)-1;       
                    
            %pos_y=(coordinate_united_y(j)+coordinate_united_y(j+1))/2;        
            %new_r_index(j,i)=get_epsilon(pos_x,pos_y,coordinate_x_ll,coordinate_y_ll,r_index_ll);
            
            %y_r_index=binarySearch(coordinate_y_ll, pos_y, 'last','down');
            new_r_index(j,i)=r_index_ll(y_r_index(j),x_r_index(i));
        %end
    end
    eval(['new_r_index_' num2str(ll), '=new_r_index;']);
end
end
