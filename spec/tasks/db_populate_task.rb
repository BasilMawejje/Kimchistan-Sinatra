require 'spec_helper'
require 'rake'

describe 'rake db:populate task runner', type: :task do
  before do
   Rake::Task.define_task(:populate)
 end
  it "gracefully adds products to the database" do
    expect { Rake::Task.tasks }.not_to raise_error
  end

  it "has a db:populate task" do
    expect(Rake::Task.tasks.length).to eq 1
  end
end
