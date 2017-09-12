require 'rails_helper'

describe 'rake billing:send_invoices', type: :task do

  it 'preloads the Rails environment' do
    expect(task.prerequisites).to include 'environment'
  end

  it 'runs gracefully with no subscribers' do
    expect { task.execute }.not_to raise_error
  end

  it 'logs to stdout' do
    expect(Sheet.count).to eq 0
    task.execute
    expect(Sheet.count).to eq 129
    expect { task.execute }.to output("#{File.read(Rails.root.join('spec/fixtures/output.rb'))}\n").to_stdout
  end
  
end