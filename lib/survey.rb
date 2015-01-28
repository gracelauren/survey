class Survey < ActiveRecord::Base
  has_many :questions, -> {order('order_num')}
  validates(:name, {:presence => true})
  before_save(:capitalize_name)

  define_method(:change_order) do |order_nums|
    counter = 0

    self.questions().each() do |question|
      if order_nums[counter] != ""
        new_order_num = order_nums[counter].to_i()
        question.update({ :order_num => new_order_num })
      end
      counter += 1
    end
  end

private

  define_method(:capitalize_name) do
    self.name = (name().split.map(&:capitalize).join(' '))
  end

end
