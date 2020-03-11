function c = fCost(pos, CN)
   
   c = 0;
   m_representantes = CN(pos, :);
   CN(pos,:) = []; 
   for i=1:size(pos,2)
        dist(i,:) = d_euclid(CN',m_representantes(i,:)');
   end 
   d = min(dist);
   c = sum(d);

end