class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table(:answers) do |t|
      t.column(:answer, :string)
      t.column(:question_id, :integer)

      t.timestamp
    end
  end
end
