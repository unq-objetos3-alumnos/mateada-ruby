require "mateada"

describe "mateada" do
  it "cuando un cebador da una ronda con un mateador, este debe tomar un mate" do
    mateador = Mateador.new
    cebador = Cebador.new([mateador])

    cebador.dar_ronda

    expect(mateador.cuantos_tomaste).to be(1)
  end

  it "dado un mateador, debe haber tomado cero mates" do
    mateador = Mateador.new

    expect(mateador.cuantos_tomaste).to be(0)
  end

  it "cuando un cebador da una ronda con tres mateadores, todos deben tomar un mate" do
    mateadores = [Mateador.new, Mateador.new, Mateador.new]
    cebador = Cebador.new(mateadores)

    cebador.dar_ronda

    expect(mateadores.all? { |mateador| mateador.cuantos_tomaste == 1 }).to be(true)
  end

  it "cuando un cebador da dos ronda con tres mateadores, todos deben tomar dos mate" do
    mateadores = [Mateador.new, Mateador.new, Mateador.new]
    cebador = Cebador.new(mateadores)

    cebador.dar_ronda
    cebador.dar_ronda

    expect(mateadores.all? { |mateador| mateador.cuantos_tomaste == 2 }).to be(true)
  end
end