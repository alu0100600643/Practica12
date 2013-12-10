#Practica realizada por: Miguel Aurelio García González y Daura Hernández Díaz
#En esta practica desarrollamos tres clases, la clase Matriz, MatrizDensa y MatrizDispersa.
#La clase Matriz será la madre de las otras dos.


class Matriz

	attr_accessor :m, :t
	
#definición del método initialize, donde crearemos la matriz que usaremos posteriormente y obtendremos su tamaño
	def initialize(matriz)
	    if matriz != nil
      	
		@t = matriz.size-1
	   end 
	   @m = matriz
		
	end
	def get_t
	     return @t
	end
	
	def + (other)
	
	end
	
	def - (other)
	  
	end
	
	def * (other)
	 
	end
	
	def pos(a, b)
	  
	end
	
	def to_s
	 
	end

	
end


#Definición e implementación de la clas MatrizDensa, que como vemos hereda de la clase Matriz definida anteriormente.
class MatrizDensa < Matriz

  private_class_method :new
#Hacemos el new privado, utilizandolo posteriormente en un método que hemos creado, dentro del cual llamamos al constructor de la clase Matriz  
  def Matriz.densa (matriz)
	new(matriz)
    
  end
#Max es un método que nos devolverá el mayor elemento que contenga la matriz densa
# El valor que tendremos como referencia es el que se encuentre en la posición (0,0) de la matriz, comparandolo luego con el resto de los valores
  def max
    elemenmax = @m[0][0]
    for i in 0..@t
      for j in 0..@t
	if(elemenmax < @m[i][j])
	  elemenmax = @m[i][j]
	end
      end
    end
    return elemenmax
  end
  
# El método min devolverá el elemento mínimo de la matriz
  def min
    elemenmin = @m[0][0]
    for i in 0..@t
      for j in 0..@t
	if(elemenmin > @m[i][j])
	  elemenmin = @m[i][j]
	end
      end
    end
    return elemenmin
    
  end
#El siguiente método realiza la suma entre dos matrices, pueden ser densa-densa o densa-dispersa
  def +(m2)
 
    if m2.instance_of?MatrizDispersa
     result = MatrizDensa.densa(@m)
     
	 (@t+1).times do |i|
	   (@t+1).times do |j|  
	    encontrado = 0
	    (m2.arrayi.size+1).times do |k|
	      if (i==m2.arrayi[k] and j==m2.arrayj[k] and encontrado==0)
		result.m[i][j] = (result.m[i][j]) + (m2.valores[k])
                encontrado = 1        
              end
            end
           
           end
       end
     else
        result = MatrizDensa.densa(m2.m)
	 (@t+1).times do |i|
	   (@t+1).times do |j|
		result.m[i][j] = @m[i][j] + result.m[i][j]
	    end
	  end
      end
      
      return result
 end          
		
		
		
# El siguiente método realiza la resta de dos matrices, como comentabamos anteriormente las matrices pueden ser densa-densa o densa-dispersa	
  def -(m2)

    if m2.instance_of?MatrizDispersa
      result = MatrizDensa.densa(@m)

      for i in (0..@t)
	  for j in (0..@t)
	    encontrado = 0
            for k in (0...m2.arrayi.size)
	      if (i==m2.arrayi[k] and j==m2.arrayj[k] and encontrado==0)
		result.m[i][j] = (result.m[i][j]) - (m2.valores[k])
                encontrado = 1        
              end
            end
           
           end
         end
      else
        result = MatrizDensa.densa(m2.m)

	for i in 0..@t do
			for j in 0..@t do
				result.m[i][j] = @m[i][j] - result.m[i][j] 
			end
		end
      end
      
      return result
 end
 
# El método * realiza la multiplicación entre dos matrices densas
	def *(m2)
   	 
   	 mat = Array.new(@t+1){Array.new(@t+1)}
   	 
	
	 (@t+1).times do |i|
	   (@t+1).times do |j|
   			 mat[i][j]=0;
   		 end
    	end

   	 
    	m_resultado = Matriz.new(mat)
   	 
	(@t+1).times do |i|
	  (@t+1).times do |j|
	    (@t+1).times do |k|
                	m_resultado.m[i][j] += @m[i][k] * m2.m[k][j]
            	end
           	 
        	end
    	end
	  return m_resultado
	end

#Con este método podemos acceder al valor de una posición determinada de la matriz
	def pos(a, b)
	 
	   @m[a][b]
	   
	end
	
