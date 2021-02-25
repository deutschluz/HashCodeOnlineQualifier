

function readFirstLn(fn,mode,simLen,numOfInters,numOfStrs,numOfCars,Score)
   --set file handle of first file
   local f1= io.open(fn,mode)
   --if f1 is nil
   local linecount=1
   if not f1 then print("something's wrong!") return 
   else
     --first line has to receive global info about problem

      for line in f1:lines() do
         -- if line is first
	 if linecount==1 then
	 --  read line into the vars: simLen,numOfinters,...etc
            simLen,numOfInters,numOfStrs,numOfCars,Score=string.match(line,"(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)")
            linecount=linecount+1
	    goto continue
	 else
	    goto break
         end
	 ::continue::
      end
      ::break::
   end
end


function main()
  --read first line to set global problem parameters
  simLen,numOfInters,numOfStrs,numOfCars,Score=0,0,0,0,0
  readFirstLn(fn,mode,simLen,numOfInters,numOfStrs,numOfCars,Score)

  --init a digraph to represent the city plan
  --1. with n=numOfInters vertexes
  --2. each v hast to have attribute v.ind and v.outd
  -- to represent the in-degree and out-degree of each vertex
  --3. each edge e has consists of (n,m),name,len
  -- in theory, vertexes correspond to intersections and
  -- edges correspond to streets.
  cGph=digraph:new(numOfInters)
  readStrtNCars(fn,mode,cGph,numOfCars)
  