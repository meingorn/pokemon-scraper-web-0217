class Pokemon
  attr_accessor :name, :type, :db, :id


  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id=?", id)
    pokemon = poke[0]
    new_poke = self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end

end
