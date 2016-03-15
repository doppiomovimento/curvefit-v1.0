function FlashingStr = jFlashingStrStream(StringContent)

Strlength = size(StringContent, 2);

rArray = rand(1, Strlength);
FlashingStr = cell(25, 1);

for i = 1:Strlength
   if (rArray(1, i) < 0.5)
       rArray(1, i) = i/Strlength - 0.3*rand(1, 1);
   else
       rArray(1, i) = i/Strlength + 0.25*rand(1, 1);
              
   end
     
end

clear i
j = 1;

for i = 1:25
    if (i <= 10)
        while (j <= 0.1*(i + 1)*Strlength)
            if (rand(1, 1) < (0.4 + i * 0.03))
                rChr = char(uint8(rand(1, 1)*(96 - 32) + 32));                
            else
                rChr = char(uint8(45));
                
            end
            FlashingStr(i, 1) = {[FlashingStr{i, 1} rChr]};
            j = j + 1;
            
        end
    elseif ((i > 10) && (i < 23))
        if (rand(1, 1) < 0.5)
            tStrlength = Strlength - uint8(rand(1, 1)*2);
        else
            tStrlength = Strlength + uint8(rand(1, 1)*3);           
        end
        
       
        while (j <= tStrlength)
            if (j <= Strlength)
               if (rArray(1, j) < ((i - 9) * (0.066))) 
                    rChr = StringContent(1, j);
               else
                    if (rand(1, 1) < (0.4 + i * 0.04))
                        rChr = char(uint8(rand(1, 1)*(96 - 32) + 32));                
                    else
                        rChr = char(uint8(45));
                
                    end
               end
            else
                if (rand(1, 1) < (0.4 + i * 0.04))
                    rChr = char(uint8(rand(1, 1)*(96 - 32) + 32));                
                else
                    rChr = char(uint8(45));
                
                end
            end
            FlashingStr(i, 1) = {[FlashingStr{i, 1} rChr]};
            j = j + 1;
            
        end
        
    else
        while (j <= Strlength)
            if (rArray(1, j)/1.2 < ((i - 9) * (0.066)))
                rChr = StringContent(1, j);                
            else
                rChr = char(uint8(45));
                
            end
            FlashingStr(i, 1) = {[FlashingStr{i, 1} rChr]};
            j = j + 1;
            
        end
        
    end
    j = 1;
    tStrlength = 0;
    
    
    
    
end