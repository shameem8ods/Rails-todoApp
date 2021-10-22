require 'rails_helper'

RSpec.describe Task, type: :model do
  current_user = User.first
  it 'has a name' do
    task = Task.new(
      name: '',
      description: 'a valid description',
      duedate: '25-10-2021',
      user: current_user

    )
    expect(task).to_not be_valid
    task.name = 'has a name'
    expect(task).to be_valid
  end
  it 'has a name with minmum 3 and max 6 charecters' do
    task = Task.new(
      name: 'ta',
      description: 'a valid description',
      duedate: '25-10-2021',
      user: current_user

    )
    expect(task).to_not be_valid
    task.name = 'has a name'
    expect(task).to be_valid
  end

  it 'has a description' do
    task = Task.new(
      name: 'a valid name',
      description: '',
      duedate: '25-10-2021',
      user: current_user

    )
    expect(task).to_not be_valid
    task.description = 'has a description'
    expect(task).to be_valid
  end

  it 'is it valid without duedate' do
      task = Task.new(
      name: 'a valid name',
      description: 'a valid description',
      duedate: '',
      user: current_user
      )
    expect(task).to be_valid

  end

end
