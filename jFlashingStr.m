function jFlashingStr(hdl, StrContent, dur)

paustime = dur/25;
FlaStr = jFlashingStrStream(StrContent); 

for i = 1:2:25
   
   set(hdl, 'String', FlaStr{i, 1}) 
   pause(paustime)    
    
end