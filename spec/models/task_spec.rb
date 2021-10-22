require 'rails_helper'

RSpec.describe Task, type: :model do
  current_user = User.first
  it 'has a title' do
    task = Task.new(
      name: '',
      description: 'a valid body',
      duedate: '25-10-2021',
      user: current_user

    )
    expect(task).to_not be_valid
    task.name = 'has a title'
    expect(task).to be_valid
  end
  it 'has a title with minmum 3 and max 6 charecters' do
    task = Task.new(
      name: 'ta',
      description: 'a valid body',
      duedate: '25-10-2021',
      user: current_user

    )
    expect(task).to_not be_valid
    task.name = 'has a title'
    expect(task).to be_valid
  end

  it 'has a description' do
    task = Task.new(
      name: 'a valid title',
      description: '',
      duedate: '25-10-2021',
      user: current_user

    )
    expect(task).to_not be_valid
    task.description = 'has a body'
    expect(task).to be_valid
  end

  it 'is it valid without duedate' do
      task = Task.new(
      name: 'a valid title',
      description: 'a valid description',
      duedate: '',
      user: current_user
      )
    expect(task).to be_valid

  end

end
