require 'rails_helper'

RSpec.describe "Tasks", type: :request do
current_user = User.first

  let(:valid_attributes) do {
    'id' => '1',
    'name' => 'test',
    'description' => 'valid description',
    'user' => current_user

  }
end

  let(:invalid_attributes) do {
     'id' => 'a',
    'name' => '1',
    'description' => 1
  }
end


  describe "GET /index" do
   it 'returns a success response' do
    task = Task.new(valid_attributes)
    task.user = current_user
    task.save
    get tasks_url
    expect response.success?
   end
  end


  describe "GET /new" do
   it 'returns a success response' do
    task = Task.new(valid_attributes)
    task.user = current_user
    task.save
    get new_task_url
    expect response.success?
   end
  end


  describe "GET /edit" do
   it 'returns a success response' do
    task = Task.new(valid_attributes)
    task.user = current_user
    task.save
    get edit_task_url(task)
    expect response.success?
   end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new task" do
        expect do
          task = Task.new(valid_attributes)
          task.user = current_user
          task.save
          post tasks_url, params: { task: valid_attributes }
      end.to change(Task, :count).by(1)
    end

    it "redirects to the task" do
          post tasks_url, params: { task: valid_attributes }
          expect(response).to redirect_to(new_user_session_url)

      end
    end
context "with invalid parameters" do
      it "does not create a new task" do
        expect {
          post tasks_url, params: { task: invalid_attributes }
        }.to change(Task, :count).by(0)
      end

      it "renders a successful response to display the new template" do
        post tasks_url, params: { task: invalid_attributes }
        expect response.success?
      end
    end
end


 describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'id' => '2',
          'name' => 'Test updated',
          'description' => 'valid updated description',
          'user' => current_user
        }
      end

      it 'updates the requested task' do
        task = Task.new(valid_attributes)
        task.user = current_user
        task.save
        patch task_url(task), params: { task: new_attributes }
        task.reload
        expect response.success?
      end

     it "redirects to the task" do
           task = Task.create! valid_attributes
        patch task_url(task), params: { task: new_attributes }
        task.reload
        expect(response).to redirect_to(new_user_session_url)

      end

    end

    context 'with invalid parameters' do
      it "renders a successful response  to display the edit template" do
        task = Task.create! valid_attributes
        patch task_url(task), params: { task: invalid_attributes }
        expect response.success?
      end
    end


     describe 'DELETE /destroy' do
    it 'destroys the requested post' do
      task = Task.new(valid_attributes)
      task.user = current_user
      task.save
      expect do
        task.delete
      end.to change(Task, :count).by(-1)
    end

  it "redirects to the tasks list" do
      task = Task.create! valid_attributes
      delete task_url(task)
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  end
end
