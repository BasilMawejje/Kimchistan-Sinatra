class IngredientSerializer
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def as_json(*)
    data = {
      id:@ingredient.id.to_s,
      name:@ingredient.name,
      available:@ingredient.available,
    }
    data[:errors] = @ingredient.errors if@ingredient.errors.any?
    data
  end
end
