class CreateDicts < ActiveRecord::Migration
  def change
    create_table :dicts do |t|
      t.text :kanji
      t.text :hiragana
      t.text :desc
    end
  end
end
