require './matriz.rb'

class DslMatrices
  
  attr_accessor :tipom1, :tipom2, :operador, :tipom1, :tipom2, :result, :operandos
	def initialize (operador, &block)
	  @operador = operador
	  @operandos = []
	  @result = []
	  instance_eval &block
	 
	end
  
       
        def to_s
	      "#{@result}"
     
	end
      
      
       def tipo(tipo1, tipo2)
	 @tipom1 = tipo1
	 @tipom2 = tipo2
       end
       
       def operando(matriz1, matriz2)
	 if(@tipom1 == "densa")

	    m1 = MatrizDensa.densa(matriz1)
	    
	  else
	 m1 = MatrizDispersa.new(matriz1[0],matriz1[1],matriz1[2])
	 end
	 
	 if(@tipom2 == "densa")
	    m2 = MatrizDensa.densa(matriz2)
	 else 
	   
	 m2 = MatrizDispersa.new(matriz2[0],matriz2[1],matriz2[2])
	 
	 end
	 @operandos << m1
	 @operandos << m2
	
	 if (@operandos.size == 2)
	   if (@operandos[0].instance_of?MatrizDispersa and @operandos[1].instance_of?MatrizDispersa)
	                        @result=MatrizDispersa.new(matriz1[0],matriz1[1],matriz1[2])
                        else
                                @result=MatrizDensa.densa([[0, 0], [0, 0]])
	  end
       end
		
       	
		 if (@operador == "suma")
	                @result.igual(@operandos[0] + @operandos[1])
	
                end
                
                if (@operador == "resta")
                        @result.igual(@operandos[0] - @operandos[1])
                end

                if (@operador == "max")
                        @result.igual(@operandos[0]).max
                end

                if (@operador == "min")
                        @resultado.igual(@operandos[0]).min
                end
       end
       
       
end

sumaDensas = DslMatrices.new("suma") do
        tipo "densa","densa"
        operando [[8, 16], [21, 34]], [[8, 16], [21, 34]]
end

sumaDispersas = DslMatrices.new("suma") do
        tipo "dispersa","dispersa"
        operando [[0, 1], [0 ,1], [1, 1]], [[0, 1], [0 ,1], [1, 1]]
end

restaDensas = DslMatrices.new("resta") do
	tipo "densa","densa"
	operando [[8, 16], [21, 34]], [[8, 16], [21, 34]]
end

restaDispersas = DslMatrices.new("resta") do
	tipo "dispersa","dispersa"
	 operando [[0, 1], [0 ,1], [1, 1]], [[0, 1], [0 ,1], [1, 1]]
end

sumaDispersaDensa = DslMatrices.new("suma") do
	tipo "dispersa","densa"
	operando [[0, 1], [0 ,1], [1, 1]], [[8, 16], [21, 34]]
end

restaDispersaDensa = DslMatrices.new("resta") do
	tipo "dispersa","densa"
	operando [[0, 1], [0 ,1], [1, 1]], [[8, 16], [21, 34]]
end
puts "Suma densas"
puts sumaDensas
puts "Suma dispersas"
puts sumaDispersas
puts "Restas densas"
puts restaDensas
puts "Resta dispersas"
puts restaDispersas
puts "Suma dispersa densa"
puts sumaDispersaDensa
puts "Resta dispersa densa"
puts restaDispersaDensa