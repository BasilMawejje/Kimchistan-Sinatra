require 'spec_helper'
require 'rake'

describe 'rake routes task runner', type: :task do
  before do
   Rake::Task.define_task(:route)
 end
  it "runs gracefully the routes and namespaces task" do
    expect { Rake::Task.tasks }.not_to raise_error
  end

  it "has a route task" do
    expect(Rake::Task.tasks.length).to eq 1
  end
end
