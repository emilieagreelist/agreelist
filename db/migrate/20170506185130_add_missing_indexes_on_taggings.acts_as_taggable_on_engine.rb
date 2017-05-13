# This migration comes from acts_as_taggable_on_engine (originally 6)
class AddMissingIndexesOnTaggings < ActiveRecord::Migration[5.0]
  def change
    add_index :taggings, :tag_id unless index_exists? :taggings, :tag_id
    add_index :taggings, :taggable_id unless index_exists? :taggings, :taggable_id
    add_index :taggings, :taggable_type unless index_exists? :taggings, :taggable_type
    add_index :taggings, :tagger_id unless index_exists? :taggings, :tagger_id
    add_index :taggings, :context unless index_exists? :taggings, :context

    unless index_exists? :taggings, [:tagger_id, :tagger_type]
      add_index :taggings, [:tagger_id, :tagger_type]
    end

    unless index_exists? :taggings, [:taggable_id, :taggable_type, :tagger_id, :context], name: 'taggings_idy'
      add_index :taggings, [:taggable_id, :taggable_type, :tagger_id, :context], name: 'taggings_idy'
    end
  end
end
