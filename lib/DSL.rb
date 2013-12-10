require "matriz.rb"
 
 class DSL
   attr_accessor :m2, :m1, :m3, :resultado, :operador, :tipom1, :tipom2
   def initialize(operador)
    
    @operador = operador

   end
   
   def to_s
     
     "#{@resultado}"
     
   end
   
   def option(string, string2)
     
    @tipom1 = string
    @tipom2 = string2
   
 
   end
 
  def operand(matriz)
    if @tipom1 == "densa"
      @m1 = MatrizDensa.densa(matriz)
    else
      @m1 = MatrizDensa.densa(matriz)
      @m1.transformar
    
  end
 
  
  def transformar
	  for i in 0..@t
	    for j in 0..@t
	     if(@m1[i][j].pos != 0)
	      @arrayi[k] = i
	      @arrayj[k] = j
	      @valores[k] = @m1[i][j].pos
	      k = k + 1
	      end
	    end  
	  end
	@m3 = MatrizDispersa.new(@arrayi, @arrayj, @valores)
  end
 
 end