#El método to_s devuelve la matriz en otro formato
	def to_s
	  "#{@mat}"
	end
	
	
	
	def encontrar
	  (@t+2).times do |i|
	   (@t+2).times do |j| 
	    if yield(@m[i][j])
	      return [i,j]
	    end
	   end
	  end
	end
      
 end

#Definición e implementación de la clase MatrizDispersa
#MatrizDispersa hereda de Matriz
class MatrizDispersa < Matriz
  attr_accessor :arrayi, :arrayj , :valores
  
#Dentro del método initialize creamos tres vectores, el vector arrayi contendrá las posiciones de i, arrayj las posiciones de j y valores contendrá
# los valores no nulos que contenga la matriz.
  def initialize(i, j, v)
    
    @arrayi = i
    @arrayj = j
    @valores = v

  end
# El método pos nos permite acceder al valor de una posición determinada   
  def pos(a,b)
    for i in 0...@arrayi.size
      if((@arrayi[i] == a) and (@arrayj[i] == b))
	return @valores[i]
      end
    end
    return nil
  end
#Método max para devolver el mayor elemento de la matriz 
  def max
    elemenmax = @valores[0]
    for i in 0...@arrayi.size
      if(elemenmax < @valores[i])
         elemenmax = @valores[i]
      end
    end
    return elemenmax
  end
  
#Método min que devuelve el menor elemento de la matriz 
  def min
     elemenmin = @valores[0]
    for i in 0...@arrayi.size
      if(elemenmin > @valores[i])
         elemenmin = @valores[i]
      end
    end
    return elemenmin
  end
  
#Suma de matrices, bien pueden ser dispersa-dispersa o dispersa-densa  
 def +(m2)
   if m2.instance_of?MatrizDensa
     result = MatrizDensa.densa(m2.m)
     
	 (m2.t+1).times do |i|
	   (m2.t+1).times do |j| 
	  encontrado = 0
	      (@arrayi.size).times do |k|
	      if (i==@arrayi[k] and j==@arrayj[k] and encontrado==0)
		result.m[i][j] = (result.m[i][j]) + (@valores[k])
                encontrado = 1        
	      end
            end
         end
      
     end
     return result
   else
      result = MatrizDispersa.new(@arrayi, @arrayj, @valores)
    
      (m2.arrayi.size).times do |j|
	encontrado = false
	(m2.arrayi.size+1).times do |k|
	  if((m2.arrayi[j]) == result.arrayi[k] and m2.arrayj[j] == result.arrayj[k])
	    result.valores[k] = result.valores[k] + m2.valores[j]
	    encontrado = true
	  end
	
	end
	
	  if(encontrado == false)
	    result.arrayi << m2.arrayi[j]
	    result.arrayj << m2.arrayj[j]
	    result.valores << m2.valores[j]
	  end
      end	                              
      return result
   end
      
 end

#Resta de dos matrices
    def -(m2)
   if m2.instance_of?MatrizDensa
     result = MatrizDensa.densa(m2.m)
     
     for i in (0..m2.t)
	for j in (0..m2.t)
	  encontrado = 0
	    for k in (0...@arrayi.size)
	      if (i==@arrayi[k] and j==@arrayj[k] and encontrado==0)
		result.m[i][j] = (result.m[i][j]) - (@valores[k])
                encontrado = 1        
	      end
            end
         end
      
     end
     return result
   else
      result = MatrizDispersa.new(@arrayi, @arrayj, @valores)
    
      for j in (0...m2.arrayi.size)
	encontrado = false
	for k in (0...m2.arrayi.size)
	  if((m2.arrayi[j]) == result.arrayi[k] and m2.arrayj[j] == result.arrayj[k])
	    result.valores[k] = result.valores[k] - m2.valores[j]
	    encontrado = true
	  end
	
	end
	
	  if(encontrado == false)
	    result.arrayi << m2.arrayi[j]
	    result.arrayj << m2.arrayj[j]
	    result.valores << m2.valores[j]
	  end
      end	                              
      return result
   end
 end
 
#Multiplicacion de dos matrices dispersa*dispersa
 def *(m2)
    result = MatrizDispersa.new(@arrayi, @arrayj, @valores)
    
      (m2.arrayi.size).times do |j|
	(m2.arrayi.size).times do |k|
      #for j in (0...m2.arrayi.size)
	
	#for k in (0...m2.arrayi.size)
	  if((m2.arrayi[j]) == result.arrayi[k] and m2.arrayj[j] == result.arrayj[k])
	    result.valores[k] = result.valores[k] * m2.valores[j]
	  end
   
	end
      end
      return result
  end
   
end

