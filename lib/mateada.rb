class Mate
  def initialize(ronda)
    @ronda = ronda
  end

  def ya_tomo?(mateador)
    @ronda.ya_tomo?(mateador)
  end

  def tomo(mateador)
    @ronda.tomo(mateador)
  end
end

class Cadena
  def initialize(mateadores)
    @siguientes = mateadores
  end

  def pasar_mate(mate)
    unless @siguientes.empty?
      siguiente, *resto = @siguientes
      @siguientes = resto
      siguiente.recibir_mate(mate, self)
    end
  end
end

class Ronda
  def initialize(mateadores)
    @mateadores = mateadores
    @tomaron = []
  end

  def iniciar_pasada(mate)
    cadena = Cadena.new(@mateadores)
    cadena.pasar_mate(mate)
  end

  def ya_tomo?(mateador)
    @tomaron.include?(mateador)
  end

  def tomo(mateador)
    @tomaron.push(mateador)
  end

  def todos_tomaron?
    @tomaron.size == @mateadores.size
  end
end

class Cebador
  def initialize(mateadores)
    @mateadores = mateadores
  end

  def dar_ronda
    ronda = Ronda.new(@mateadores)
    until ronda.todos_tomaron?
      ronda.iniciar_pasada(Mate.new(ronda))
    end
  end
end

class Mateador
  attr_reader :cuantos_tomaste

  def initialize
    @cuantos_tomaste = 0
  end

  def recibir_mate(mate, cadena)
    if mate.ya_tomo?(self)
      cadena.pasar_mate(mate)
    else
      @cuantos_tomaste += 1
      mate.tomo(self)
    end
  end
end