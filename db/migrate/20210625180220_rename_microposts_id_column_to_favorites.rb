class RenameMicropostsIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :microposts_id, :micropost_id
  end
end
