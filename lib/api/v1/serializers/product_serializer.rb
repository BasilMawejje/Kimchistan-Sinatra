class ProductSerializer
  def initialize(product)
    @product = product
  end

  def as_json(*)
    data = {
      id:@product.id.to_s,
      name:@product.name,
      description:@product.description,
      price:@product.price
    }
    data[:errors] = @product.errors if@product.errors.any?
    data
  end
end
