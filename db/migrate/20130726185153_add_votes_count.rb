class AddVotesCount < ActiveRecord::Migration


def self.up
  add_column :poems, :votes_count, :integer, :default => 0

  Poem.reset_column_information
  Poem.find(:all).each do |p|
    Poem.update_counters p.id, :votes_count => p.votes.length
  end
end

def self.down
  remove_column :poems, :votes_count
end

  
end
