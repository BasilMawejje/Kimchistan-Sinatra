namespace '/api/v1' do
  before do
    content_type 'application/json'
  end

  get '/ingredients' do
    Ingredient.all.to_json
  end

  get '/ingredients/:id' do |id|
    ingredient = Ingredient.where(id: id).first
    halt(404, {message: 'Ingredient not found'}.to_json) unless ingredient
    IngredientSerializer.new(ingredient).to_json
  end
end
