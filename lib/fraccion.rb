#require "./lib/gcd.rb"
#require "./lib/comparable.rb"

class Fraccion

	include Comparable

	attr_accessor :n, :d

	def initialize(n, d)
		@n = n
		@d = d
	end

	def num
		@n
	end

	def denom
		@d
	end

	def reduce
		a = @n
		b = @d
		
		if a < b
			x = a
		else
			x = b
		end

		reducida = false

	while (x>1 && !reducida) do
		if (a%x == 0) && (b%x == 0)
			a = a/x
			b = b/x
			reducida = true
		else
			x = x - 1
		end
	end

		@n = a
		@d = b
		self.to_s
	end

	def to_s
		"#{@n}/#{@d}"
	end

	def to_f
		(n.to_f/d.to_f)
	end

	def ==(fr2)
		return @n = fr2.n && @d = fr2.d if fr2.instance_of? Fraccion 
		false
	end

	def abs
		a = @n
		b = @d

		if a < 0
			a = a * -1
		end
		
		if b < 0
			b = b * -1
		end
		
		@n = a 
		@d = b
	end

	def reciprocal
		Fraccion.new(@d, @n)
	end

	def -@
		Fraccion.new(-@n, -@d)
	end

	def +(fr2)
	  if fr2.is_a? Integer
	    
	    fr2 = Fraccion.new(fr3, 1)
	  end 
		d = @d * fr2.d
		Fraccion.new(((d/@d) * @n) + ((d/fr2.d) * fr2.n), d).reduce
	end	
	
	def -(fr2)
	  if fr2.is_a? Integer
	    fr2 = Fraccion.new(fr3, 1)
	  end
		d = @d * fr2.d
		Fraccion.new(((d/@d) * @n) - ((d/fr2.d) * fr2.n), d).reduce	
	end

	def *(fr2)
		Fraccion.new(@n * fr2.n, @d * fr2.d).reduce
	end
	def coerce(fr2)
	  [Fraccion.new(fr2, 1), self]	
	end

	def /(fr2)
		Fraccion.new(@n * fr2.d, @d * fr2.n).reduce
	end

	def %(fr2)
		Fraccion.new(@n % @d, fr2.n % fr2.d).reduce
	end
	
	

end	


